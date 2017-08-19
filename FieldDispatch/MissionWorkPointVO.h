//
//  MissionWorkPointVO.h
//  FieldDispatch
//
//  Created by Ｍasqurin on 2017/8/17.
//  Copyright © 2017年 Ｍasqurin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface MissionWorkPointVO : NSObject

@property (nonatomic,assign) CLLocationCoordinate2D loc;
@property (nonatomic,strong) NSString *address;
@property (nonatomic,strong) NSDate *workPointTime;


@end
