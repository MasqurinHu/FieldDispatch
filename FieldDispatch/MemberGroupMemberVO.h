//
//  MemberGroupMember.h
//  FieldDispatch
//
//  Created by Ｍasqurin on 2017/8/19.
//  Copyright © 2017年 Ｍasqurin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MemberGroupMemberVO : NSObject

@property (nonatomic,assign) int groupId;
@property (nonatomic,assign) int memberId;
@property (nonatomic,assign) int status;
@property (nonatomic,strong) NSDate *statusTime;

@end
