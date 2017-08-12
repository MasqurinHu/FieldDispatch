//
//  ViewController.m
//  FieldDispatch
//
//  Created by Ｍasqurin on 2017/7/18.
//  Copyright © 2017年 Ｍasqurin. All rights reserved.
//

#import "MainVC.h"
#import "FieldDispatchDataBase.h"

@interface MainVC ()<UIScrollViewDelegate>
{
    BOOL singIn;
    BOOL isprepare;
    double mainXset;
    int buttonMoveTimes;
    CGFloat buttonMoveDistance;
    
    NSTimer *buttonTimer;
    UIScrollView *mainS;
    
    NSLayoutConstraint *bottonFramConstraint;
    
}
@end

@implementation MainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[MobileDataBase stand]
     setSizeWithWidth:self.view.frame.size.width
     height:self.view.frame.size.height];
    
    mainS = [UIScrollView new];
    mainS.delegate = self;
    _onLionSW = [UISwitch new];
    _onLionSW.on = false;
    
    
    
}

-(void)checkLogin{
    singIn = [[LogIn sharedInstance] didLogin];
    if (singIn != true) {
        CheckSingInVC *csvc = [self.storyboard instantiateViewControllerWithIdentifier:@"nav"];
        [self presentViewController:csvc animated:true completion:nil];
        return;
    };
}

-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation{
    
}

-(void)viewWillAppear:(BOOL)animated{
    [self checkLogin];
    
    if (singIn != true) {
        return;
    }
    if (isprepare != true) {
        [self prepare];
    }
    
}

-(void)viewDidLayoutSubviews{
    mainS.contentSize = CGSizeMake(self.view.frame.size.width*3, mainS.frame.size.height);
}

