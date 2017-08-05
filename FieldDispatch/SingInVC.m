//
//  LoginViewController.m
//  FieldDispatch
//
//  Created by Ｍasqurin on 2017/7/21.
//  Copyright © 2017年 Ｍasqurin. All rights reserved.
//

#import "SingInVC.h"
#import "FieldDispatchDataBase.h"

@interface SingInVC ()<GIDSignInUIDelegate,GIDSignInDelegate,FBSDKLoginButtonDelegate>
{
    FBSDKLoginButton *fbSingIn;
    NSLayoutConstraint *constraint;
    NSMutableArray <NSLayoutConstraint*>*constraints;
}

@end

@implementation SingInVC

- (void)viewDidLoad {
    [super viewDidLoad];
    constraints = [NSMutableArray new];
    // Do any additional setup after loading the view.
    [GIDSignIn sharedInstance].uiDelegate = self;
    [GIDSignIn sharedInstance].delegate = self;
    fbSingIn = [FBSDKLoginButton new];
    fbSingIn.delegate = self;
    [self prepare];
}
-(void)singoutView{
    //登出準備登入畫面
    
    GIDSignInButton *google = [GIDSignInButton new];
    [self.view addSubview:google];
    [UIView initAtCenterCenterWithSelf:google
                             SuperView:self.view
                              LevelGap:.0
                           VerticalGap:.0];
    
    [self.view addSubview:fbSingIn];
    [UIView initHeightWithSelf:fbSingIn
                    TargetView:self.view
                     SuperView:self.view
                    Multiplier:.001
                      Constant:google.frame.size.height*.85];
    [UIView initFromTopWithSelf:fbSingIn
                     targetView:google
                      superView:self.view
                            gap:10.0];
    
    [UIView initWidthWithSelf:google
                   TargetView:fbSingIn
                    SuperView:self.view
                   Multiplier:1.02
                     Constant:.0];
    
    UIButton *newDevice = [[UIButton alloc]
                           initWithTitle:@"Field Dispatch Sing In"
                           backgroundColor:[UIColor brownColor]
                           addTarget:self func:@selector(singinView)
                           superView:self.view];
    [UIView initFromBottonWithSelf:newDevice
                     targetView:google
                      superView:self.view
                            gap:-10];
    [UIView initSizeWithSelf:newDevice
                  TargetView:fbSingIn
                   SuperView:self.view
                  AttributeX:NSLayoutAttributeWidth
                  AttributeY:NSLayoutAttributeHeight
                 MultiplierX:1.0
                 MultiplierY:1.0
                        GapX:.0
                        GapY:.0];
    
    UIButton *googleSingOut = [[UIButton alloc]
                               initWithTitle:@"Google Sign Out"
                               backgroundColor:[UIColor greenColor]
                               addTarget:self
                               func:@selector(didTapSignOut:)
                               superView:self.view];
    [UIView initFromTopWithSelf:googleSingOut
                        targetView:fbSingIn
                         superView:self.view
                               gap:10];
    [UIView initSizeWithSelf:googleSingOut
                  TargetView:fbSingIn
                   SuperView:self.view
                  AttributeX:NSLayoutAttributeWidth
                  AttributeY:NSLayoutAttributeHeight
                 MultiplierX:1.0
                 MultiplierY:1.0
                        GapX:.0
                        GapY:.0];
    
    
}

-(void)singinView{
    //登入準備登出畫面
    FieldDispatchLoginChooseViewController *fd = [self.storyboard instantiateViewControllerWithIdentifier:@"FieldDispatchLoginChooseViewController"];
    [self.navigationController pushViewController:fd animated:true];
}

-(void)prepare{
    
    [self singoutView];
}

-(void)viewWillDisappear:(BOOL)animated{
    
}

