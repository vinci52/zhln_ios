//
//  LoginViewController.h
//  xjkd
//
//  Created by 聂宗波 on 15-1-11.
//  Copyright (c) 2015年 聂宗波. All rights reserved.
//
@protocol LoginViewControllerDelegate

@required
- (void)loginDone;

@end
#import "BaseViewController.h"

@interface LoginViewController : BaseViewController<HttpCallBackDelegate>
@property (nonatomic, strong) IBOutlet UIButton* btnLogin;
@property (nonatomic, strong) IBOutlet UIButton* btnFoget;
@property (nonatomic, strong) IBOutlet UITextField* tfName;
@property (nonatomic, strong) IBOutlet UITextField* tfPwd;
@property (nonatomic, strong) IBOutlet UIImageView* ivGroup;
@property (nonatomic, assign) id<LoginViewControllerDelegate> delegate;
@end
