//
//  MemberDatabase.m
//  FieldDispatch
//
//  Created by Ｍasqurin on 2017/8/7.
//  Copyright © 2017年 Ｍasqurin. All rights reserved.
//

#import "MemberDatabase.h"

static MemberDatabase *member = nil;

@implementation MemberDatabase

+(instancetype)stand{
    if (member == nil) {
        member = [MemberDatabase new];
        member.signInData = [[[NSUserDefaults standardUserDefaults] objectForKey:@"member"] mutableCopy];
        if (member.signInData == NULL) {
            member.signInData = [NSMutableDictionary new];
        }
    }
    return member;
}

-(void)setSignInData:(NSMutableDictionary *)signInData {
    _signInData = signInData;
    [[NSUserDefaults standardUserDefaults] setObject:member.signInData forKey:@"member"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@synthesize memberId = _memberId;
-(void)setMemberId:(int)memberId{
    
    [member.signInData setObject:@(memberId) forKey:@"id"];
    [[NSUserDefaults standardUserDefaults] setObject:member.signInData forKey:@"member"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    _memberId = memberId;
}
-(int)memberId{
    return [member.signInData[@"id"] intValue];
}

@synthesize nickName = _nickName;
-(void)setNickName:(NSString *)nickName{
    NSMutableDictionary *scapegoat = member.signInData;
    [scapegoat setObject:nickName forKey:@"nickName"];
    member.signInData = scapegoat;
    _nickName = nickName;
}
-(NSString *)nickName{
    return member.signInData[@"nickName"];
}

@synthesize tel = _tel;
-(void)setTel:(NSString *)tel{
    NSMutableDictionary *scapegoat = member.signInData;
    NSLog(@"\n天哪%@",scapegoat.description);
    NSLog(@"%@",scapegoat.class);
    [scapegoat setObject:tel forKey:@"memberTel"];
    member.signInData = scapegoat;
    _tel = tel;
}
-(NSString *)tel{
    return member.signInData[@"memberTel"];
}

@synthesize photoURL = _photoURL;
-(void)setPhotoURL:(NSString *)photoURL{
    NSMutableDictionary *scapegoat = member.signInData;
    [scapegoat setObject:photoURL forKey:@"photo"];
    member.signInData = scapegoat;
    _photoURL = photoURL;
}
-(NSString *)photoURL{
    return member.signInData[@"photo"];
}

@synthesize mali = _mali;
-(void)setMali:(NSString *)mali{
    NSMutableDictionary *scapegoat = member.signInData;
    [scapegoat setObject:mali forKey:@"mail"];
    member.signInData = scapegoat;
    _mali = mali;
}
-(NSString *)mali{
    return member.signInData[@"mail"];
}

@synthesize signInType = _signInType;
-(void)setSignInType:(int)signInType{
    NSMutableDictionary *scapegoat = member.signInData;
    [scapegoat setObject:@(signInType) forKey:@"signInType"];
    member.signInData = scapegoat;
    _signInType = signInType;
}
-(int)signInType{
    return [member.signInData[@"signInType"] intValue];
}

@synthesize memberType = _memberType;
-(void)setMemberType:(int)memberType{
    NSMutableDictionary *scapegoat = member.signInData;
    [scapegoat setObject:@(memberType) forKey:@"memberType"];
    member.signInData = scapegoat;
    _memberType = memberType;
}
-(int)memberType{
    return [member.signInData[@"memberType"] intValue];
}

@synthesize memberAccount = _memberAccount;
-(void)setMemberAccount:(NSString *)memberAccount{
    NSMutableDictionary *scapegoat = member.signInData;
    [scapegoat setObject:memberAccount forKey:@"account"];
    member.signInData = scapegoat;
    _memberAccount = memberAccount;
}

-(NSString *)memberAccount{
    return member.signInData[@"account"];
}

@synthesize password = _password;
-(void)setPassword:(NSString *)password{
    NSMutableDictionary *scapegoat = member.signInData;
    [scapegoat setObject:password forKey:@"password"];
    member.signInData = scapegoat;
    _password = password;
}

-(NSString *)password{
    return member.signInData[@"password"];
}

-(NSString *)deviceToken{
    NSString *deviceToken = _deviceToken;
    if (deviceToken == NULL) {
        deviceToken = @"";
    }
    return deviceToken;
}

-(int)deviceType{
    return 1;
}

-(void)setLocation:(CLLocation *)location {
    _location = location;
    [member.signInData setObject:@(location.coordinate.latitude) forKey:@"Lat"];
    [member.signInData setObject:@(location.coordinate.longitude) forKey:@"Lon"];
}

#pragma - FUNC

-(NSString *)getGroupNameWith:(int)GroupId{
    NSString *groupName = @"找不到群組";
    return groupName;
}





@end
