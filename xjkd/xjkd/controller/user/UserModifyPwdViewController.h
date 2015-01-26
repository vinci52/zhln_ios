//
//  UserModifyPwdViewController.h
//  xjkd
//
//  Created by 聂宗波 on 15-1-12.
//  Copyright (c) 2015年 聂宗波. All rights reserved.
//

#import "BaseViewController.h"

@interface UserModifyPwdViewController : BaseViewController<HttpCallBackDelegate>
@property (nonatomic, strong) IBOutlet UITextField* tfPwd;
@property (nonatomic, strong) IBOutlet UITextField* tfPwd1;
@property (nonatomic, strong) IBOutlet UITextField* tfPwd2;
@property (nonatomic, strong) IBOutlet UIButton* btnModify;
@end
