//
//  RightViewController.h
//  xjkd
//
//  Created by 聂宗波 on 15-1-11.
//  Copyright (c) 2015年 聂宗波. All rights reserved.
//

#import "BaseViewController.h"
#import "KeyValueObj.h"
#import "SlideNavigationContorllerAnimator.h"
#import "SlideNavigationContorllerAnimatorFade.h"
#import "SlideNavigationContorllerAnimatorSlide.h"
#import "SlideNavigationContorllerAnimatorScale.h"
#import "SlideNavigationContorllerAnimatorScaleAndFade.h"
#import "SlideNavigationContorllerAnimatorSlideAndFade.h"
#import "LoginViewController.h"
#import "UserInfoViewController.h"
#import "MyNotifyViewController.h"
#import "MySetViewController.h"
#import "WeatherViewController.h"

@interface RightViewController : BaseViewController<HttpCallBackDelegate,LoginViewControllerDelegate,UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) IBOutlet UITableView *tableView;
@end
