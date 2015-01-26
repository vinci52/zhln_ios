//
//  SubNewsTabViewController.h
//  xjkd
//
//  Created by 聂宗波 on 15-1-12.
//  Copyright (c) 2015年 聂宗波. All rights reserved.
//

#import "BaseViewController.h"
#import "NewsInfoModel.h"
#import "NewsService.h"
#import "WebViewController.h"
#import "MJRefresh.h"
#import "NewsTypeModel.h"
#import "UIButton+WebCache.h"
#import "UIImageView+WebCache.h"
#import "NewsBaseViewController.h"
@interface SubNewsTabViewController : NewsBaseViewController<HttpCallBackDelegate,UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, retain) NewsTypeModel *newsType;
@property (nonatomic, retain) NewsInfoModel *newsInfo;
@end
