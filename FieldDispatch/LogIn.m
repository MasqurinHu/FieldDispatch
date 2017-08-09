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
        return;
    }
    
    NSDictionary *par = @{@"memberAccount":account,
                          @"memberSingInType":@(memberSingInType),
                          @"nickName":nickName,
                          @"password":password,
                          @"photo":photo,
                          @"memberId":@(memberId),
                          @"deviceType":@(1),
                          @"memberMail":mail,
                          @"deviceToken":deviceToken
                          };
    
    [[HttpConnection stand] doPostWithURLString:CREATE_ACCOUNT
                                     parameters:par
                                           data:nil
                                         finish:result];
}

-(void)reportStatus:(Res)responser{
    
    NSDictionary *par = @{
                          @"memberId":[NSString stringWithFormat:@"%d",[MemberDatabase stand].memberId],
                          @"memberStatus":[NSString stringWithFormat:@"%d",[MemberDatabase stand].status],
                          @"memberLat":[NSString stringWithFormat:@"%f",[MemberDatabase stand].coordinate.latitude],
                          @"memberLon":[NSString stringWithFormat:@"%f",[MemberDatabase stand].coordinate.longitude]};
    [[HttpConnection stand]
     doPostWithURLString:REPORT_STATUS
     parameters:par data:nil
     finish:^(NSError *error, id result) {
         
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

}



@end
