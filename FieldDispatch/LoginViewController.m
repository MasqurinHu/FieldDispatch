//
//  LoginViewController.m
//  FieldDispatch
//
//  Created by Ｍasqurin on 2017/7/21.
//  Copyright © 2017年 Ｍasqurin. All rights reserved.
//

#import "LoginViewController.h"
#import "FieldDispatchDataBase.h"

@interface LoginViewController ()<GIDSignInUIDelegate,GIDSignInDelegate,FBSDKLoginButtonDelegate>
{
    FBSDKLoginButton *loginButton1;
    NSLayoutConstraint *constraint;
    NSMutableArray <NSLayoutConstraint*>*constraints;
}
@property(weak, nonatomic) IBOutlet GIDSignInButton *signInButton;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    constraints = [NSMutableArray new];
    // Do any additional setup after loading the view.
    [self prepare];
}
-(void)singoutView{
    //登出準備登入畫面
    UILabel *title = [UILabel new];
    title.numberOfLines = 0;
    title.text = @"Welcome to the Field Dispatch system\nPlease select the login method";
    
    [title setTranslatesAutoresizingMaskIntoConstraints:false];

    [self.view addSubview:title];
    [constraints addObject:[NSLayoutConstraint
                            constraintWithItem:title
                            attribute:NSLayoutAttributeCenterX
                            relatedBy:NSLayoutRelationEqual
                            toItem:self.view
                            attribute:NSLayoutAttributeCenterX
                            multiplier:1.0
                            constant:0.0
                            ]];

    [constraints addObject:[NSLayoutConstraint
                            constraintWithItem:title
                            attribute:NSLayoutAttributeCenterY
                            relatedBy:NSLayoutRelationEqual
                            toItem:self.view
                            attribute:NSLayoutAttributeCenterY
                            multiplier:1/3.0 constant:0.0]];
    
    MUIBottonlineTextField *account = [MUIBottonlineTextField new];
    account.placeholder = @"Please enter the account";//請輸入您要申請的帳戶
    [account setTranslatesAutoresizingMaskIntoConstraints:false];
    [self.view addSubview:account];
    [constraints addObject:[NSLayoutConstraint
                            constraintWithItem:account
                            attribute:NSLayoutAttributeWidth
                            relatedBy:NSLayoutRelationEqual
                            toItem:self.view
                            attribute:NSLayoutAttributeWidth
                            multiplier:.8
                            constant:0.0
                            ]];

    [constraints addObject:[NSLayoutConstraint
                            constraintWithItem:account
                            attribute:NSLayoutAttributeTop
                            relatedBy:NSLayoutRelationEqual
                            toItem:title
                            attribute:NSLayoutAttributeBottom
                            multiplier:1.0
                            constant:10.0
                            ]];

    [constraints addObject:[NSLayoutConstraint
                            constraintWithItem:account
                            attribute:NSLayoutAttributeCenterX
                            relatedBy:NSLayoutRelationEqual
                            toItem:title
                            attribute:NSLayoutAttributeCenterX
                            multiplier:1.0 constant:0.0]];

    loginButton1.translatesAutoresizingMaskIntoConstraints = false;
    [self.view addSubview:loginButton1];
    [constraints addObject:[NSLayoutConstraint constraintWithItem:loginButton1 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];

    [constraints addObject:[NSLayoutConstraint constraintWithItem:loginButton1 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0]];

    
    GIDSignInButton *googleSingBtn = [GIDSignInButton new];
    
    googleSingBtn.translatesAutoresizingMaskIntoConstraints = false;
    [self.view addSubview:googleSingBtn];
    [constraints addObject:[NSLayoutConstraint constraintWithItem:googleSingBtn attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:loginButton1 attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
//    [self.view addConstraint:constraint];
    [constraints addObject:[NSLayoutConstraint constraintWithItem:googleSingBtn attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:loginButton1 attribute:NSLayoutAttributeTop multiplier:1.0 constant:-5.0]];
//    [self.view addConstraint:constraint];
    [constraints addObject:[NSLayoutConstraint constraintWithItem:googleSingBtn attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:loginButton1 attribute:NSLayoutAttributeWidth multiplier:1.035 constant:0.0]];
    UIButton *fieleDispatchLoginBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [fieleDispatchLoginBtn addTarget:self action:@selector(gotoFDLogin) forControlEvents:UIControlEventTouchUpInside];
    [fieleDispatchLoginBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    fieleDispatchLoginBtn.backgroundColor = [UIColor brownColor];
    fieleDispatchLoginBtn.translatesAutoresizingMaskIntoConstraints = false;
    fieleDispatchLoginBtn.layer.cornerRadius = 3.0;
    fieleDispatchLoginBtn.layer.borderWidth = 1.0;
    [fieleDispatchLoginBtn setTitle:@"Field Dispatch Login" forState:UIControlStateNormal];
    [self.view addSubview:fieleDispatchLoginBtn];
    [constraints addObject:[NSLayoutConstraint constraintWithItem:fieleDispatchLoginBtn attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationLessThanOrEqual toItem:loginButton1 attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    [constraints addObject:[NSLayoutConstraint constraintWithItem:fieleDispatchLoginBtn attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:loginButton1 attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0.0]];
    [constraints addObject:[NSLayoutConstraint constraintWithItem:fieleDispatchLoginBtn attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:loginButton1 attribute:NSLayoutAttributeBottom multiplier:1.0 constant:5]];
    
    [constraints addObject:[NSLayoutConstraint constraintWithItem:loginButton1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:fieleDispatchLoginBtn attribute:NSLayoutAttributeHeight multiplier:1.1 constant:0.0]];
    
    [self.view addConstraints:constraints];
    
    
    //////////
    
}



-(void)singinView{
    //登入準備登出畫面
    loginButton1.center = self.view.center;
    [self.view addSubview:loginButton1];
}

-(void)prepare{
    [GIDSignIn sharedInstance].uiDelegate = self;
    [GIDSignIn sharedInstance].delegate = self;
    loginButton1 = [FBSDKLoginButton new];
    loginButton1.delegate = self;
    // 選擇性：將按鈕置於檢視中央。測試
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
    // Safe to send to the server
    NSString *idToken = user.authentication.idToken;
    NSString *fullName = user.profile.name;
    NSString *givenName = user.profile.givenName;
    NSString *familyName = user.profile.familyName;
    NSString *email = user.profile.email;
    NSLog(@"\n我是id%@\n我是偷捆%@\n我是全名%@\n我是givenName%@\n我是性%@\n我是信箱%@",userId,idToken,fullName,givenName,familyName,email);
    // ...
    NSLog(@"\n回來確認登入");
    NSString *login = @"Google";
    [[NSUserDefaults standardUserDefaults] setObject: login forKey:@"login"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self dismissViewControllerAnimated:true completion:nil];
}

- (IBAction)didTapSignOut:(id)sender {
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
    NSLog(@"\n回來確認登入");
    NSString *login = @"Facebook";
    [[NSUserDefaults standardUserDefaults] setObject: login forKey:@"login"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    // 用戶已登入，執行如前往下一個檢視控制器的操作。
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
    }];
    [self dismissViewControllerAnimated:true completion:nil];
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
