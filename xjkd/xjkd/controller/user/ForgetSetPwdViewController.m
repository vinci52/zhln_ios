//
//  ForgetSetPwdViewController.m
//  xjkd
//
//  Created by 聂宗波 on 15-1-19.
//  Copyright (c) 2015年 聂宗波. All rights reserved.
//

#import "ForgetSetPwdViewController.h"

@interface ForgetSetPwdViewController ()

@end

@implementation ForgetSetPwdViewController{
    HttpApi *api;
}
@synthesize tfPwd1;
@synthesize tfpwd2;
@synthesize btnSure;
@synthesize smsCode;
@synthesize phone;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    api = [HttpApi new];
    [self initNavBar:@"找回密码"];
    [tfPwd1 setSecureTextEntry:YES];
    [tfpwd2 setSecureTextEntry:YES];
    [btnSure addTarget:self action:@selector(sureOnclick) forControlEvents:UIControlEventTouchUpInside];
    api.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)sureOnclick{
    NSString* pwd1 = tfPwd1.text;
    NSString* pwd2 = tfpwd2.text;
    if([CommonUtil stringIsNull:pwd1]){
        [self.view makeToast:@"请输入新的登录密码"];
        return;
    }
    if([CommonUtil stringIsNull:pwd2]){
        [self.view makeToast:@"请再次输入新的登录密码"];
        return;
    }
    if(![pwd1 isEqualToString:pwd2]){
        [self.view makeToast:@"两次输入密码不一致"];
        return;
    }
    [self showProccess];
    [api findpwd:phone smscode:smsCode password:pwd2];
}

- (void)httpCallback:(RspResultModel*)rsp requestCode:(NSString*)code{
    DLog(@"callback");
    [self closeProccess];
    if([self isRspOk:rsp]){
        [self.view makeToast:@"设置密码成功"];
        [self performSelector:@selector(backToRoot) withObject:nil afterDelay:1.0f];
           }
    else{
        [self.view makeToast:rsp.retmsg];
    }
}

-(void)backToRoot{
    [self.navigationController popToRootViewControllerAnimated:YES];

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
