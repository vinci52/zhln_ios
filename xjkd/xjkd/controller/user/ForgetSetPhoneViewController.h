//
//  ForgetSetPhoneViewController.h
//  xjkd
//
//  Created by 聂宗波 on 15-1-19.
//  Copyright (c) 2015年 聂宗波. All rights reserved.
//

#import "BaseViewController.h"

@interface ForgetSetPhoneViewController : BaseViewController<HttpCallBackDelegate>
@property (nonatomic, strong) IBOutlet UIButton* btnSure;
@property (nonatomic, strong) IBOutlet UITextField* tfPhone;
@property (nonatomic, strong) IBOutlet UIImageView* ivGroup;
@end
