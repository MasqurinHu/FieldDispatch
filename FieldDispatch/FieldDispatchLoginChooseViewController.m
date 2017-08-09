//
//  FieldDispatchLoginChooseViewController.m
//  FieldDispatch
//
//  Created by Ｍasqurin on 2017/7/23.
//  Copyright © 2017年 Ｍasqurin. All rights reserved.
//

#import "FieldDispatchLoginChooseViewController.h"
#import "FieldDispatchDataBase.h"



#define LOGIN_OR_CREATE     NSLocalizedString(@"Login or Create",nil)     //登入或建立帳號
#define ENTER_ACCOUNT       NSLocalizedString(@"please enter your account",nil)
#define ENTER_PASSWORD      NSLocalizedString(@"Please enter your password",nil)
#define FORGET_PASSWORD     NSLocalizedString(@"forget password",nil)
#define CREATE_ACCOUNT      NSLocalizedString(@"Create an account",nil)
#define SIGN_IN             NSLocalizedString(@"Sign in",nil)





@interface FieldDispatchLoginChooseViewController ()<UITextFieldDelegate>
{
    LogIn *login;
    MobileDataBase *mobileDataBase;
    UIView *fram;
    NSLayoutConstraint *framBotton;
    CGFloat move;
}
@end

@implementation FieldDispatchLoginChooseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardNotification:) name:UIKeyboardWillShowNotification object:nil];
    // Do any additional setup after loading the view.
    login = [LogIn sharedInstance];
    mobileDataBase = [MobileDataBase stand];
    [self prepare];
}


-(void)viewDidDisappear:(BOOL)animated{
    [[NSNotificationCenter defaultCenter]
     removeObserver:self name:UIKeyboardWillShowNotification object:nil];
}

