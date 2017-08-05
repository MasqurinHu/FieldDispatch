//
//  LogIn.m
//  FieldDispatch
//
//  Created by Ｍasqurin on 2017/7/21.
//  Copyright © 2017年 Ｍasqurin. All rights reserved.
//

#import "LogIn.h"

#define UPDATE_DEVICE_TOKEN @"updateDaviceToken.php"

static LogIn *login = nil;

@implementation LogIn

+(instancetype)sharedInstance{
    if (login == nil) {
        login = [LogIn new];
    }
    return login;
}

-(BOOL)didLogin{
    id scapegoat = [[NSUserDefaults standardUserDefaults] objectForKey:@"memberId"];
    BOOL tryLogin;
    if (scapegoat == nil) {
        tryLogin = false;
        NSLog(@"沒有登入");
    }else{
        int aaa = [scapegoat intValue];
        NSLog(@"我是memberId: %d",aaa);
        tryLogin = true;
        NSLog(@"已登入");
    }
//    id scapegoat = [[NSUserDefaults standardUserDefaults] objectForKey:@"login"];
//    BOOL tryLogin;
//    if (scapegoat == nil) {
//        tryLogin = false;
//    }else{
//        if ([(NSString*)scapegoat isEqualToString:@"Google"])
//            tryLogin = true;
//        else if ([(NSString*)scapegoat isEqualToString:@"Facebook"])
//            tryLogin = true;
//        else if ([(NSString*)scapegoat isEqualToString:@"FieldDispatch"])
//            tryLogin = true;
//        else
//            tryLogin = false;
//    }
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

-(void)newDevice:(IsOnlion)onlion{
    [[HttpConnection stand] newDeviceWithFinish:^(NSError *error, id result) {
        
        if (error) {
            NSLog(@"%@",error.description);
            return ;
        }
        NSDictionary *resultMemo = (NSDictionary*)result;
        BOOL server = [resultMemo[@"result"] boolValue];
        if (server == true) {
            int memberId = [resultMemo[@"memberId"] intValue];
            [[NSUserDefaults standardUserDefaults] setObject:@(memberId) forKey:@"memberId"];
            int memberType = [resultMemo[@"memberType"] intValue];
            [[NSUserDefaults standardUserDefaults] setObject:@(memberType) forKey:@"memberType"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            int scapegoat = [[[NSUserDefaults standardUserDefaults] objectForKey:@"memberId"] intValue];
            int dummy = [[[NSUserDefaults standardUserDefaults] objectForKey:@"memberType"] intValue];
            if (onlion) {
                onlion(nil,true);
            }
            NSLog(@"\n我是memberId: %d\n我是memberType: %d",scapegoat,dummy);
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
    NSDictionary *par = @{@"memberId":memberId,
                          @"deviceType":@"1",
                          @"deviceToken":deviceToken};
    [[HttpConnection stand]
     doPostWithURLString:UPDATE_DEVICE_TOKEN
     parameters:par
     data:nil
     finish:resoult];
    


}

@end
