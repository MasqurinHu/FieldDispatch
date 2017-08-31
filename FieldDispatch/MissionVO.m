//
//  MissionVO.m
//  FieldDispatch
//
//  Created by Ｍasqurin on 2017/8/12.
//  Copyright © 2017年 Ｍasqurin. All rights reserved.
//

#import "MissionVO.h"


@implementation MissionVO

-(instancetype)init {
    self = [super init];
    self.workPointList = [NSMutableArray new];
    return self;
}

-(instancetype)initWithData:(NSDictionary *)data {
    self = [super init];
    _missionCreateMemberId = [data[@"creatMemberId"] intValue];
    _createTime = data[@"createTime"];
    _groupId = [data[@"groupId"] intValue];
    _address = data[@"missionAddress"];
    _missionId = [data[@"missionId"] intValue];
    _loc.latitude = [data[@"missionLat"] floatValue];
    _loc.longitude = [data[@"missionLon"] floatValue];
    _missionMemo = data[@"missionMemo"];
    _missionName = data[@"missionName"];
    _messionTel = data[@"missionTel"];
    
    if (data[@"missionStatus"]) {
        _missionStatus = [data[@"missionStatus"] intValue];
    }
    
    NSArray *workPointA = data[@"workPointInfo"];
    if (data[@"workPointInfo"] == [NSNull null]) {
        workPointA = [NSArray new];
    }
    NSMutableArray <MissionWorkPointVO*>*workPoint = [NSMutableArray new];
    if (workPointA.count > 0) {
        for (NSDictionary *workPointData in workPointA) {
            
            MissionWorkPointVO *point = [[MissionWorkPointVO alloc] initWithData:workPointData];
            [workPoint addObject:point];
        }
        _workPointList = workPoint;
    }
    
    return self;
}

@end
