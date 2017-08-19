//
//  CreateMissionVC.m
//  FieldDispatch
//
//  Created by Ｍasqurin on 2017/8/14.
//  Copyright © 2017年 Ｍasqurin. All rights reserved.
//

#import "CreateMissionVC.h"


@interface CreateMissionVC ()
{
    UIScrollView *background;
}
@end

@implementation CreateMissionVC

-(void)viewDidLayoutSubviews{
    background.contentSize = CGSizeMake(background.frame.size.width, background.frame.size.height*3);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    background = [UIScrollView new];
    [self.view addSubview:background];
    background.translatesAutoresizingMaskIntoConstraints = false;
    [UIView initSizeWithSelf:background
                  TargetView:self.view
                   SuperView:self.view
                  AttributeX:NSLayoutAttributeWidth
                  AttributeY:NSLayoutAttributeHeight
                 MultiplierX:1.0
                 MultiplierY:1.0
                        GapX:.0
                        GapY:.0];
    [UIView initAtCenterCenterWithSelf:background
                             SuperView:self.view
                              LevelGap:.0
                           VerticalGap:.0];
    
    
    UILabel *onLionGroupName = [UILabel new];
    onLionGroupName.text = _mission.groupName;
    if (_mission.groupName == NULL) {
        onLionGroupName.text = [MemberDatabase stand].onLionGroupName;
    }
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
