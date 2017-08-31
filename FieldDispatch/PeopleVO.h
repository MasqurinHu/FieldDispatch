//
//  PeopleVO.h
//  FieldDispatch
//
//  Created by Ｍasqurin on 2017/8/28.
//  Copyright © 2017年 Ｍasqurin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface PeopleVO : NSObject

@property (nonatomic,assign) int memberId;
@property (nonatomic,strong) NSString *nickName;
@property (nonatomic,strong) NSString *photo;
@property (nonatomic,assign) int tel;
@property (nonatomic,assign) int status;
@property (nonatomic,assign) CLLocationCoordinate2D loc;

-(instancetype) initFromData:(NSDictionary*)data;

@end
