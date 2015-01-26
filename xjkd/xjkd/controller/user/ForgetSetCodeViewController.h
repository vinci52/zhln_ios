//
//  ForgetSetCodeViewController.h
//  xjkd
//
//  Created by 聂宗波 on 15-1-19.
//  Copyright (c) 2015年 聂宗波. All rights reserved.
//

#import "BaseViewController.h"

@interface ForgetSetCodeViewController : BaseViewController<HttpCallBackDelegate>
@property (nonatomic, strong) IBOutlet UIButton* btnSure;
@property (nonatomic, strong) IBOutlet UITextField* tfCode;
@property (nonatomic, strong) IBOutlet UIButton* btnResendSure;
@property (nonatomic, retain) NSString *phone;

@end
