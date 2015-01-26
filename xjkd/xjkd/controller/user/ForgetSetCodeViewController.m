//
//  ForgetSetCodeViewController.m
//  xjkd
//
//  Created by 聂宗波 on 15-1-19.
//  Copyright (c) 2015年 聂宗波. All rights reserved.
//

#import "ForgetSetCodeViewController.h"
#import "ForgetSetPwdViewController.h"

@interface ForgetSetCodeViewController ()

@end

@implementation ForgetSetCodeViewController{
    HttpApi *api;
}
@synthesize btnSure;
@synthesize btnResendSure;
@synthesize tfCode;
@synthesize phone;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    api = [HttpApi new];
    [self initNavBar:@"找回密码"];
    
    [btnSure addTarget:self action:@selector(sureOnclick) forControlEvents:UIControlEventTouchUpInside];
    api.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)resendOnclick{
    [self showProccess];
    [api loginSmsCode:phone smstype:@"1"];
}
-(void)sureOnclick{
    NSString* code = tfCode.text;
    if([CommonUtil stringIsNull:code]){
        [self.view makeToast:@"请输入验证码"];
        return;
    }
    //[self showProccess];
    //[api loginSmsCode:code smstype:@"1"];
    ForgetSetPwdViewController *vc;
    UIStoryboard *cgrvcStory = [UIStoryboard storyboardWithName:@"UserStoryboard"
                                                         bundle: nil];
    vc = [cgrvcStory instantiateViewControllerWithIdentifier: @"ForgetSetPwdViewController"];
    vc.smsCode = tfCode.text;
    vc.phone = phone;
    [self.navigationController pushViewController:vc animated:YES];

}

- (void)httpCallback:(RspResultModel*)rsp requestCode:(NSString*)code{
    DLog(@"callback");
    [self closeProccess];
    if([self isRspOk:rsp]){
        [self.view makeToast:@"发送成功"];
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
