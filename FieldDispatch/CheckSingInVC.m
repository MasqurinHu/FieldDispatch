//
//  CheckSingInVC.m
//  FieldDispatch
//
//  Created by Ｍasqurin on 2017/8/2.
//  Copyright © 2017年 Ｍasqurin. All rights reserved.
//

#import "CheckSingInVC.h"
#import "FieldDispatchDataBase.h"

@interface CheckSingInVC ()

@end

@implementation CheckSingInVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *useRightNow = [[UIButton alloc]
                             initWithTitle:@"馬上使用"
                             backgroundColor:[UIColor brownColor]
                             addTarget:self
                             func:@selector(useNow)
                             superView:self.view];
    [UIView initAtCenterCenterWithSelf:useRightNow
                             SuperView:self.view
                              LevelGap:.0
                           VerticalGap:-20.0];
    UIButton *singIn = [[UIButton alloc]
                        initWithTitle:@"登入方式"
                        backgroundColor:[UIColor blueColor]
                        addTarget:self
                        func:@selector(chooseSingIn)
                        superView:self.view];
    [UIView initFromTopWithSelf:singIn
                     targetView:useRightNow
                      superView:self.view
                            gap:10];
    
    
    
}

-(void)useNow{
    NSLog(@"\n按下馬上使用");
    [[LogIn sharedInstance] newDevice:^(NSError *error, BOOL result) {
        if (result) {
            NSLog(@"\n幾秒回來");
//            [self dismissViewControllerAnimated:true completion:nil];
        }
    }];
    
}

-(void)chooseSingIn{
    SingInVC *sivc = [self.storyboard instantiateViewControllerWithIdentifier:@"SingInVC"];
    [self.navigationController pushViewController:sivc animated:true];
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
