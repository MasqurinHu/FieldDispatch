//
//  MissionWorkPointVO.h
//  FieldDispatch
//
//  Created by Ｍasqurin on 2017/8/17.
//  Copyright © 2017年 Ｍasqurin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "CurrentLocVO.h"

@interface MissionWorkPointVO : NSObject

@property (nonatomic,assign) CLLocationCoordinate2D loc;
@property (nonatomic,strong) NSString *address;
@property (nonatomic,strong) NSString *expectedArrivalTime;   //預計抵達時間
@property (nonatomic,strong) NSString *departureTime;        //開始時間
@property (nonatomic,strong) NSString *arrivalTime;           //抵達時間
@property (nonatomic,strong) NSString *completeTime;          //完成時間
@property (nonatomic,assign) int order;                     //順序
@property (nonatomic,assign) int executorId;                //執行者Id
@property (nonatomic,assign) int status;

@property (nonatomic,strong) NSArray <CurrentLocVO*>*before;
@property (nonatomic,strong) NSArray <CurrentLocVO*>*work;

-(instancetype)initWithData:(NSDictionary*)data;

@end