-(void)keyboardNotification:(NSNotification*)notification {
    CGRect keyboardFrame = [[[notification userInfo]
                             objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat kBy = self.view.frame.size.height - keyboardFrame.origin.y;
    
    [UIView animateWithDuration:0.6 animations:^{
        NSLog(@"我多高%f\n鍵盤多高%f\nkBy=%f",move,keyboardFrame.origin.y,kBy);
        if (move < kBy -90) {
            return ;
        }
        framBotton.constant = kBy - move - 90;
    }];
    [self.view layoutIfNeeded];
}

-(void)framMovesize:(UIView*)sender{
    framBotton.constant = 0.0;
    [UIView animateWithDuration:.6 animations:^{
        [self.view layoutIfNeeded];
    }];
    NSLog(@"我多高");
    move = sender.center.y;
}

-(void)prepare{
    
    NSMutableArray <NSLayoutConstraint*>*constraints = [NSMutableArray new];
    fram = [UIView new];
    UILabel *loginOrCreate = [UILabel new];
    loginOrCreate.translatesAutoresizingMaskIntoConstraints = false;
    loginOrCreate.text = LOGIN_OR_CREATE;
    loginOrCreate.textAlignment = NSTextAlignmentCenter;
    loginOrCreate.font = [UIFont systemFontOfSize:30];
    [self.view addSubview:loginOrCreate];
    
    [constraints addObject:[NSLayoutConstraint
                            constraintWithItem:loginOrCreate
                            attribute:NSLayoutAttributeWidth
                            relatedBy:NSLayoutRelationEqual
                            toItem:fram
                            attribute:NSLayoutAttributeWidth
                            multiplier:1.0
                            constant:0.0]];
    [constraints addObject:[NSLayoutConstraint constraintWithItem:loginOrCreate attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:fram attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    [constraints addObject:[NSLayoutConstraint constraintWithItem:loginOrCreate attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:fram attribute:NSLayoutAttributeTop multiplier:1.0 constant:-10.0]];
    fram.backgroundColor = [UIColor lightGrayColor];
    
    fram.translatesAutoresizingMaskIntoConstraints = false;
    [self.view addSubview:fram];
    
    [constraints addObject:[NSLayoutConstraint constraintWithItem:fram attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:NULL attribute:NSLayoutAttributeWidth multiplier:1.0 constant:mobileDataBase.square*.95]];
    [constraints addObject:[NSLayoutConstraint constraintWithItem:fram attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:NULL attribute:NSLayoutAttributeWidth multiplier:1.0 constant:mobileDataBase.square*.95]];
    [constraints addObject:[NSLayoutConstraint constraintWithItem:fram attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    framBotton = [NSLayoutConstraint constraintWithItem:fram attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0];
    [constraints addObject:framBotton];
    [self.view addConstraints:constraints];
    [self.view layoutIfNeeded];
    fram.layer.borderWidth = fram.frame.size.height*.01;
    fram.layer.cornerRadius = fram.frame.size.height*.05;
    MUIBottonlineTextField *account = [MUIBottonlineTextField new];
    [account addTarget:self action:@selector(framMovesize:) forControlEvents:UIControlEventAllEditingEvents];
    account.translatesAutoresizingMaskIntoConstraints = false;
    [fram addSubview:account];
    account.placeholder = ENTER_ACCOUNT;
    constraints = [NSMutableArray new];
    [constraints addObject:[NSLayoutConstraint constraintWithItem:account attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:fram attribute:NSLayoutAttributeWidth multiplier:.8 constant:0.0]];
    [constraints addObject:[NSLayoutConstraint constraintWithItem:account attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:fram attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    [constraints addObject:[NSLayoutConstraint constraintWithItem:account attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:fram attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:-15.0]];
    [fram addConstraints:constraints];
    MUIBottonlineTextField *password = [MUIBottonlineTextField new];
    [password addTarget:self action:@selector(framMovesize:) forControlEvents:UIControlEventAllEditingEvents];
    [self framConstraintMaserWithSelf:password target:account superView:fram];
    password.placeholder = ENTER_PASSWORD;
    UIButton *forgetpassword = [UIButton buttonWithType:UIButtonTypeSystem];
    [self btnConstraintMakeWithSelf:forgetpassword target:password scale:.6 lort:NSLayoutAttributeLeading title:FORGET_PASSWORD backgroundCoclr:[UIColor orangeColor] superView:fram func:@selector(forget)];
    UIButton *createAnAccount = [UIButton buttonWithType:UIButtonTypeSystem];
    [self btnConstraintMakeWithSelf:createAnAccount target:forgetpassword scale:1.0 lort:NSLayoutAttributeLeading title:CREATE_ACCOUNT backgroundCoclr:[UIColor orangeColor] superView:fram func:@selector(create)];
    UIButton *signin = [UIButton buttonWithType:UIButtonTypeSystem];
    [self btnConstraintMakeWithSelf:signin target:password scale:.3 lort:NSLayoutAttributeTrailing title:SIGN_IN backgroundCoclr:[UIColor greenColor] superView:fram func:@selector(login)];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    framBotton.constant = 0.0;
    [self.view endEditing:YES];
    [UIView animateWithDuration:.6 animations:^{
        [self.view layoutIfNeeded];
    }];
    
}

//
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    
    
}

-(void)forget{
    NSLog(@"忘記惹");
}

-(void)create{
    NSLog(@"建立惹");
}

-(void)login{
    NSLog(@"登陸惹");
}

-(void)btnConstraintMakeWithSelf:(UIButton*)uiView
                          target:(UIView*)targetView
                           scale:(CGFloat)scale
                            lort:(NSLayoutAttribute)lort
                           title:(NSString*)title
                 backgroundCoclr:(UIColor*)bgc
                       superView:(UIView*)superView
                            func:(SEL)func {
    uiView.translatesAutoresizingMaskIntoConstraints = false;
    [uiView setTitle:title forState:UIControlStateNormal];
    uiView.backgroundColor = bgc;
    [superView addSubview:uiView];
    NSMutableArray *cs = [NSMutableArray new];
    [cs addObject:[NSLayoutConstraint
                   constraintWithItem:uiView
                   attribute:NSLayoutAttributeWidth
                   relatedBy:NSLayoutRelationEqual
                   toItem:targetView
                   attribute:NSLayoutAttributeWidth
                   multiplier:scale
                   constant:0.0]];
    [cs addObject:[NSLayoutConstraint
                   constraintWithItem:uiView
                   attribute:lort relatedBy:NSLayoutRelationEqual
                   toItem:targetView
                   attribute:lort
                   multiplier:1.0
                   constant:0.0]];
    [cs addObject:[NSLayoutConstraint
                   constraintWithItem:uiView
                   attribute:NSLayoutAttributeTop
                   relatedBy:NSLayoutRelationEqual
                   toItem:targetView
                   attribute:NSLayoutAttributeBottom
                   multiplier:1.0
                   constant:15]];
    [superView addConstraints:cs];
    [superView layoutIfNeeded];
    uiView.layer.cornerRadius = uiView.frame.size.height*.3;
    uiView.layer.borderWidth = uiView.frame.size.height*.05;
    [uiView addTarget:self action:func forControlEvents:UIControlEventTouchUpInside];
}


-(void)creat{
    MUIBottonlineTextField *tel = [MUIBottonlineTextField new];
    [self framConstraintMaserWithSelf:tel
                               target:tel
                            superView:fram];//待修改
    tel.placeholder = @"請輸入電話";
    MUIBottonlineTextField *nickname = [[MUIBottonlineTextField alloc]
                                        initWithPlaseHold:@"請輸入暱稱"];
    [self framConstraintMaserWithSelf:nickname
                               target:tel
                            superView:fram];
    MUIBottonlineTextField *email = [[MUIBottonlineTextField alloc]
                                     initWithPlaseHold:@"請輸入信箱"];
    [self framConstraintMaserWithSelf:email
                               target:nickname
                            superView:fram];
}

-(void)framConstraintMaserWithSelf:(UIView*)uiView
                            target:(UIView*)targetView
                         superView:(UIView*)superView {
    uiView.translatesAutoresizingMaskIntoConstraints = false;
    [superView addSubview:uiView];
    NSMutableArray *cs = [NSMutableArray new];
    [cs addObject:[NSLayoutConstraint
                   constraintWithItem:uiView
                   attribute:NSLayoutAttributeWidth
                   relatedBy:NSLayoutRelationEqual
                   toItem:targetView
                   attribute:NSLayoutAttributeWidth
                   multiplier:1.0
                   constant:0.0]];
    [cs addObject:[NSLayoutConstraint
                   constraintWithItem:uiView
                   attribute:NSLayoutAttributeCenterX
                   relatedBy:NSLayoutRelationEqual
                   toItem:targetView
                   attribute:NSLayoutAttributeCenterX
                   multiplier:1.0
                   constant:0.0]];
    [cs addObject:[NSLayoutConstraint
                   constraintWithItem:uiView
                   attribute:NSLayoutAttributeTop
                   relatedBy:NSLayoutRelationEqual
                   toItem:targetView
                   attribute:NSLayoutAttributeBottom
                   multiplier:1.0
                   constant:30]];
    [superView addConstraints:cs];
    
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
