//
//  HttpConnection.h
//  FieldDispatch
//
//  Created by Ｍasqurin on 2017/7/31.
//  Copyright © 2017年 Ｍasqurin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FieldDispatchDataBase.h"

typedef void (^FinishMessage)(NSError *error,id result);

@interface HttpConnection : NSObject

+(instancetype)stand;
-(void) newDeviceWithFinish:(FinishMessage)finish;
-(void) doPostWithURLString:(NSString*)     urlString
                 parameters:(NSDictionary*) parameters
                       data:(NSData* )      data
                     finish:(FinishMessage) finish;
@end
