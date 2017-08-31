//
//  MemberGroupVO.h
//  FieldDispatch
//
//  Created by Ｍasqurin on 2017/8/19.
//  Copyright © 2017年 Ｍasqurin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MemberGroupMemberVO.h"


@interface MemberGroupVO : NSObject

@property (nonatomic,assign) int groupId;
@property (nonatomic,strong) NSString *groupName;
@property (nonatomic,strong) NSArray <MemberGroupMemberVO*> *groupMemberList;

-(instancetype)initMemberGroupVO:(NSDictionary *)groupList;

@end
