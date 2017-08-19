//
//  MissionVO.h
//  FieldDispatch
//
//  Created by Ｍasqurin on 2017/8/12.
//  Copyright © 2017年 Ｍasqurin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MissionWorkPointVO.h"
#import <CoreLocation/CoreLocation.h>

@interface MissionVO : NSObject

@property (nonatomic,strong) UIImage *map;

@property (nonatomic,assign) int missionId;
@property (nonatomic,assign) int groupId;
@property (nonatomic,assign) int createMemberId;
@property (nonatomic,strong) NSString *missionName;
@property (nonatomic,assign) int messionTel;
@property (nonatomic,strong) NSMutableArray <MissionWorkPointVO*>*workPointList;
@property (nonatomic,strong) NSString *missionMemo;
@property (nonatomic,strong) NSDate *createTime;                        //建立時間
@property (nonatomic,strong) NSDate *appointment;                       //預約時間
@property (nonatomic,strong) NSDate *arrivalTime;                       //抵達時間
@property (nonatomic,strong) NSDate *completeTime;                      //完成時間
@property (nonatomic,assign) int missionStatus;


@property (nonatomic,strong) NSString *missionExecutor;                 //任務執行者




@end
