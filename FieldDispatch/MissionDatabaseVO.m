//
//  MissionDatabaseVO.m
//  FieldDispatch
//
//  Created by Ｍasqurin on 2017/8/29.
//  Copyright © 2017年 Ｍasqurin. All rights reserved.
//

#import "MissionDatabaseVO.h"
#import "MobileDataBase.h"
#import "HttpConnection.h"
#import "Define.h"

@implementation MissionDatabaseVO

-(instancetype)init {
    self = [super init];
    _delegate = [NSArray new];
    _acceptableList = [NSArray new];
    _acceptedList = [NSArray new];
    _completeList = [NSArray new];
    return self;
}

-(instancetype)initWithData:(NSDictionary *)data {
    self = [super init];
    
    NSArray *acceptable = data[@"missionAcceptableList"];
    NSMutableArray <MissionVO*>*scapegoat = [NSMutableArray new];
    if (acceptable.count > 0) {
        for (NSDictionary *data in acceptable) {
            
            MissionVO *mission = [[MissionVO alloc] initWithData:data];
            mission.type = MISSION_TYPE_ACCEPTABLE;
            [scapegoat addObject:mission];
        }
        _acceptableList = scapegoat;
    }
    
    
    NSArray *accept = data[@"missionAcceptedList"];
    scapegoat = [NSMutableArray new];
    if (accept.count > 0) {
        for (NSDictionary *data in accept) {
            
            MissionVO *mission = [[MissionVO alloc] initWithData:data];
            mission.type = MISSION_TYPE_ACCEPTED;
            [scapegoat addObject:mission];
        }
        _acceptedList = scapegoat;
    }
    
    NSArray *complet = data[@"missionCompleteList"];
    NSMutableArray <MissionVO*>*prop = [NSMutableArray new];
    if (complet.count > 0) {
        for (NSDictionary *data in complet) {
            
            MissionVO *mission = [[MissionVO alloc] initWithData:data];
            mission.type = MISSION_TYPE_COMPLETE;
            [prop addObject:mission];
        }
        _completeList = prop;
    }
    
    NSArray *delegate = data[@"missionDelegate"];
    NSMutableArray <MissionVO*>*proz = [NSMutableArray new];
    if (delegate.count > 0) {
        for (NSDictionary *data in delegate) {
            
            MissionVO *mission = [[MissionVO alloc] initWithData:data];
            mission.type = MISSION_TYPE_DELAGATE;
            [proz addObject:mission];
        }
        _delegate = proz;
    }
    
    
    return self;
}

+(void)acceptMission:(MissionVO *)mission
                done:(MissionAccept)done {
    NSMutableDictionary *acceptMission = [NSMutableDictionary new];
    [acceptMission setObject:@(mission.missionId) forKey:@"missionId"];
    [acceptMission setObject:@([MemberDatabase stand].memberId) forKey:@"executorId"];
    
    
    [[MLoctionVO stand]
     getAddressWithLocation:[MemberDatabase stand].location
     address:^(NSString *address) {
         
         NSMutableDictionary *parameter = [NSMutableDictionary new];
         [acceptMission setObject:address forKey:@"bookingAddress"];
         
         
         [parameter addEntriesFromDictionary:[MemberDatabase stand].signInData];
         [parameter setObject:acceptMission forKey:@"acceptMission"];
         [[HttpConnection stand]
          doPostWithURLString:ACCEPT_MISSION
          parameters:parameter
          data:nil
          finish:^(NSError *error, id result) {
             
              if (done) {
                  if (error || [result[@"result"] boolValue] == false) {
                      done(false);
                      return ;
                  }
                  done(true);
              }
              
         }];
     }];
    
}


@end
