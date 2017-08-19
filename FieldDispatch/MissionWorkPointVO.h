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
@property (nonatomic,strong) NSDate *expectedArrivalTime;   //預計抵達時間
@property (nonatomic,strong) NSDate *arrivalTime;           //抵達時間
@property (nonatomic,strong) NSDate *completeTime;          //完成時間
@property (nonatomic,assign) int order;                     //順序
@property (nonatomic,assign) int executorId;                //執行者Id


@end
