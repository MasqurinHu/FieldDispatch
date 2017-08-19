//
//  MissionVO.h
//  FieldDispatch
//
//  Created by Ｍasqurin on 2017/8/12.
//  Copyright © 2017年 Ｍasqurin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MissionWorkPointVO.h"

@interface MissionVO : NSObject

@property (nonatomic,strong) UIImage *map;
@property (nonatomic,assign) int missionId;
@property (nonatomic,assign) int groupId;
@property (nonatomic,strong) NSString *groupName;
@property (nonatomic,assign) int createMemberId;
@property (nonatomic,strong) NSString *createMemberName;
@property (nonatomic,strong) NSDate *createTime;
@property (nonatomic,strong) NSDate *appointment;                       //預約時間
@property (nonatomic,strong) NSDate *arrivalTime;                       //抵達時間
@property (nonatomic,strong) NSMutableArray<NSDate*> *relayTime;        //中繼時間
@property (nonatomic,strong) NSDate *completeTime;                      //完成時間
@property (nonatomic,strong) NSString *missionName;
@property (nonatomic,assign) int messionTel;
@property (nonatomic,strong) NSMutableArray <MissionWorkPointVO*>*locList;
@property (nonatomic,strong) NSString *missionExecutor;
@property (nonatomic,strong) NSString *missionMemo;
@property (nonatomic,assign) int missionStatus;


@end
