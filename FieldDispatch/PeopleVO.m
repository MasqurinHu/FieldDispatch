//
//  PeopleVO.m
//  FieldDispatch
//
//  Created by Ｍasqurin on 2017/8/28.
//  Copyright © 2017年 Ｍasqurin. All rights reserved.
//

#import "PeopleVO.h"

@implementation PeopleVO

-(instancetype)initFromData:(NSDictionary *)data {
    self = [super init];
    
    _memberId = [data[@"id"] intValue];
    _nickName = data[@"nickName"];
    _photo = data[@"photo"];
    if (data[@"tel"] != [NSNull null]) {
        _tel = [data[@"tel"] intValue];
    }
    _status = [data[@"status"] intValue];
    _loc.latitude = [data[@"Lat"] floatValue];
    _loc.longitude = [data[@"lon"] floatValue];
    
    return self;
}

@end
