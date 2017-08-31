//
//  MemberGroupVO.m
//  FieldDispatch
//
//  Created by Ｍasqurin on 2017/8/19.
//  Copyright © 2017年 Ｍasqurin. All rights reserved.
//

#import "MemberGroupVO.h"

@implementation MemberGroupVO

-(instancetype)initMemberGroupVO:(NSDictionary *)groupList{
    self = [super init];
    
    _groupId = [groupList[@"groupId"] intValue];
    _groupName = groupList[@"groupName"];
    
    NSArray *groupMemberList = groupList[@"groupMemberList"];
    NSMutableArray <MemberGroupMemberVO*>*list = [NSMutableArray new];
    for (NSDictionary *vo in groupMemberList) {
        MemberGroupMemberVO *member = [MemberGroupMemberVO new];
        member.memberId = [vo[@"memberId"] intValue];
        member.memberAuthority = [vo[@"memberAuthority"] intValue];
        [list addObject:member];
    }
    
    _groupMemberList = list;
    
    return self;
}

@end
