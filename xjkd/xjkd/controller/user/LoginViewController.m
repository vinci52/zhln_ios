//
//  LoginViewController.m
//  xjkd
//
//  Created by 聂宗波 on 15-1-11.
//  Copyright (c) 2015年 聂宗波. All rights reserved.
//

#import "LoginViewController.h"
#import "HttpApi.h"
#import "ForgetSetPhoneViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController{
    HttpApi *api;
}
@synthesize btnFoget;
@synthesize btnLogin;
@synthesize tfName;
@synthesize tfPwd;
@synthesize ivGroup;
@synthesize delegate;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    api = [HttpApi new];
    [self initNavBar:@"登录"];
    ivGroup.layer.borderWidth =1.0;
    ivGroup.layer.cornerRadius =5.0;
    [ivGroup.layer setBorderColor:[[UIColor lightGrayColor]CGColor]];
    [tfPwd setSecureTextEntry:YES];
    [btnLogin addTarget:self action:@selector(loginOnclick) forControlEvents:UIControlEventTouchUpInside];
    [btnFoget addTarget:self action:@selector(fogetOnclick) forControlEvents:UIControlEventTouchUpInside];
    api.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)fogetOnclick{
    ForgetSetPhoneViewController *vc;
    UIStoryboard *cgrvcStory = [UIStoryboard storyboardWithName:@"UserStoryboard"
                                                         bundle: nil];
    vc = [cgrvcStory instantiateViewControllerWithIdentifier: @"ForgetSetPhoneViewController"];
    
    [self.navigationController pushViewController:vc animated:YES];
}


-(void)loginOnclick{
    NSString* name = tfName.text;
    NSString* pwd = tfPwd.text;
    if([CommonUtil stringIsNull:name]){
        [self.view makeToast:@"请输入账户名或者手机号码"];
        return;
    }
    if([CommonUtil stringIsNull:pwd]){
        [self.view makeToast:@"请输入密码"];
        return;
    }
    [self showProccess];
    [api login:name password:pwd];
}

- (void)httpCallback:(RspResultModel*)rsp requestCode:(NSString*)code{
    DLog(@"callback");
    [self closeProccess];
    if([self isRspOk:rsp]){
        [self.view makeToast:@"登录成功"];
        [[MyApp getInstance] setUserInfo:rsp.user];
        [delegate loginDone];
        [self backVC];
    }
    else{
        [self.view makeToast:rsp.retmsg];
    }
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
