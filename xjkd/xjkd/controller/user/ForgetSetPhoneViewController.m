//
//  ForgetSetPhoneViewController.m
//  xjkd
//
//  Created by 聂宗波 on 15-1-19.
//  Copyright (c) 2015年 聂宗波. All rights reserved.
//

#import "ForgetSetPhoneViewController.h"
#import "ForgetSetCodeViewController.h"

@interface ForgetSetPhoneViewController ()

@end

@implementation ForgetSetPhoneViewController{
    HttpApi *api;
}
@synthesize btnSure;
@synthesize tfPhone;
@synthesize ivGroup;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    api = [HttpApi new];
    [self initNavBar:@"忘记密码?"];
    ivGroup.layer.borderWidth =1.0;
    ivGroup.layer.cornerRadius =5.0;
    [ivGroup.layer setBorderColor:[[UIColor lightGrayColor]CGColor]];
    
    [btnSure addTarget:self action:@selector(sureOnclick) forControlEvents:UIControlEventTouchUpInside];
    api.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)sureOnclick{
    NSString* phone = tfPhone.text;
    if([CommonUtil stringIsNull:phone]){
        [self.view makeToast:@"请输入手机号码"];
        return;
    }
    [self showProccess];
    [api loginSmsCode:phone smstype:@"1"];
}

- (void)httpCallback:(RspResultModel*)rsp requestCode:(NSString*)code{
    DLog(@"callback");
    [self closeProccess];
    if([self isRspOk:rsp]){
        ForgetSetCodeViewController *vc;
        UIStoryboard *cgrvcStory = [UIStoryboard storyboardWithName:@"UserStoryboard"
                                                             bundle: nil];
        vc = [cgrvcStory instantiateViewControllerWithIdentifier: @"ForgetSetCodeViewController"];
        vc.phone = tfPhone.text;
        
        [self.navigationController pushViewController:vc animated:YES];
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
