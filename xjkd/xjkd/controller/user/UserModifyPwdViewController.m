//
//  UserModifyPwdViewController.m
//  xjkd
//
//  Created by 聂宗波 on 15-1-12.
//  Copyright (c) 2015年 聂宗波. All rights reserved.
//

#import "UserModifyPwdViewController.h"

@interface UserModifyPwdViewController ()

@end

@implementation UserModifyPwdViewController
{
    UserInfoModel *user;
    HttpApi* api;
}

@synthesize tfPwd;
@synthesize tfPwd1;
@synthesize tfPwd2;
@synthesize btnModify;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [tfPwd setSecureTextEntry:YES];
    [tfPwd2 setSecureTextEntry:YES];
    [tfPwd1 setSecureTextEntry:YES];
    [self.btnModify addTarget:self action:@selector(doModifyUser) forControlEvents:UIControlEventTouchUpInside];
    user = [[MyApp getInstance]getUserInfo];
    api = [HttpApi new];
    api.delegate = self;
    
    [self initNavBar:@"修改密码"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)doModifyUser{
    NSString* pwd = tfPwd.text;
    NSString* pwd1 = tfPwd1.text;
    NSString* pwd2 = tfPwd2.text;
    if([CommonUtil stringIsNull:pwd]){
        [self.view makeToast:@"请输入昵称"];
        return;
    }
    if([CommonUtil stringIsNull:pwd1]){
        [self.view makeToast:@"请输入邮箱"];
        return;
    }
    if([CommonUtil stringIsNull:pwd2]){
        [self.view makeToast:@"请输入邮箱"];
        return;
    }
    
    if(![pwd1 isEqualToString:pwd2]){
        [self.view makeToast:@"新密码和确认密码不一致"];
        return;
    }
    
    [self showProccess];
    [api modify_pwd:user.phone password:pwd newpassword:pwd2];
}

- (void)httpCallback:(RspResultModel*)rsp requestCode:(NSString*)code{
    DLog(@"callback");
    [self closeProccess];
    if([self isRspOk:rsp]){
        [self.view makeToast:@"修改成功"];
        //[self backVC];
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