-(void)prepare{
    isprepare = true;
    
    UIView *bottonBar = [UIView new];
    [self.view addSubview:bottonBar];
    bottonBar.backgroundColor = [UIColor
                                 colorWithRed:.5
                                 green:.5
                                 blue:.5
                                 alpha:.5];
    [UIView initHeightWithSelf:bottonBar
                    TargetView:self.view
                     SuperView:self.view
                    Multiplier:.001
                      Constant:50];
    [UIView initWidthWithSelf:bottonBar
                   TargetView:self.view
                    SuperView:self.view
                   Multiplier:1.0
                     Constant:.0];
    [UIView initAtCenterBottonWithSelf:bottonBar
                             SuperView:self.view
                              LevelGap:.0
                           VerticalGap:.0];

    
    
    
    [self.view addSubview:mainS];
    mainS.bounces = false;
    mainS.pagingEnabled = true;
    mainS.translatesAutoresizingMaskIntoConstraints = false;
    NSMutableArray <NSLayoutConstraint*>*layout = [NSMutableArray new];
    [layout addObject:[NSLayoutConstraint
                       constraintWithItem:mainS
                       attribute:NSLayoutAttributeTop
                       relatedBy:NSLayoutRelationEqual
                       toItem:self.topLayoutGuide
                       attribute:NSLayoutAttributeBottom
                       multiplier:1.0
                       constant:.0]];
    [layout addObject:[NSLayoutConstraint
                       constraintWithItem:mainS
                       attribute:NSLayoutAttributeBottom
                       relatedBy:NSLayoutRelationEqual
                       toItem:bottonBar
                       attribute:NSLayoutAttributeTop
                       multiplier:1.0
                       constant:.0]];
    [layout addObject:[NSLayoutConstraint
                       constraintWithItem:mainS
                       attribute:NSLayoutAttributeLeading
                       relatedBy:NSLayoutRelationEqual
                       toItem:self.view
                       attribute:NSLayoutAttributeLeading
                       multiplier:1.0
                       constant:.0]];
    [layout addObject:[NSLayoutConstraint
                       constraintWithItem:mainS
                       attribute:NSLayoutAttributeTrailing
                       relatedBy:NSLayoutRelationEqual
                       toItem:self.view
                       attribute:NSLayoutAttributeTrailing
                       multiplier:1.0
                       constant:.0]];
    [self.view addConstraints:layout];
    
    UIView *main = [UIView new];
    [mainS addSubview: main];
    main.frame = CGRectMake(0,
                            0,
                            self.view.frame.size.width*3,
                            self.view.frame.size.height-self.navigationController.navigationBar.frame.size.height-50);
    
    MapVC *mapVC = [self.storyboard instantiateViewControllerWithIdentifier:@"MapVC"];
    [self addChildViewController:mapVC];
    [main addSubview:mapVC.view];
    mapVC.view.translatesAutoresizingMaskIntoConstraints = false;
    [mapVC didMoveToParentViewController:self];
    
    UserInfoVC *fvc = [self.storyboard instantiateViewControllerWithIdentifier:@"UserInfoVC"];
    [self addChildViewController:fvc];
    [main addSubview:fvc.view];
    fvc.view.translatesAutoresizingMaskIntoConstraints = false;
    [fvc didMoveToParentViewController:self];
    
    UserInfoVC *userInfo = [self.storyboard instantiateViewControllerWithIdentifier:@"UserInfoVC"];//
    [self addChildViewController:userInfo];
    [main addSubview:userInfo.view];
    userInfo.view.translatesAutoresizingMaskIntoConstraints = false;
    [userInfo didMoveToParentViewController:self];
    
//    main.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    
    layout = [NSMutableArray new];
    [layout addObject:[NSLayoutConstraint
                       constraintWithItem:mapVC.view
                       attribute:NSLayoutAttributeWidth
                       relatedBy:NSLayoutRelationEqual
                       toItem:main
                       attribute:NSLayoutAttributeWidth
                       multiplier:1/3
                       constant:[UIScreen mainScreen].bounds.size.width]];
    [layout addObject:[NSLayoutConstraint
                       constraintWithItem:fvc.view
                       attribute:NSLayoutAttributeWidth
                       relatedBy:NSLayoutRelationEqual
                       toItem:mapVC.view
                       attribute:NSLayoutAttributeWidth
                       multiplier:1.0
                       constant:.0]];
    [layout addObject:[NSLayoutConstraint
                       constraintWithItem:userInfo.view
                       attribute:NSLayoutAttributeWidth
                       relatedBy:NSLayoutRelationEqual
                       toItem:fvc.view
                       attribute:NSLayoutAttributeWidth
                       multiplier:1.0
                       constant:.0]];

    
    [layout addObject:[NSLayoutConstraint
                       constraintWithItem:mapVC.view
                       attribute:NSLayoutAttributeTop
                       relatedBy:NSLayoutRelationEqual
                       toItem:main
                       attribute:NSLayoutAttributeTop
                       multiplier:1.0
                       constant:.0]];
    [layout addObject:[NSLayoutConstraint
                       constraintWithItem:mapVC.view
                       attribute:NSLayoutAttributeLeading
                       relatedBy:NSLayoutRelationEqual
                       toItem:main
                       attribute:NSLayoutAttributeLeading
                       multiplier:1.0
                       constant:.0]];
    [layout addObject:[NSLayoutConstraint
                       constraintWithItem:mapVC.view
                       attribute:NSLayoutAttributeBottom
                       relatedBy:NSLayoutRelationEqual
                       toItem:main
                       attribute:NSLayoutAttributeBottom
                       multiplier:1.0
                       constant:.0]];
    [layout addObject:[NSLayoutConstraint
                       constraintWithItem:mapVC.view
                       attribute:NSLayoutAttributeTrailing
                       relatedBy:NSLayoutRelationEqual
                       toItem:fvc.view
                       attribute:NSLayoutAttributeLeading
                       multiplier:1.0
                       constant:.0]];
    
    [layout addObject:[NSLayoutConstraint
                       constraintWithItem:fvc.view
                       attribute:NSLayoutAttributeTop
                       relatedBy:NSLayoutRelationEqual
                       toItem:main
                       attribute:NSLayoutAttributeTop
                       multiplier:1.0
                       constant:.0]];
    [layout addObject:[NSLayoutConstraint
                       constraintWithItem:fvc.view
                       attribute:NSLayoutAttributeLeading
                       relatedBy:NSLayoutRelationEqual
                       toItem:mapVC.view
                       attribute:NSLayoutAttributeTrailing
                       multiplier:1.0
                       constant:.0]];
    [layout addObject:[NSLayoutConstraint
                       constraintWithItem:fvc.view
                       attribute:NSLayoutAttributeBottom
                       relatedBy:NSLayoutRelationEqual
                       toItem:main
                       attribute:NSLayoutAttributeBottom
                       multiplier:1.0
                       constant:.0]];
    [layout addObject:[NSLayoutConstraint
                       constraintWithItem:fvc.view
                       attribute:NSLayoutAttributeTrailing
                       relatedBy:NSLayoutRelationEqual
                       toItem:userInfo.view
                       attribute:NSLayoutAttributeLeading
                       multiplier:1.0
                       constant:.0]];
    
    [layout addObject:[NSLayoutConstraint
                       constraintWithItem:userInfo.view
                       attribute:NSLayoutAttributeTop
                       relatedBy:NSLayoutRelationEqual
                       toItem:main
                       attribute:NSLayoutAttributeTop
                       multiplier:1.0
                       constant:.0]];
    [layout addObject:[NSLayoutConstraint
                       constraintWithItem:userInfo.view
                       attribute:NSLayoutAttributeLeading
                       relatedBy:NSLayoutRelationEqual
                       toItem:fvc.view
                       attribute:NSLayoutAttributeTrailing
                       multiplier:1.0
                       constant:.0]];
    [layout addObject:[NSLayoutConstraint
                       constraintWithItem:userInfo.view
                       attribute:NSLayoutAttributeTrailing
                       relatedBy:NSLayoutRelationEqual
                       toItem:main
                       attribute:NSLayoutAttributeTrailing
                       multiplier:1.0
                       constant:.0]];
    [layout addObject:[NSLayoutConstraint
                       constraintWithItem:userInfo.view
                       attribute:NSLayoutAttributeBottom
                       relatedBy:NSLayoutRelationEqual
                       toItem:main
                       attribute:NSLayoutAttributeBottom
                       multiplier:1.0
                       constant:.0]];
    
    [main addConstraints:layout];
    
    UIBarButtonItem *barBtn = [[UIBarButtonItem alloc]
                               initWithCustomView:_onLionSW];
    [self.navigationItem setRightBarButtonItem:barBtn];
    
    [_onLionSW addTarget:self
                  action:@selector(onLion:)
        forControlEvents:UIControlEventTouchUpInside];
    
    [self.view layoutIfNeeded];
    [bottonBar layoutIfNeeded];
    
    UIView *bottonFram = [UIView new];
    [bottonBar addSubview:bottonFram];
    bottonFram.translatesAutoresizingMaskIntoConstraints = false;
        [UIView initSizeWithSelf:bottonFram
                      TargetView:bottonBar
                       SuperView:bottonBar
                      AttributeX:NSLayoutAttributeWidth
                      AttributeY:NSLayoutAttributeHeight
                     MultiplierX:1/3.0
                     MultiplierY:.8
                            GapX:.0
                            GapY:.0];
    [bottonBar addConstraint:[NSLayoutConstraint
                              constraintWithItem:bottonFram
                              attribute:NSLayoutAttributeCenterY
                              relatedBy:NSLayoutRelationEqual
                              toItem:bottonBar
                              attribute:NSLayoutAttributeCenterY
                              multiplier:1.0
                              constant:.0]];
    bottonFramConstraint = [NSLayoutConstraint
                            constraintWithItem:bottonFram
                            attribute:NSLayoutAttributeLeading
                            relatedBy:NSLayoutRelationEqual
                            toItem:bottonBar
                            attribute:NSLayoutAttributeLeading
                            multiplier:1.0
                            constant:.0];
    [bottonBar addConstraint:bottonFramConstraint];
    [self.view layoutIfNeeded];
    
    bottonFram.layer.cornerRadius = bottonFram.frame.size.height/2;
    bottonFram.layer.borderWidth = bottonFram.frame.size.height*.05;
    
    UIButton *leftVCBtn = [[UIButton alloc]
                           initWithTitle:@"夥伴位置"
                           backgroundColor:[UIColor clearColor]
                           addTarget:self
                           func:@selector(bottonBarButton:)
                           superView:bottonBar];
    [UIView initLocConstraintSelfView:leftVCBtn
                           targetView:bottonBar
                            SuperView:bottonBar
                           AttributeX:NSLayoutAttributeCenterX
                           AttributeY:NSLayoutAttributeCenterY
                          MultiplierX:1/3.0
                          MultiplierY:1.0
                                 GapX:.0
                                 GapY:.0];
    leftVCBtn.tag = 1;
    
    UIButton *centerVCBtn = [[UIButton alloc]
                             initWithTitle:@"任務列表"
                             backgroundColor:[UIColor clearColor]
                             addTarget:self
                             func:@selector(bottonBarButton:)
                             targetView:bottonBar
                             multiplier:1.0
                             superView:bottonBar];
    centerVCBtn.tag = 2;
    
    UIButton *rightVCBtn = [[UIButton alloc]
                            initWithTitle:@"會員資訊"
                            backgroundColor:[UIColor clearColor]
                            addTarget:self
                            func:@selector(bottonBarButton:)
                            superView:bottonBar];
    [UIView initLocConstraintSelfView:rightVCBtn
                           targetView:bottonBar
                            SuperView:bottonBar
                           AttributeX:NSLayoutAttributeCenterX
                           AttributeY:NSLayoutAttributeCenterY
                          MultiplierX:5/3.0
                          MultiplierY:1.0
                                 GapX:.0
                                 GapY:.0];
    rightVCBtn.tag = 3;
    
}

