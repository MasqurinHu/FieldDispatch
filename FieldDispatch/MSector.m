//
//  MSector.m
//  FieldDispatch
//
//  Created by Ｍasqurin on 2017/9/3.
//  Copyright © 2017年 Ｍasqurin. All rights reserved.
//

#import "MSector.h"
#import "FieldDispatchDataBase.h"

@interface MSector ()
{
    UIView *sector;
    CGFloat size;
    
    UIButton *bt1;
    UIButton *bt2;
    UIButton *bt3;
    UIButton *bt4;
    UIButton *dis;
}
@end

@implementation MSector

-(instancetype)initSectorWithSuperView:(UIView *)superView {
    self = [super init];
    self.translatesAutoresizingMaskIntoConstraints = false;
    size = [MobileDataBase stand].square * .85;
    [superView addSubview:self];
    [UIView initSizeWithSelf:self
                  TargetView:superView
                   SuperView:superView
                  AttributeX:NSLayoutAttributeWidth
                  AttributeY:NSLayoutAttributeHeight
                 MultiplierX:1.0
                 MultiplierY:1.0
                        GapX:.0
                        GapY:.0];
    [UIView initAtCenterCenterWithSelf:self
                             SuperView:superView
                              LevelGap:.0
                           VerticalGap:.0];
    self.backgroundColor = [[UIColor alloc] initWithRed:10/255.f green:10/255.f blue:10/255.f alpha:.5];
    [self addTarget:self
             action:@selector(dismiss:)
   forControlEvents:UIControlEventTouchUpInside];
    
    sector = [UIView new];
    sector.clipsToBounds = true;
    sector.translatesAutoresizingMaskIntoConstraints = false;
    [self addSubview:sector];
    [[sector.widthAnchor
      constraintEqualToConstant:size * 2]
     setActive:true];
    [[sector.heightAnchor
      constraintEqualToConstant:size * 2]
     setActive:true];
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:sector
                         attribute:NSLayoutAttributeCenterX
                         relatedBy:NSLayoutRelationEqual
                         toItem:self
                         attribute:NSLayoutAttributeTrailing
                         multiplier:1.0
                         constant:.0]];
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:sector
                         attribute:NSLayoutAttributeCenterY
                         relatedBy:NSLayoutRelationEqual
                         toItem:self
                         attribute:NSLayoutAttributeBottom
                         multiplier:1.0
                         constant:-20.0]];
    sector.layer.cornerRadius = size;
    sector.backgroundColor = [[UIColor alloc]
                              initWithRed:205/255.0f
                              green:232/255.0f
                              blue:85/255.0f
                              alpha:.5];
    
    
    [self layoutIfNeeded];
    
    bt1 = [[UIButton alloc]
           initWithTitle:@"委託"
           backgroundColor:[[UIColor alloc]
                            initWithRed:74/255.0f
                            green:217/255.0f
                            blue:217/255.0f
                            alpha:.5]
           addTarget:self
           func:@selector(choose1:)
           superView:self];
    
    [self addConstraint:[NSLayoutConstraint
                              constraintWithItem:bt1
                              attribute:NSLayoutAttributeLeading
                              relatedBy:NSLayoutRelationEqual
                              toItem:sector
                              attribute:NSLayoutAttributeLeading
                              multiplier:1.0f
                              constant:size *.15f]];
    [self addConstraint:[NSLayoutConstraint
                              constraintWithItem:bt1
                              attribute:NSLayoutAttributeTop
                              relatedBy:NSLayoutRelationEqual
                              toItem:sector
                              attribute:NSLayoutAttributeTop
                              multiplier:1.0f
                              constant:size *.7f]];
    
    bt2 = [[UIButton alloc]
           initWithTitle:@"接受"
           backgroundColor:[[UIColor alloc]
                            initWithRed:74/255.0f
                            green:217/255.0f
                            blue:217/255.0f
                            alpha:.5]
           addTarget:self
           func:@selector(choose2:)
           superView:self];
    
    [self addConstraint:[NSLayoutConstraint
                              constraintWithItem:bt2
                              attribute:NSLayoutAttributeLeading
                              relatedBy:NSLayoutRelationEqual
                              toItem:sector
                              attribute:NSLayoutAttributeLeading
                              multiplier:1.0
                              constant:size *.25f]];
    [self addConstraint:[NSLayoutConstraint
                              constraintWithItem:bt2
                              attribute:NSLayoutAttributeTop
                              relatedBy:NSLayoutRelationEqual
                              toItem:sector
                              attribute:NSLayoutAttributeTop
                              multiplier:1.0
                              constant:size *.5f]];
    
    bt3 = [[UIButton alloc]
           initWithTitle:@"完成"
           backgroundColor:[[UIColor alloc]
                            initWithRed:74/255.0f
                            green:217/255.0f
                            blue:217/255.0f
                            alpha:.5]
           addTarget:self
           func:@selector(choose3:)
           superView:self];
    
    [self addConstraint:[NSLayoutConstraint
                              constraintWithItem:bt3
                              attribute:NSLayoutAttributeLeading
                              relatedBy:NSLayoutRelationEqual
                              toItem:sector
                              attribute:NSLayoutAttributeLeading
                              multiplier:1.0f
                              constant:size *.4f]];
    [self addConstraint:[NSLayoutConstraint
                              constraintWithItem:bt3
                              attribute:NSLayoutAttributeTop
                              relatedBy:NSLayoutRelationEqual
                              toItem:sector
                              attribute:NSLayoutAttributeTop
                              multiplier:1.0f
                              constant:size *.3f]];
    
    
    bt4 = [[UIButton alloc]
           initWithTitle:@"可接受"
           backgroundColor:[[UIColor alloc]
                            initWithRed:74/255.0f
                            green:217/255.0f
                            blue:217/255.0f
                            alpha:.5]
           addTarget:self
           func:@selector(choose4:)
           superView:self];
    
    [self addConstraint:[NSLayoutConstraint
                              constraintWithItem:bt4
                              attribute:NSLayoutAttributeLeading
                              relatedBy:NSLayoutRelationEqual
                              toItem:sector
                              attribute:NSLayoutAttributeLeading
                              multiplier:1.0f
                              constant:size *.6]];
    [self addConstraint:[NSLayoutConstraint
                              constraintWithItem:bt4
                              attribute:NSLayoutAttributeTop
                              relatedBy:NSLayoutRelationEqual
                              toItem:sector
                              attribute:NSLayoutAttributeTop
                              multiplier:1.0f
                              constant:size *.15]];
    
    dis = [[UIButton alloc]
           initWithTitle:@"一"
           backgroundColor:[UIColor orangeColor]
           addTarget:self
           func:@selector(dismiss:)
           superView:self];
    [UIView initAtRightBotonWithSelf:dis
                           SuperView:self
                            LevelGap:-20
                         VerticalGap:-60];
    [[dis.widthAnchor constraintEqualToConstant:50.0] setActive:true];
    [[dis.heightAnchor constraintEqualToConstant:50.0] setActive:true];
    [self layoutIfNeeded];
    dis.layer.cornerRadius = dis.frame.size.width/2;
    
    self.page = 2;
    
    return self;
}

