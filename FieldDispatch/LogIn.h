//
//  LogIn.h
//  FieldDispatch
//
//  Created by Ｍasqurin on 2017/7/21.
//  Copyright © 2017年 Ｍasqurin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoginViewController.h"

@interface LogIn : NSObject

@property(nonatomic,assign) BOOL tryLogin;
+(instancetype) sharedInstance;
-(BOOL)didLogin;

@end
