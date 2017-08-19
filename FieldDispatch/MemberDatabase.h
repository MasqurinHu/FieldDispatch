//
//  MemberDatabase.h
//  FieldDispatch
//
//  Created by Ｍasqurin on 2017/8/7.
//  Copyright © 2017年 Ｍasqurin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MemberGroupVO.h"
#import <CoreLocation/CoreLocation.h>

@interface MemberDatabase : NSObject

@property (nonatomic,assign) int memberId;
@property (nonatomic,strong) NSString *memberAccound;
@property (nonatomic,assign) int signInType;
@property (nonatomic,assign) CLLocationCoordinate2D coordinate;
@property (nonatomic,assign) CLLocationCoordinate2D previousCoordinate;
@property (nonatomic,strong) NSString *area;
@property (nonatomic,assign) int status;
@property (nonatomic,strong) NSString *mali;
@property (nonatomic,strong) NSString *password;
@property (nonatomic,strong) NSString *nickName;
@property (nonatomic,strong) NSString *photoURL;
@property (nonatomic,strong) NSString *tel;
@property (nonatomic,assign) int memberType;
@property (nonatomic,assign) int onLionGroupId;
@property (nonatomic,strong) NSString *onLionGroupName;
@property (nonatomic,strong) NSMutableArray <MemberGroupVO*>*groupList;

+(instancetype)stand;
-(NSString*)getGroupNameWith:(int)GroupId;


@end
