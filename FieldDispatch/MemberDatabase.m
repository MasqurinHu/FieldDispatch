//
//  MemberDatabase.m
//  FieldDispatch
//
//  Created by Ｍasqurin on 2017/8/7.
//  Copyright © 2017年 Ｍasqurin. All rights reserved.
//

#import "MemberDatabase.h"

static MemberDatabase *member = nil;

@implementation MemberDatabase

+(instancetype)stand{
    if (member == nil) {
        member = [MemberDatabase new];
    }
    return member;
}

@end
