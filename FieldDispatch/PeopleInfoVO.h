//
//  PeopleInfoVO.h
//  FieldDispatch
//
//  Created by Ｍasqurin on 2017/8/21.
//  Copyright © 2017年 Ｍasqurin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MemberGroupVO.h"
#import "PeopleVO.h"

@interface PeopleInfoVO : NSObject

@property (nonatomic,strong) NSArray <MemberGroupVO*>*groupList;
@property (nonatomic,strong) NSArray <PeopleVO*>*peopleList;

-(instancetype) initFromData:(NSDictionary*)data;

-(PeopleVO*) getPeopleWithId:(int)Id;

-(NSString*) getGroupNameWithGroupId:(int)Id;
-(NSString*) getNameWithId:(int)Id;

@end
