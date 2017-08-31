//
//  MissionWorkPointVO.m
//  FieldDispatch
//
//  Created by Ｍasqurin on 2017/8/17.
//  Copyright © 2017年 Ｍasqurin. All rights reserved.
//

#import "MissionWorkPointVO.h"

@implementation MissionWorkPointVO

-(instancetype)initWithData:(NSDictionary *)data {
    self = [super init];
    
    _address = data[@"address"];
    _arrivalTime = data[@"arrivalTime"];
    if ([_arrivalTime isEqualToString:@"0000-00-00 00:00:00"]) {
        _arrivalTime = @"";
    }
    _completeTime = data[@"completeTime"];
    if ([_completeTime isEqualToString:@"0000-00-00 00:00:00"]) {
        _completeTime = @"";
    }
    
    NSMutableArray <CurrentLocVO*>*before = [NSMutableArray new];
    NSDictionary *beforeD = data[@"before"];
    if ([beforeD[@"result"] boolValue]) {
        NSArray *current = beforeD[@"current"];
        for (NSDictionary *currentData in current) {
            CurrentLocVO *currentBefore = [[CurrentLocVO alloc] initWithData:currentData];
            [before addObject:currentBefore];
        }
        _before = before;
    } else {
        _before = [NSArray new];
    }
    
    _departureTime = data[@"departureTime"];
    if ([_departureTime isEqualToString:@"0000-00-00 00:00:00"]) {
        _departureTime = @"";
    }
    _executorId = [data[@"executorId"] intValue];
    _expectedArrivalTime = data[@"expectedArrivalTime"];
    _loc.latitude = [data[@"lat"] floatValue];
    _loc.longitude = [data[@"lon"] floatValue];
    _order = [data[@"prder"] intValue];
    _status = [data[@"status"] intValue];
    
    NSDictionary *workD = data[@"work"];
    NSMutableArray <CurrentLocVO*>*work = [NSMutableArray new];
    if ([workD[@"result"] boolValue]) {
        NSArray *current = workD[@"current"];
        for (NSDictionary *currentData in current) {
            CurrentLocVO *currentWork = [[CurrentLocVO alloc] initWithData:currentData];
            [work addObject:currentWork];
        }
        _work = work;
    } else {
        _work = [NSArray new];
    }
    
    return self;
}

@end
