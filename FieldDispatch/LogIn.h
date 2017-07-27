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




@interface LogIn : NSObject

@property(nonatomic,assign) BOOL tryLogin;
@property(readonly,nonatomic,weak) NSDictionary *loginInfo;
+(instancetype) sharedInstance;
-(BOOL)didLogin;
-(NSDictionary*)getLoginInfo;
-(NSArray*)getAccountList;
-(NSString*) getUserID;

@end
