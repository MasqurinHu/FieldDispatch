//
//  LogIn.h
//  FieldDispatch
//
//  Created by Ｍasqurin on 2017/7/21.
//  Copyright © 2017年 Ｍasqurin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FieldDispatchDataBase.h"
#import <FBSDKCoreKit.h>
#import <FBSDKLoginKit.h>
#import <GoogleSignIn/GoogleSignIn.h>
#import "AppDelegate.h"

typedef void (^IsOnlion)(NSError *error,BOOL result);
typedef void (^FinishMessage)(NSError *error,id result);
typedef void (^Res)(NSDictionary* res);


@interface LogIn : NSObject

@property(nonatomic,assign) BOOL tryLogin;
@property(readonly,nonatomic,strong) NSDictionary *loginInfo;


+(instancetype) sharedInstance;
-(BOOL)didLogin;
-(void)newDevice:(IsOnlion)onlion;
-(void)upDateDeviceToken:(NSString*)deviceToken
                memberId:(NSString*)memberId
     transmissionResults:(FinishMessage)resoult;

-(void)signInAccount:(NSString*)account
            memberId:(NSInteger)memberId
    memberSingInType:(NSInteger)memberSingInType
            nickName:(NSString*)nickName
            password:(NSString*)password
               photo:(NSString*)photo
                mail:(NSString*)mail
 transmissionResults:(FinishMessage)result;

-(void)reportStatus:(Res)responser;


@end
