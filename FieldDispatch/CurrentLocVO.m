//
//  CurrentLocVO.m
//  FieldDispatch
//
//  Created by Ｍasqurin on 2017/8/29.
//  Copyright © 2017年 Ｍasqurin. All rights reserved.
//

#import "CurrentLocVO.h"

@implementation CurrentLocVO

-(instancetype)initWithData:(NSDictionary *)data{
    self = [super init];
    
    CLLocationCoordinate2D loc = CLLocationCoordinate2DMake([data[@"lat"] floatValue], [data[@"lon"] floatValue]);
    _loc = loc;
    _time = data[@"time"];
    
    return self;
}

@end
