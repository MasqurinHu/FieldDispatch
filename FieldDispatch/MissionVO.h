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
@property (nonatomic,assign) CLLocationCoordinate2D loc;
@property (nonatomic,assign) int groupId;
@property (nonatomic,assign) int missionCreateMemberId;
@property (nonatomic,assign) int executorId;
@property (nonatomic,strong) NSString *missionName;
@property (nonatomic,strong) NSString *contactPerson;
@property (nonatomic,strong) NSString *messionTel;
@property (nonatomic,strong) NSString *address;
@property (nonatomic,strong) NSMutableArray <MissionWorkPointVO*>*workPointList;
@property (nonatomic,strong) NSString *missionMemo;
@property (nonatomic,strong) NSString *createTime;                        //建立時間

@property (nonatomic,assign) int missionStatus;
@property (nonatomic,strong) NSString *missionExecutor;                 //任務執行者

@property (nonatomic,strong) NSString *type;

-(instancetype) initWithData:(NSDictionary*)data;


@end
