//
//  UserInfoViewController.h
//  xjkd
//
//  Created by 聂宗波 on 15-1-11.
//  Copyright (c) 2015年 聂宗波. All rights reserved.
//

#import "BaseViewController.h"

@interface UserInfoViewController : BaseViewController
@property (nonatomic, strong) IBOutlet UIButton* btnModifyInfo;
@property (nonatomic, strong) IBOutlet UIButton* btnModifyPwd;
@property (nonatomic, strong) IBOutlet UIButton* btnLoginOut;
@property (nonatomic, strong) IBOutlet UILabel* tfName;
@property (nonatomic, strong) IBOutlet UILabel* tfPhone;
@property (nonatomic, strong) IBOutlet UIImageView* ivLogo;
@end
