//
//  MissionListTVCell.h
//  FieldDispatch
//
//  Created by Ｍasqurin on 2017/9/1.
//  Copyright © 2017年 Ｍasqurin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FieldDispatchDataBase.h"

@interface MissionListTVCell : UITableViewCell

@property (nonatomic,weak) MissionVO *mission;
@property (nonatomic,weak) MissionListTVC *tvc;
-(void) reload;

@end
