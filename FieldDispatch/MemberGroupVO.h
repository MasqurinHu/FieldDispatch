//
//  MemberGroupVO.h
//  FieldDispatch
//
//  Created by Ｍasqurin on 2017/8/19.
//  Copyright © 2017年 Ｍasqurin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MemberGroupMemberVO.h"
#import "MemberGroupManagerVO.h"

@interface MemberGroupVO : NSObject

@property (nonatomic,assign) int groupId;
@property (nonatomic,strong) NSString *groupName;
@property (nonatomic,assign) int createMemberId;
@property (nonatomic,strong) NSDate *createTime;
@property (nonatomic,assign) int status;
@property (nonatomic,strong) NSArray <MemberGroupMemberVO*> *groupMemberList;
@property (nonatomic,strong) NSArray <MemberGroupManagerVO*> *groupManager;
@property (nonatomic,strong) NSDate *statusTime;

@end
