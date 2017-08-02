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

-(NSDictionary *)getLoginInfo{
    NSDictionary *loginInfo = @{};
    return loginInfo;
}

-(NSArray*)getAccountList{
    NSArray *accountList = @[];
    return accountList;
}

-(NSString *)getUserID{
    return @"";
}

-(void)newDevice{
    [[HttpConnection stand] newDeviceWithFinish:^(NSError *error, id result) {
        
        if (error) {
            NSLog(@"%@",error.description);
        }
//        NSLog(@"%@",result);
        NSDictionary *resultMemo = (NSDictionary*)result;
        BOOL server = (BOOL)resultMemo[@"result"];
        if (server) {
            int memberId = [resultMemo[@"memberId"] intValue];
            [[NSUserDefaults standardUserDefaults] setObject:@(memberId) forKey:@"memberId"];
            int scapegoat = [[[NSUserDefaults standardUserDefaults] objectForKey:@"memberId"] intValue];
            NSLog(@"\n我是memberId%d",scapegoat);
        }else{
            NSString *error = resultMemo[@"errorCode"];
            NSLog(@"\n我是問題%@",error);
        }
    }];
}

@end