-(void)onLion:(UISwitch*)sender{
    [self.navigationItem setTitle: @"準備中～～～"];
    if ([sender isOn] == true) {
        [MemberDatabase stand].status = 1;
        [[LogIn sharedInstance] reportStatus:^(NSDictionary *res) {
            
            if ([res[@"result"] isEqualToString:@"true"]) {
                [self.navigationItem setTitle: @"onLine~~"];
                //待完成
            }else {
                [_onLionSW setOn:false];
                [MemberDatabase stand].status = 0;
                [self.navigationItem setTitle: @"線路異常~~"];
                
            }
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self.navigationItem setTitle: @""];
            });
        }];
        
    }else {
        [MemberDatabase stand].status = 0;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.navigationItem setTitle: @"offLine~~"];
        });
    }
    
}

-(void)bottonBarButton:(UIView*)sender{
    
    mainS.userInteractionEnabled = false;
    if (buttonMoveTimes != 0) {
        [buttonTimer invalidate];
    }
    double movex = .0;
    if (sender.tag == 1) {
        movex = .0;
    }else if (sender.tag == 2) {
        movex = 1.0;
    }else if (sender.tag == 3) {
        movex = 2.0;
    }
    
    buttonMoveDistance = self.view.frame.size.width*movex-mainXset;
    buttonMoveTimes = 0;
    //
    buttonTimer = [NSTimer scheduledTimerWithTimeInterval:.01
                                                   target:self
                                                 selector:@selector(buttonScrollAnime)
                                                 userInfo:nil
                                                  repeats:true];
    [buttonTimer fire];

}

-(void)buttonScrollAnime{
    
    if (buttonMoveTimes >= 30) {
        [buttonTimer invalidate];
        mainS.userInteractionEnabled = true;
        return;
    }
    buttonMoveTimes++;
    mainS.contentOffset = CGPointMake(mainXset+(buttonMoveDistance/30), 0);;
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    //拉到底動作
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    mainXset = scrollView.contentOffset.x;
    [self moveBottonFrame];
}

-(void)moveBottonFrame{
    bottonFramConstraint.constant = mainXset/3;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }

@end
