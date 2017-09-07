//
//  PeopleInfoVO.m
//  FieldDispatch
//
//  Created by Ｍasqurin on 2017/8/21.
//  Copyright © 2017年 Ｍasqurin. All rights reserved.
//

#import "PeopleInfoVO.h"

@implementation PeopleInfoVO

-(instancetype)initFromData:(NSDictionary *)data {
    self = [super init];
    
    NSArray *groupListData = data[@"groupList"];
    NSArray *peopleListData = data[@"peopleList"];
    
    NSMutableArray <MemberGroupVO*>*groupList = [NSMutableArray new];
    for (NSDictionary *group in groupListData) {
        MemberGroupVO *groupVO = [[MemberGroupVO alloc] initMemberGroupVO:group];
        [groupList addObject:groupVO];
    }
    _groupList = groupList;
    
    NSMutableArray <PeopleVO*>*peopleList = [NSMutableArray new];
    for (NSDictionary *people in peopleListData) {
        PeopleVO *peopleVO = [[PeopleVO alloc] initFromData:people];
        [peopleList addObject:peopleVO];
    }
    _peopleList = peopleList;
    
    return self;
}

-(PeopleVO *)getPeopleWithId:(int)Id {
    PeopleVO *new = [PeopleVO new];
    for (PeopleVO *peo in _peopleList) {
        if (peo.memberId == Id) {
            return peo;
        }
    }
    return new;
}

-(NSString *)getNameWithId:(int)Id {
    NSString *name = @"";
    for (PeopleVO *peo in _peopleList) {
        if (peo.memberId == Id) {
            name = peo.nickName;
        }
    }
    return name;
}

-(NSString *)getGroupNameWithGroupId:(int)Id {
    NSString *groupName = @"";
    for (MemberGroupVO *group in _groupList) {
        if (group.groupId == Id) {
            groupName = group.groupName;
        }
    }
    return groupName;
}

@end
