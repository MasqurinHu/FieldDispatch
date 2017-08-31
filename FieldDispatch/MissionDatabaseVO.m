//
//  MissionDatabaseVO.m
//  FieldDispatch
//
//  Created by Ｍasqurin on 2017/8/29.
//  Copyright © 2017年 Ｍasqurin. All rights reserved.
//

#import "MissionDatabaseVO.h"

@implementation MissionDatabaseVO

-(instancetype)init {
    self = [super init];
    
    _acceptableList = [NSArray new];
    _completeList = [NSArray new];
    _delegate = [NSArray new];
    
    return self;
}

-(instancetype)initWithData:(NSDictionary *)data {
    self = [super init];
    
    NSArray *accept = data[@"missionAcceptableList"];
    NSMutableArray <MissionVO*>*pro = [NSMutableArray new];
    if (accept.count > 0) {
        for (NSDictionary *data in accept) {
            
            MissionVO *mission = [[MissionVO alloc] initWithData:data];
            [pro addObject:mission];
        }
        _acceptableList = pro;
    }
    
    NSArray *complet = data[@"missionCompleteList"];
    NSMutableArray <MissionVO*>*prop = [NSMutableArray new];
    if (complet.count > 0) {
        for (NSDictionary *data in complet) {
            
            MissionVO *mission = [[MissionVO alloc] initWithData:data];
            [prop addObject:mission];
        }
        _completeList = prop;
    }
    
    NSArray *delegate = data[@"missionDelegate"];
    NSMutableArray <MissionVO*>*proz = [NSMutableArray new];
    if (delegate.count > 0) {
        for (NSDictionary *data in delegate) {
            
            MissionVO *mission = [[MissionVO alloc] initWithData:data];
            [proz addObject:mission];
        }
        _delegate = proz;
    }
    
    
    return self;
}

//沒用
//-(void) makeProperty:(NSArray<MissionVO*>*)property array:(NSArray*)array{
//    
//    NSMutableArray <MissionVO*>*pro = [NSMutableArray new];
//    if (array.count > 0) {
//        for (NSDictionary *data in array) {
//            
//            MissionVO *mission = [[MissionVO alloc] initWithData:data];
//            [pro addObject:mission];
//        }
//        property = pro;
//        
//        
//    }
//}
//

@end
