//
//  CreateMissionVC.m
//  FieldDispatch
//
//  Created by Ｍasqurin on 2017/8/14.
//  Copyright © 2017年 Ｍasqurin. All rights reserved.
//

#import "CreateMissionVC.h"
#import <MapKit/MapKit.h>

@interface CreateMissionVC () <MKMapViewDelegate>
{
    UIScrollView *bgS;
    MKMapView *map;
    MLoctionVO *loc;
}
@end

@implementation CreateMissionVC

-(void)viewDidLayoutSubviews{
    bgS.contentSize = CGSizeMake(bgS.frame.size.width, bgS.frame.size.height*3);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    loc = [MLoctionVO stand];
    
    map = [MKMapView new];
    map.delegate = self;
    map.mapType = MKMapTypeStandard;
    map.userTrackingMode = MKUserTrackingModeNone;
    [self.view addSubview:map];
    [UIView initSizeWithSelf:map
                  TargetView:self.view
                   SuperView:self.view
                  AttributeX:NSLayoutAttributeWidth
                  AttributeY:NSLayoutAttributeHeight
                 MultiplierX:.95
                 MultiplierY:.25
                        GapX:.0
                        GapY:.0];
    [UIView initAtCenterTopWithSelf:map
                          SuperView:self.view
                           LevelGap:.0
                        VerticalGap:8.0];
    
    bgS = [UIScrollView new];
    [self.view addSubview:bgS];
    bgS.translatesAutoresizingMaskIntoConstraints = false;
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:bgS
                              attribute:NSLayoutAttributeTop
                              relatedBy:NSLayoutRelationEqual
                              toItem:map
                              attribute:NSLayoutAttributeBottom
                              multiplier:1.0
                              constant:8.0]];
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:bgS
                              attribute:NSLayoutAttributeBottom
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.view
                              attribute:NSLayoutAttributeBottom
                              multiplier:1.0
                              constant:8.0]];
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:bgS
                              attribute:NSLayoutAttributeLeading
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.view
                              attribute:NSLayoutAttributeLeading
                              multiplier:1.0
                              constant:8.0]];
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:bgS
                              attribute:NSLayoutAttributeTrailing
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.view
                              attribute:NSLayoutAttributeTrailing
                              multiplier:1.0
                              constant:8.0]];
    [self.view layoutIfNeeded];
    
    UIView *background = [UIView new];
    background.frame = CGRectMake(0, 0, bgS.frame.size.width, bgS.frame.size.height * 3);
    [bgS addSubview:background];
    background.backgroundColor = [[UIColor alloc]
                                  initWithRed:22/255.0f
                                  green:149/225.0f
                                  blue:163/225.0f
                                  alpha:.5];
    
    UILabel *onLionGroupName = [UILabel new];
    if (_mission.groupName == NULL) {
        _mission.groupName = [MemberDatabase stand].onLionGroupName;
    }
    onLionGroupName.text = _mission.groupName;
    [onLionGroupName sizeToFit];
    [self.view addSubview:onLionGroupName];
    [UIView initAtCenterTopWithSelf:onLionGroupName
                          SuperView:self.view
                           LevelGap:.0
                        VerticalGap:10.0];
    
    UILabel *createMemberName = [UILabel new];
    createMemberName.text = [MemberDatabase stand].nickName;
    if ([MemberDatabase stand].nickName == NULL) {
        createMemberName.text = @"自己";
    }
    [createMemberName sizeToFit];
    [self.view addSubview:createMemberName];
    [UIView initFromTopWithSelf:createMemberName
                     targetView:onLionGroupName
                      superView:self.view
                            gap:2];
    
    MUIBottonlineTextField *missionName =
    [[MUIBottonlineTextField alloc] initWithPlaseHold:@"請輸入任務名稱"];
    if (_mission.missionName != NULL) {
        missionName.text = _mission.missionName;
    }
    [self.view addSubview:missionName];
    [UIView initSizeWithSelf:missionName
                  TargetView:self.view
                   SuperView:self.view
                  AttributeX:NSLayoutAttributeWidth
                  AttributeY:NSLayoutAttributeHeight
                 MultiplierX:.75
                 MultiplierY:.0001
                        GapX:.0
                        GapY:14.0];
    [UIView initFromTopWithSelf:missionName
                     targetView:createMemberName
                      superView:self.view
                            gap:2];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
