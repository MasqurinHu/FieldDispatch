//
//  MissionListTVCell.m
//  FieldDispatch
//
//  Created by Ｍasqurin on 2017/9/1.
//  Copyright © 2017年 Ｍasqurin. All rights reserved.
//

#import "MissionListTVCell.h"
#import <MapKit/MapKit.h>

@interface MissionListTVCell()<MKMapViewDelegate>
{
    UILabel *missionType;
    UILabel *expectedArrivalTime;
    UILabel *groupName;
    AdvanceImageView *photo;
    UILabel *name;
    UILabel *missionName;
    UILabel *workPoint1;
    UILabel *workPoint2;
    UILabel *memo;
    UIView *map;
    
    UILabel *missionStatus;
}
@end

@implementation MissionListTVCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    missionType = [[UILabel alloc] initWithProgramInSuperView:self];
    [UIView initAtLeftTopWithSelf:missionType
                        SuperView:self
                         Levelgap:4.0
                      VerticalGap:4.0];
    
    expectedArrivalTime = [[UILabel alloc] initWithProgramInSuperView:self];
    [UIView atTargetLB_WithSelf:expectedArrivalTime
                         target:missionType
                      superView:self
                    multiplierX:1.0
                    multiplierY:1.0
                           gapX:.0
                           gapY:4.0];
    
    groupName = [[UILabel alloc] initWithProgramInSuperView:self];
    [UIView atTargetLB_WithSelf:groupName
                         target:expectedArrivalTime
                      superView:self
                    multiplierX:1.0
                    multiplierY:1.0
                           gapX:.0
                           gapY:4.0];
    
    photo = [AdvanceImageView new];
    [self addSubview:photo];
    photo.translatesAutoresizingMaskIntoConstraints = false;
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:photo
                         attribute:NSLayoutAttributeWidth
                         relatedBy:NSLayoutRelationEqual
                         toItem:self
                         attribute:NSLayoutAttributeHeight
                         multiplier:.001
                         constant:20.0]];
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:photo
                         attribute:NSLayoutAttributeHeight
                         relatedBy:NSLayoutRelationEqual
                         toItem:self
                         attribute:NSLayoutAttributeHeight
                         multiplier:.001
                         constant:20.0]];
    [UIView atTargetLB_WithSelf:photo
                         target:groupName
                      superView:self
                    multiplierX:1.0
                    multiplierY:1.0
                           gapX:.0
                           gapY:4.0];
    NSURL *url = [NSURL URLWithString:[MemberDatabase stand].photoURL];
    [photo loadImageWithURL:url];
    
    name = [[UILabel alloc] initWithProgramInSuperView:self];
    [UIView atTargetCT_Withself:name
                         target:photo
                      superView:self
                    multiplierX:1.0
                    multiplierY:1.0
                           gapX:4.0
                           gapY:.0];
    
    missionName = [[UILabel alloc] initWithProgramInSuperView:self];
    [UIView atTargetLB_WithSelf:missionName
                         target:photo
                      superView:self
                    multiplierX:1.0
                    multiplierY:1.0
                           gapX:.0
                           gapY:4.0];
    
    workPoint1 = [[UILabel alloc] initWithProgramInSuperView:self];
    workPoint1.numberOfLines = 0;
    [UIView atTargetLB_WithSelf:workPoint1
                         target:missionName
                      superView:self
                    multiplierX:1.0
                    multiplierY:1.0
                           gapX:.0
                           gapY:4.0];
    
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:workPoint1
                         attribute:NSLayoutAttributeWidth
                         relatedBy:NSLayoutRelationEqual
                         toItem:self
                         attribute:NSLayoutAttributeWidth
                         multiplier:1.0
                         constant:.0]];
        
    
    
    workPoint2 = [[UILabel alloc] initWithProgramInSuperView:self];
    workPoint2.numberOfLines = 0;
    [UIView atTargetLB_WithSelf:workPoint2
                         target:workPoint1
                      superView:self
                    multiplierX:1.0
                    multiplierY:1.0
                           gapX:.0
                           gapY:4.0];
    
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:workPoint1
                         attribute:NSLayoutAttributeWidth
                         relatedBy:NSLayoutRelationEqual
                         toItem:self
                         attribute:NSLayoutAttributeWidth
                         multiplier:1.0
                         constant:.0]];
    
    memo = [[UILabel alloc] initWithProgramInSuperView:self];
    memo.numberOfLines = 0;
    [UIView atTargetLB_WithSelf:memo
                         target:workPoint2
                      superView:self
                    multiplierX:1.0
                    multiplierY:1.0
                           gapX:.0
                           gapY:4.0];
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:memo
                         attribute:NSLayoutAttributeWidth
                         relatedBy:NSLayoutRelationEqual
                         toItem:self
                         attribute:NSLayoutAttributeWidth multiplier:1.0 constant:.0]];
    
    map = [UIView new];
    map.backgroundColor = [UIColor blueColor];
    map.userInteractionEnabled = false;
    [self addSubview:map];
    map.translatesAutoresizingMaskIntoConstraints = false;
    [UIView atTargetLB_WithSelf:map
                         target:memo
                      superView:self
                    multiplierX:1.0
                    multiplierY:1.0
                           gapX:.0
                           gapY:4.0];
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:map
                         attribute:NSLayoutAttributeTrailing
                         relatedBy:NSLayoutRelationEqual
                         toItem:self
                         attribute:NSLayoutAttributeTrailing
                         multiplier:1.0
                         constant:-4.0]];
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:map
                         attribute:NSLayoutAttributeBottom
                         relatedBy:NSLayoutRelationEqual
                         toItem:self
                         attribute:NSLayoutAttributeBottom
                         multiplier:1.0
                         constant:-4.0]];
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:map
                         attribute:NSLayoutAttributeHeight
                         relatedBy:NSLayoutRelationEqual
                         toItem:self
                         attribute:NSLayoutAttributeHeight
                         multiplier:.000001
                         constant:100.0]];
    
    UIButton *accept = [[UIButton alloc]
                        initWithTitle:ACCEPT_A_MISSION
                        backgroundColor:[UIColor greenColor]
                        addTarget:self
                        func:@selector(missionAccept)
                        superView:self];
    [UIView initAtRightBotonWithSelf:accept
                           SuperView:self
                            LevelGap:-10.0
                         VerticalGap:-10.0];
