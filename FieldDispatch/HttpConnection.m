//
//  HttpConnection.m
//  FieldDispatch
//
//  Created by Ｍasqurin on 2017/7/31.
//  Copyright © 2017年 Ｍasqurin. All rights reserved.
//

#import "HttpConnection.h"
#import <AFNetworking.h>

//#define BASE_URL @"https://masqurin.000webhostapp.com/FieldDispatch/"
#define BASE_URL @"http://35.194.156.9/FieldDispatch/"
//#define NEW_DEVICE [BASE_URL stringByAppendingPathComponent:@"newDevice.php"]
#define NEW_DEVICE @"newDevice.php"


static HttpConnection *http = nil;

@implementation HttpConnection
{
    
}
+(instancetype)stand{
    if (http == nil) {
        http = [HttpConnection new];
    }
    return http;
}

-(void) newDeviceWithFinish:(FinishMessage)finish{

    NSString *deviceToken = [MemberDatabase stand].deviceToken;
    if (deviceToken == nil) {
        deviceToken = @"測試DeviceToken";
    }
    //deviceType    1.iOS   2.Andreod   3.other...
    NSDictionary *par = @{@"deviceType":@([MemberDatabase stand].deviceType),
                          @"deviceToken":deviceToken};
    [self doPostWithURLString:NEW_DEVICE
                   parameters:par data:nil
                   finish:finish];
}


#pragma mark - Private Methord to handle POST job.
-(void) doPostWithURLString:(NSString*)     urlString
                 parameters:(NSDictionary*) parameters
                       data:(NSData* )      data
                     finish:(FinishMessage) finish{
    
    NSError *error = nil;
    NSMutableDictionary *par = [NSMutableDictionary new];
    [par addEntriesFromDictionary:parameters];
    [par addEntriesFromDictionary:[MemberDatabase stand].signInData];
    NSData *jsonData = [NSJSONSerialization
                        dataWithJSONObject:parameters
                        options:NSJSONWritingPrettyPrinted
                        error:&error];
    
    if (error) {
        NSLog(@"NSJSONSeroalization Error:%@",error.description);
        finish(error,nil);
        return;
    }
    
    NSString *jsonString = [[NSString alloc]
                            initWithData:jsonData
                            encoding:NSUTF8StringEncoding];
    NSLog(@"doPost Parameters:%@",jsonString);
    
    NSDictionary *finalParameters = @{@"FieldDispatch":jsonString};
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    
    NSString *url = [BASE_URL stringByAppendingString:urlString];
    [manager POST:url
       parameters:finalParameters
        constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
    
            if (data != nil) {
                [formData appendPartWithFileData:data
                                            name:@"fileToUpload"
                                        fileName:@"image.jpg"
                                        mimeType:@"image/jpg"];
            }
        }
         progress:^(NSProgress * _Nonnull uploadProgress) {
             //回報進度
         }
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              
              NSLog(@"doPOST OK:%@",responseObject);
              if (finish) {
                  finish(nil,responseObject);
                  
                  NSDictionary *peopleInfo = responseObject[@"peopleInfo"];
                  if (peopleInfo) {
                      [MemberDatabase stand].people = [[PeopleInfoVO alloc] initFromData:peopleInfo];
                  }
                  
                  NSDictionary *missionInfo = responseObject[@"missionInfo"];
                  if (missionInfo) {
                      [MemberDatabase stand].mission = [[MissionDatabaseVO alloc] initWithData:missionInfo];
                  }
                  NSDictionary *memberInfo = responseObject[@"memberInfo"];
                  if (memberInfo) {
                      [MemberDatabase stand].signInData = (NSMutableDictionary*)memberInfo;
                  }
                  
              }
          }
          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              
              NSLog(@"doPOST Fail:%@",error);
              if (finish) {
                  finish(error,nil);
              }
          }];
}


@end
