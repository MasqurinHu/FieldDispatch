//
//  MemberTVCell.h
//  FieldDispatch
//
//  Created by Ｍasqurin on 2017/8/29.
//  Copyright © 2017年 Ｍasqurin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FieldDispatchDataBase.h"

@interface MemberTVCell : UITableViewCell

@property (nonatomic,strong) MemberGroupVO *group;

-(void) reload;

@end
