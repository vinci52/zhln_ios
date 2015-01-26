//
//  NewsTabViewController.h
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
#import "ContentViewController.h"
#import "NewsBaseViewController.h"

@interface NewsTabViewController : NewsBaseViewController<HttpCallBackDelegate,UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, retain) NewsTypeModel *newsType;
//@property (nonatomic, retain) NewsTypeModel *newsType;

@end
