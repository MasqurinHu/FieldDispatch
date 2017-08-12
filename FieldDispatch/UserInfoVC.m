//
//  UserInfoVC.m
//  FieldDispatch
//
//  Created by Ｍasqurin on 2017/8/8.
//  Copyright © 2017年 Ｍasqurin. All rights reserved.
//

#import "UserInfoVC.h"
#import "FieldDispatchDataBase.h"

@interface UserInfoVC ()
{
    AdvanceImageView *userPhoto;
    UILabel *userName;
    UILabel *userTel;
    UILabel *userMail;
    UILabel *userType;
    UIButton *signIn;
    
    NSString *scapegoat;
}
@end

@implementation UserInfoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    userTel = [UILabel new];
    userTel.translatesAutoresizingMaskIntoConstraints = false;
    [self.view addSubview:userTel];
    [UIView initAtCenterCenterWithSelf:userTel
                             SuperView:self.view
                              LevelGap:.0
                           VerticalGap:.0];
    
    userName = [UILabel new];
    userName.translatesAutoresizingMaskIntoConstraints = false;
    [self.view addSubview:userName];
    [UIView initFromBottonWithSelf:userName
                     targetView:userTel
                      superView:self.view
                            gap:-10.0];
    
    userPhoto = [AdvanceImageView new];
    userPhoto.translatesAutoresizingMaskIntoConstraints = false;
    [self.view addSubview:userPhoto];
    [UIView initFromBottonWithSelf:userPhoto
                     targetView:userName
                      superView:self.view
                            gap:-10.0];
    
    userMail = [UILabel new];
    userMail.translatesAutoresizingMaskIntoConstraints = false;
    [self.view addSubview:userMail];
    [UIView initFromTopWithSelf:userMail
                        targetView:userTel
                         superView:self.view
                               gap:10.0];
    
    userType = [UILabel new];
    userType.translatesAutoresizingMaskIntoConstraints = false;
    [self.view addSubview:userType];
    [UIView initFromTopWithSelf:userType
                     targetView:userMail
                      superView:self.view
                            gap:10];
    
    signIn = [[MUIButtonAutoLayout alloc]
              initWithTitle:@"SignIn"
              backgroundColor:[UIColor yellowColor]
              addTarget:self
              func:@selector(changeUserInfo)
              superView:self.view];
    [UIView initFromTopWithSelf:signIn
                        targetView:userType
                         superView:self.view
                               gap:10.0];
    [self changeUserInfo];
}

-(void)changeUserInfo{
    userTel.text = [MemberDatabase stand].tel;
    userName.text = [MemberDatabase stand].nickName;
    userMail.text = [MemberDatabase stand].mali;
    scapegoat = [MemberDatabase stand].photoURL;
    userType.text = [NSString stringWithFormat:@"帳號類型：%d",[MemberDatabase stand].memberType];
    NSURL *url = [NSURL URLWithString:scapegoat];
    [userPhoto loadImageWithURL:url];
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
