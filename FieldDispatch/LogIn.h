//
//  LogIn.h
//  FieldDispatch
//
//  Created by Ｍasqurin on 2017/7/21.
//  Copyright © 2017年 Ｍasqurin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LogIn : NSObject

@property (nonatomic,assign) BOOL login;

+(instancetype) sharedInstance;
-(void)didLogin;
-(void)didLogOut;

@end