//    [[accept.widthAnchor constraintEqualToConstant:accept.frame.size.width + 10] setActive:true];
    accept.contentEdgeInsets = UIEdgeInsetsMake(2, 10, 2, 10);
    
//    missionStatus = [UILabel new];
//    missionStatus.numberOfLines = 0;
//    switch (_mission.missionStatus) {
//        case 1:
//            missionStatus.text = @"狀態：待接送";
//            break;
//        case 2:
//            missionStatus.text = @"狀態：前往中";
//            break;
//        case 3:
//            missionStatus.text = @"狀態：工作中";
//            break;
//        case 4:
//            missionStatus.text = @"狀態：已完成";
//            break;
//        default:
//            missionStatus.text = @"狀態：異常～";
//            break;
//    }
//    
//    [missionStatus sizeToFit];
//    [self addSubview:missionStatus];
//    missionStatus.translatesAutoresizingMaskIntoConstraints = false;
//    [self addConstraint:[NSLayoutConstraint
//                         constraintWithItem:missionStatus
//                         attribute:NSLayoutAttributeLeading
//                         relatedBy:NSLayoutRelationEqual
//                         toItem:name
//                         attribute:NSLayoutAttributeLeading
//                         multiplier:1.0
//                         constant:.0]];
//    [self addConstraint:[NSLayoutConstraint
//                         constraintWithItem:missionStatus
//                         attribute:NSLayoutAttributeTop
//                         relatedBy:NSLayoutRelationEqual
//                         toItem:name
//                         attribute:NSLayoutAttributeBottom
//                         multiplier:1.0
//                         constant:4.0]];
//    
//    
//    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
}

-(void) missionAccept {
    MLoading *loading = [[MLoading alloc] initLoadingViewWithTarget:_tvc.tableView];
    [MissionDatabaseVO acceptMission:_mission done:^(BOOL accept) {
        [_tvc.tableView reloadData];
        [loading removeLoadingView];
        if (accept) {
            NSLog(@"接受成功");
        } else {
            NSLog(@"接受失敗");
        }
    }];
}


-(void)reload {
    PeopleVO *people = [[MemberDatabase stand] .people getPeopleWithId:_mission.missionCreateMemberId];
    
    missionType.text = _mission.type;
    
    expectedArrivalTime.text = [NSString
                                stringWithFormat:@"%@%@",ExpectedArrivalTime,_mission.workPointList[0].expectedArrivalTime];
    
    groupName.text = [NSString stringWithFormat:@"%@%@",GROUP_NAME,[[MemberDatabase stand].people getGroupNameWithGroupId:_mission.groupId]];
    
    NSURL *url = [NSURL URLWithString:people.photo];
    [photo loadImageWithURL:url];
    
    name.text = people.nickName;
    
    missionName.text = [NSString stringWithFormat:@"%@%@",MISSION_NAME,_mission.missionName];
    
    workPoint1.text = [NSString stringWithFormat:@"%@.1 : %@",WORK_POINT,_mission.workPointList[0].address];
    workPoint2.text = [NSString stringWithFormat:@"%@.2 : ",WORK_POINT];
    if (_mission.workPointList.count > 1) {
        workPoint2.text = [NSString stringWithFormat:@"%@.2 : %@",WORK_POINT,_mission.workPointList[1].address];
    }
    
    memo.text = [NSString stringWithFormat:@"%@%@",MISSION_MEMO,_mission.missionMemo];
    
    missionStatus.numberOfLines = 0;
    switch (_mission.missionStatus) {
        case 1:
            missionStatus.text = @"狀態：待接送";
            break;
        case 2:
            missionStatus.text = @"狀態：前往中";
            break;
        case 3:
            missionStatus.text = @"狀態：工作中";
            break;
        case 4:
            missionStatus.text = @"狀態：已完成";
            break;
        default:
            missionStatus.text = @"狀態：異常～";
            break;
    }
    
    
    
    
    
}




@end
