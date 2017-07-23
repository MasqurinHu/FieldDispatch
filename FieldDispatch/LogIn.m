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

-(BOOL)didLogin{
    id scapegoat = [[NSUserDefaults standardUserDefaults] objectForKey:@"login"];
    BOOL tryLogin;
    if (scapegoat == nil) {
        tryLogin = false;
    }else{
        if ([(NSString*)scapegoat isEqualToString:@"Google"])
            tryLogin = true;
        else if ([(NSString*)scapegoat isEqualToString:@"Facebook"])
            tryLogin = true;
        else if ([(NSString*)scapegoat isEqualToString:@"FieldDispatch"])
            tryLogin = true;
        else
            tryLogin = false;
    }
    return tryLogin;
}

-(void)setLogin{
    
}


@end
