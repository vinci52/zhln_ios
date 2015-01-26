//
//  ForgetSetPwdViewController.h
//  xjkd
//
//  Created by 聂宗波 on 15-1-19.
//  Copyright (c) 2015年 聂宗波. All rights reserved.
//

#import "BaseViewController.h"
#import "UserInfoModel.h"

@interface ForgetSetPwdViewController : BaseViewController<HttpCallBackDelegate>
@property (nonatomic, strong) IBOutlet UIButton* btnSure;
@property (nonatomic, strong) IBOutlet UITextField* tfPwd1;
@property (nonatomic, strong) IBOutlet UITextField* tfpwd2;
@property (nonatomic, retain) NSString *smsCode;
@property (nonatomic, retain) NSString *phone;
@end
