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
        
    }
    return member;
}

@synthesize memberId = _memberId;
-(void)setMemberId:(int)memberId{
    [[NSUserDefaults standardUserDefaults]
     setObject:[NSString stringWithFormat:@"%d",memberId] forKey:@"memberId"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    _memberId = memberId;
}
-(int)memberId{
    id scapegoat = [[NSUserDefaults standardUserDefaults] objectForKey:@"memberId"];
    return [scapegoat intValue];
}

@synthesize nickName = _nickName;
-(void)setNickName:(NSString *)nickName{
    [[NSUserDefaults standardUserDefaults]
     setObject:nickName forKey:@"memberNickName"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    _nickName = nickName;
}
-(NSString *)nickName{
    id scapegoat = [[NSUserDefaults standardUserDefaults] objectForKey:@"memberNickName"];
    NSString *nickName = @"請輸入暱稱讓大家認識你";
    if (scapegoat != nil) {
        nickName = (NSString*)scapegoat;
    }
    return nickName;
}

@synthesize tel = _tel;
-(void)setTel:(NSString *)tel{
    [[NSUserDefaults standardUserDefaults]
     setObject:tel forKey:@"memberTel"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    _tel = tel;
}
-(NSString *)tel{
    id scapegoat = [[NSUserDefaults standardUserDefaults] objectForKey:@"memberTel"];
    NSString *tel = @"請輸入電話方可接受派送任務";
    if (scapegoat != nil) {
        tel = (NSString*)scapegoat;
    }
    return tel;
}

@synthesize photoURL = _photoURL;
-(void)setPhotoURL:(NSString *)photoURL{
    [[NSUserDefaults standardUserDefaults]
     setObject:photoURL forKey:@"memberPhotoURL"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    _photoURL = photoURL;
}
-(NSString *)photoURL{
    id scapegoat = [[NSUserDefaults standardUserDefaults] objectForKey:@"memberPhotoURL"];
    NSString *photoURL = @"https://masqurin.000webhostapp.com/FieldDispatch/pen.jpg";
    if (scapegoat != nil) {
        photoURL = (NSString*)scapegoat;
    }
    return photoURL;
}

@synthesize mali = _mali;
-(void)setMali:(NSString *)mali{
    [[NSUserDefaults standardUserDefaults]
     setObject:mali forKey:@"memberMail"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    _mali = mali;
}
-(NSString *)mali{
    id scapegoat = [[NSUserDefaults standardUserDefaults] objectForKey:@"memberMail"];
    NSString *mali = @"請輸入信箱";
    if (scapegoat != nil) {
        mali = (NSString*)scapegoat;
    }
    return mali;
}

@synthesize signInType = _signInType;
-(void)setSignInType:(int)signInType{
    [[NSUserDefaults standardUserDefaults]
     setObject:@(signInType) forKey:@"memberSignInType"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    _signInType = signInType;
}
-(int)signInType{
    id scapegoat = [[NSUserDefaults standardUserDefaults] objectForKey:@"memberSignInType"];
    int signInType = 0;
    if (scapegoat != nil) {
        signInType = [scapegoat intValue];
    }
    return signInType;
}

@synthesize memberType = _memberType;
-(void)setMemberType:(int)memberType{
    [[NSUserDefaults standardUserDefaults]
     setObject:@(memberType) forKey:@"memberType"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    _memberType = memberType;
}
-(int)memberType{
    id scapegoat = [[NSUserDefaults standardUserDefaults] objectForKey:@"memberType"];
    int memberType = 0;
    if (scapegoat != nil) {
        memberType = [scapegoat intValue];
    }
    return memberType;
}


-(NSString *)getGroupNameWith:(int)GroupId{
    
    NSString *groupName = @"找不到群組";
    for (MemberGroupVO *scapegoat in _groupList) {
        if (scapegoat.groupId == GroupId) {
            groupName = scapegoat.groupName;
        }
    }
    return groupName;
}


@end
