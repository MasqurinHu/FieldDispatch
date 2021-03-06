//
//  CurrentLocVO.h
//  FieldDispatch
//
//  Created by Ｍasqurin on 2017/8/29.
//  Copyright © 2017年 Ｍasqurin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface CurrentLocVO : NSObject

@property (nonatomic,assign) CLLocationCoordinate2D loc;
@property (nonatomic,strong) NSString *time;

-(instancetype)initWithData:(NSDictionary*)data;

@end