-(void)gotoFDLogin{
    FieldDispatchLoginChooseViewController *fDL = [self.storyboard instantiateViewControllerWithIdentifier:@"FieldDispatchLoginChooseViewController"];
    [self.navigationController pushViewController:fDL animated:true];
}
-(void)viewWillAppear:(BOOL)animated{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}
#pragma Mark - Google登入
- (void)signIn:(GIDSignIn *)signIn
didSignInForUser:(GIDGoogleUser *)user
     withError:(NSError *)error {
    // Perform any operations on signed in user here.
    // For client-side use only!
    if (user == nil) {
        NSLog(@"登入失敗");
        return;
    }
    
    NSString *userId = user.userID;
    NSString *idToken = user.authentication.idToken;
    NSString *fullName = user.profile.name;
    NSString *givenName = user.profile.givenName;
    NSString *familyName = user.profile.familyName;
    NSString *email = user.profile.email;
    NSLog(@"\n我是id: %@\n我是全名: %@\n我是givenName: %@\n我是性: %@\n我是信箱: %@",userId,fullName,givenName,familyName,email);
    NSLog(@"\n我是偷捆: %@\n好像超過log長度不顯示",idToken);
    
    [[LogIn sharedInstance] signInAccount:userId
                                 memberId:0         //未登入
                         memberSingInType:2         //1facebook 2google 3fielddispatch
                                 nickName:fullName
                                 password:idToken
                                    photo:@"none"
                      transmissionResults:^(NSError *error, id result) {
                          NSDictionary *severMemo = (NSDictionary*)result;
                          NSLog(@"我是google登入回來\n%@",severMemo);
                          if ([severMemo[@"result"] boolValue]) {
                              
                              NSString *memberId = severMemo[@"memberId"];
                              [[NSUserDefaults standardUserDefaults] setObject:memberId forKey:@"memberId"];
                              [[NSUserDefaults standardUserDefaults] synchronize];
                              [self dismissViewControllerAnimated:true completion:nil];
                          }
    }];
    
    
}

- (void)didTapSignOut:(id)sender {
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"login"];
    NSLog(@"登出Google");
    [[GIDSignIn sharedInstance] signOut];
}


#pragma  Mark - 我是FB登入
-(void)loginButtonDidLogOut:(FBSDKLoginButton *)loginButton{
    NSLog(@"我是FB登出回來呼叫");
}
-(BOOL)loginButtonWillLogin:(FBSDKLoginButton *)loginButton{
    BOOL aaa = true;
    NSLog(@"我是FB未登入狀態按下按鈕 回傳f不動作 回傳t跳轉登入畫面");
    return aaa;
}

-(void)loginButton:(FBSDKLoginButton *)loginButton didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result error:(NSError *)error{
    NSLog(@"我是FB登入畫面回來呼叫 不管有沒有登入成功");
    
    if ([FBSDKAccessToken currentAccessToken] == false) {
        NSLog(@"登入失敗");
        return;
    }
    
    loginButton.readPermissions =
    @[@"public_profile", @"email", @"user_friends"];
    FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc]
                                  initWithGraphPath:@"me"
                                  parameters:@{@"fields" : @"gender,picture,email, name, first_name, last_name"}
                                  HTTPMethod:@"GET"];
    
    [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection,
                                          id result,
                                          NSError *error) {
        // Handle the result
        NSLog(@"我是資料%@",result);
        NSDictionary *fbMemo = (NSDictionary*)result;
        NSString *fbid = fbMemo[@"id"];
        NSString *fbname = fbMemo[@"name"];
        NSString *fbToken = @"none";
        NSString *fbphoto = fbMemo[@"picture"][@"data"][@"url"];
        NSLog(@"\n我是id %@\n我是name %@\n我是相片 %@",fbid,fbname,fbphoto);
        [[LogIn sharedInstance] signInAccount:fbid
                                     memberId:0
                             memberSingInType:1
                                     nickName:fbname
                                     password:fbToken
                                        photo:fbphoto
                          transmissionResults:^(NSError *error, id result) {
                              
                              NSDictionary *severMemo = (NSDictionary*)result;
                              if ([severMemo[@"result"] boolValue]) {
                                  NSLog(@"我是fb登入回來\n%@",severMemo);
                                  NSString *memberId = severMemo[@"memberId"];
                                  [[NSUserDefaults standardUserDefaults] setObject:memberId forKey:@"memberId"];
                                  [[NSUserDefaults standardUserDefaults] synchronize];
                                  [self dismissViewControllerAnimated:true completion:nil];
                              }
                              
                              
                              
        }];
        
    }];
    
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
