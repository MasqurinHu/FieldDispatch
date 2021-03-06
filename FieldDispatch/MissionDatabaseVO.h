//
//  MissionDatabaseVO.h
//  FieldDispatch
//
//  Created by Ｍasqurin on 2017/8/29.
//  Copyright © 2017年 Ｍasqurin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MissionVO.h"

typedef void (^MissionAccept)(BOOL accept) ;

@interface MissionDatabaseVO : NSObject

@property (nonatomic,strong) NSArray <MissionVO*>*acceptableList;
@property (nonatomic,strong) NSArray <MissionVO*>*acceptedList;
@property (nonatomic,strong) NSArray <MissionVO*>*completeList;
@property (nonatomic,strong) NSArray <MissionVO*>*delegate;

-(instancetype) initWithData:(NSDictionary*)data;
+(void) acceptMission:(MissionVO*)mission done:(MissionAccept)done;


@end
