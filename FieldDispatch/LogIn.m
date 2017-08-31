//
//  LogIn.m
//  FieldDispatch
//
//  Created by Ｍasqurin on 2017/7/21.
//  Copyright © 2017年 Ｍasqurin. All rights reserved.
//

#import "LogIn.h"

#define UPDATE_DEVICE_TOKEN @"updateDaviceToken.php"
#define CREATE_ACCOUNT @"createAccount.php"
#define REPORT_STATUS @""

static LogIn *login = nil;

@implementation LogIn
{
    MemberDatabase *mdb;
}

+(instancetype)sharedInstance{
    if (login == nil) {
        login = [LogIn new];
    }
//    [[MemberDatabase stand].signInData setValue:@([MemberDatabase stand].memberId) forKey:@"memberId"];
//    [[MemberDatabase stand].signInData setValue:@([MemberDatabase stand].memberType) forKey:@"memberType"];
//    [[MemberDatabase stand].signInData setValue:@([MemberDatabase stand].deviceType) forKey:@"deviceType"];
//    [[MemberDatabase stand].signInData setObject:[MemberDatabase stand].deviceToken forKey:@"deviceToken"];
//    [[MemberDatabase stand].signInData setValue:@([MemberDatabase stand].signInType) forKey:@"memberSingInType"];
//    [[MemberDatabase stand].signInData setValue:[MemberDatabase stand].memberAccount forKey:@"memberAccount"];
//    [[MemberDatabase stand].signInData setValue:[MemberDatabase stand].password forKey:@"password"];
//    [[MemberDatabase stand].signInData setValue:@([MemberDatabase stand].status) forKey:@"memberStatus"];
    return login;
}

-(BOOL)didLogin{
    BOOL tryLogin;
    if ([MemberDatabase stand].memberId == 0) {
        tryLogin = false;
        NSLog(@"沒有登入");
    }else{
        NSLog(@"我是memberId: %d",[MemberDatabase stand].memberId);
        tryLogin = true;
        NSLog(@"已登入");
        
    }
    return tryLogin;
}

-(void)newDevice:(IsOnlion)onlion{
    [[HttpConnection stand] newDeviceWithFinish:^(NSError *error, id result) {
        
        if (error) {
            NSLog(@"%@",error.description);
            return ;
        }
        NSDictionary *resultMemo = (NSDictionary*)result;
        BOOL server = [resultMemo[@"result"] boolValue];
        if (server == true) {
            [MemberDatabase stand].memberId = [resultMemo[@"memberId"] intValue];
            [MemberDatabase stand].memberType = [resultMemo[@"memberType"] intValue];
            if (onlion) {
                onlion(nil,true);
            }
            NSLog(@"\n我是memberId: %d\n我是memberType: %d",[MemberDatabase stand].memberId,[MemberDatabase stand].memberType);
        }else{
            NSString *error = resultMemo[@"errorCode"];
            NSLog(@"\n我是問題%@",error);
        }
    }];
}

-(void)upDateDeviceToken:(NSString *)deviceToken
                memberId:(NSString *)memberId
     transmissionResults:(FinishMessage)resoult{
    
    //deviceType    1.iOS   2.Andreod   3.other...
    NSMutableDictionary *par = [NSMutableDictionary new];
    [par addEntriesFromDictionary:@{@"memberId":memberId,
                                    @"deviceType":@"1",
                                    @"deviceToken":deviceToken}];
    [[HttpConnection stand]
     doPostWithURLString:UPDATE_DEVICE_TOKEN
     parameters:par
     data:nil
     finish:resoult];
}

-(void)signInAccount:(NSString *)account
            memberId:(NSInteger)memberId
    memberSingInType:(NSInteger)memberSingInType
            nickName:(NSString *)nickName
            password:(NSString *)password
               photo:(NSString *)photo
                mail:(NSString *)mail
 transmissionResults:(FinishMessage)result{
    
    NSString *deviceToken = [[NSUserDefaults standardUserDefaults] objectForKey:@"deviceToken"];
    if (deviceToken == nil) {
        NSLog(@"抓不到deviceToken");
        deviceToken = @"測試用DeviceToken";
//        return;
    }
    
    NSDictionary *par = @{@"account":account,
                          @"signInType":@(memberSingInType),
                          @"nickName":nickName,
                          @"password":password,
                          @"photo":photo,
                          @"memberId":@(memberId),
                          @"deviceType":@(1),
                          @"mail":mail,
                          @"deviceToken":deviceToken
                          };
    
    [[HttpConnection stand] doPostWithURLString:CREATE_ACCOUNT
                                     parameters:par
                                           data:nil
                                         finish:result];
}

-(void)reportStatus:(Res)responser{
    
    NSMutableDictionary *aa = [NSMutableDictionary new];
    [aa addEntriesFromDictionary:[MemberDatabase stand].signInData];
    [aa setValue:@([MemberDatabase stand].location.coordinate.latitude) forKey:@"lat"];
    [aa setValue:@([MemberDatabase stand].location.coordinate.longitude) forKey:@"lon"];
    [[HttpConnection stand] doPostWithURLString:@"ReportStatus.php" parameters:aa data:nil finish:^(NSError *error, id result) {
        NSMutableDictionary *res = [NSMutableDictionary new];
        if (error) {
            res[@"result"] = @"fales";
            res[@"error"] = error.description;
            responser(res);
        }
        if (result) {
            res[@"result"] = @"true";
            res[@"responser"] = result;
            responser(res);
        }

    }];
    
    
    
//    
//    NSDictionary *par = @{
//                          @"memberId":[NSString stringWithFormat:@"%d",[MemberDatabase stand].memberId],
//                          @"memberStatus":[NSString stringWithFormat:@"%d",[MemberDatabase stand].status],
//                          @"memberLat":[NSString stringWithFormat:@"%f",[MemberDatabase stand].location.coordinate.latitude],
//                          @"memberLon":[NSString stringWithFormat:@"%f",[MemberDatabase stand].location.coordinate.longitude]};
//    [[HttpConnection stand]
//     doPostWithURLString:REPORT_STATUS
//     parameters:par data:nil
//     finish:^(NSError *error, id result) {
//         
//         NSMutableDictionary *res = [NSMutableDictionary new];
//         if (error) {
//             res[@"result"] = @"fales";
//             res[@"error"] = error.description;
//             responser(res);
//         }
//         if (result) {
//             res[@"result"] = @"true";
//             res[@"responser"] = result;
//             responser(res);
//         }
//         
//    }];

}



@end
