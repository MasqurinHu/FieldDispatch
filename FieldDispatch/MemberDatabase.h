//
//  MemberDatabase.h
//  FieldDispatch
//
//  Created by Ｍasqurin on 2017/8/7.
//  Copyright © 2017年 Ｍasqurin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MemberGroupVO.h"
#import "PeopleInfoVO.h"
#import <CoreLocation/CoreLocation.h>
#import "MissionDatabaseVO.h"

@interface MemberDatabase : NSObject

//會員基本資料 需保存 登入驗證用
@property (nonatomic,assign) int memberId;
@property (nonatomic,assign) int signInType;
@property (nonatomic,strong) NSString *memberAccount;
@property (nonatomic,strong) NSString *password;
@property (nonatomic,assign) int memberType;

//電話 預定需設定電話才能接受委派任務
@property (nonatomic,strong) NSString *tel;

//個人基本資訊 需保存
@property (nonatomic,strong) NSString *photoURL;
@property (nonatomic,strong) NSString *mali;
@property (nonatomic,strong) NSString *nickName;
//簡易帳號驗證用 不需保存
@property (nonatomic,strong) NSString *deviceToken;
@property (nonatomic,assign) int deviceType;

@property (nonatomic,assign) int status;
@property (nonatomic,assign) CLLocation *location;
@property (nonatomic,strong) NSString *area;

//
@property (nonatomic,strong) PeopleInfoVO *people;
@property (nonatomic,strong) MissionDatabaseVO *mission;

@property (nonatomic,strong) NSMutableDictionary *signInData;


@property (nonatomic,strong) NSString *onLionGroupName;
@property (nonatomic,assign) int onLionGroupId;

+(instancetype)stand;
-(NSString*)getGroupNameWith:(int)GroupId;




@end
