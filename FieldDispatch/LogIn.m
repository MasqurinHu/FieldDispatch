//
//  LogIn.m
//  FieldDispatch
//
//  Created by Ｍasqurin on 2017/7/21.
//  Copyright © 2017年 Ｍasqurin. All rights reserved.
//

#import "LogIn.h"

static LogIn *login = nil;

@implementation LogIn

+(instancetype)sharedInstance{
    if (login == nil) {
        login = [LogIn new];
    }
    return login;
}

-(void)didLogin{
    
}

-(void)didLogOut{
    
}

@end