-(void)dismiss:(UIButton*)sender{
    
    [sender removeFromSuperview];
    for (UIView *tmp in self.subviews) {
        [tmp removeFromSuperview];
    }
    [self removeFromSuperview];
    
    sender = nil;
}

-(void)setPage:(int)page {
    _page = page;
    switch (page) {
        case 1:
            
            break;
        case 2:
            [bt1 setTitle:MISSION_TYPE_DELAGATE forState:UIControlStateNormal];
            [bt2 setTitle:MISSION_TYPE_ACCEPTED forState:UIControlStateNormal];
            [bt3 setTitle:MISSION_TYPE_COMPLETE forState:UIControlStateNormal];
            [bt4 setTitle:MISSION_TYPE_ACCEPTABLE forState:UIControlStateNormal];
            break;
            
        default:
            break;
    }
}

-(void) choose1:(UIButton*)sender {
    for (UIViewController *tmp in [[MobileDataBase stand].uiViewcontrollerList[1] childViewControllers]) {
        if ([tmp isKindOfClass:[MissionListTVC class]]) {
            [((MissionListTVC*)tmp).navigationItem setTitle:MISSION_TYPE_DELAGATE];
            ((MissionListTVC*)tmp).array = [MemberDatabase stand].mission.delegate;
            [((UITableViewController*)tmp).tableView reloadData];
        }
        if ([tmp isKindOfClass:[MemberTVC class]]) {
            [((UITableViewController*)tmp).tableView reloadData];
        }
    }
    [self dismiss:sender];
}

-(void) choose2:(UIButton*)sender {
    for (UIViewController *tmp in [[MobileDataBase stand].uiViewcontrollerList[1] childViewControllers]) {
        if ([tmp isKindOfClass:[MissionListTVC class]]) {
            [((MissionListTVC*)tmp).navigationItem setTitle:MISSION_TYPE_ACCEPTED];
            ((MissionListTVC*)tmp).array = [MemberDatabase stand].mission.acceptedList;
            [((UITableViewController*)tmp).tableView reloadData];
        }
        if ([tmp isKindOfClass:[MemberTVC class]]) {
            [((UITableViewController*)tmp).tableView reloadData];
        }
    }
    [self dismiss:sender];
}

-(void) choose3:(UIButton*)sender {
    for (UIViewController *tmp in [[MobileDataBase stand].uiViewcontrollerList[1] childViewControllers]) {
        if ([tmp isKindOfClass:[MissionListTVC class]]) {
            [((MissionListTVC*)tmp).navigationItem setTitle:MISSION_TYPE_COMPLETE];
            ((MissionListTVC*)tmp).array = [MemberDatabase stand].mission.completeList;
            [((UITableViewController*)tmp).tableView reloadData];
        }
        if ([tmp isKindOfClass:[MemberTVC class]]) {
            [((UITableViewController*)tmp).tableView reloadData];
        }
    }
    [self dismiss:sender];
}

-(void) choose4:(UIButton*)sender {
    for (UIViewController *tmp in [[MobileDataBase stand].uiViewcontrollerList[1] childViewControllers]) {
        if ([tmp isKindOfClass:[MissionListTVC class]]) {
            [((MissionListTVC*)tmp).navigationItem setTitle:MISSION_TYPE_ACCEPTABLE];
            ((MissionListTVC*)tmp).array = [MemberDatabase stand].mission.acceptableList;
            [((UITableViewController*)tmp).tableView reloadData];
        }
        if ([tmp isKindOfClass:[MemberTVC class]]) {
            [((UITableViewController*)tmp).tableView reloadData];
        }
    }
    [self dismiss:sender];
}



// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}


@end
