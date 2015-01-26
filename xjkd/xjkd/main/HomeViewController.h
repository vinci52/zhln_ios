//
//  HomeViewController.h
//  SlideMenu
//
//  Created by Aryan Gh on 4/24/13.
//  Copyright (c) 2013 Aryan Ghassemi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SlideNavigationController.h"
#import "BaseViewController.h"
#import "HttpApi.h"
#import "UIButton+WebCache.h"
#import "UIImageView+WebCache.h"
#import "NewsInfoModel.h"
#import "NewsService.h"
#import "WebViewController.h"
#import "NewsBaseViewController.h"
@interface HomeViewController : NewsBaseViewController <SlideNavigationControllerDelegate,HttpCallBackDelegate,UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) IBOutlet UITableView *tableView;

@end
