//
//  CircleViewController.m
//  FieldDispatch
//
//  Created by Ｍasqurin on 2017/7/24.
//  Copyright © 2017年 Ｍasqurin. All rights reserved.
//

#import "CircleViewController.h"


@interface CircleViewController ()

@end

@implementation CircleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self prepare];
}

-(void)prepare{
    
    self.view.layer.cornerRadius = self.view.frame.size.height/4;
    self.view.layer.masksToBounds = true;
    
    
    UIView *aaa = [UIView new];
    [self.view addSubview:aaa];
    aaa.translatesAutoresizingMaskIntoConstraints = false;
    NSMutableArray *constraints = [NSMutableArray new];
    [constraints addObject:[NSLayoutConstraint constraintWithItem:aaa attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0.0]];
    [constraints addObject:[NSLayoutConstraint constraintWithItem:aaa attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0.0]];
    [constraints addObject:[NSLayoutConstraint constraintWithItem:aaa attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    [constraints addObject:[NSLayoutConstraint constraintWithItem:aaa attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0]];
    [self.view addConstraints:constraints];
    [self.view layoutIfNeeded];
    
    aaa.backgroundColor = [UIColor yellowColor];
    CGFloat aa = self.view.frame.size.width;
    aaa.layer.cornerRadius = aa/4;
    aaa.layer.borderWidth = aa*.005;
    self.view.layer.cornerRadius = aa/4;
    self.view.layer.masksToBounds = true;

//    self.circle.isUserInteractionEnabled = true;
//    NSLog(@"%@",_circle);
}
-(void)bbb{
    NSLog(@"我被按到惹");
    [self.navigationController popViewControllerAnimated:true];
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
