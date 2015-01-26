//
//  MySetViewController.h
//  xjkd
//
//  Created by 聂宗波 on 15-1-12.
//  Copyright (c) 2015年 聂宗波. All rights reserved.
//

#import "BaseViewController.h"
#import "KeyValueObj.h"
#import "FeedBackViewController.h"
#import "AboutViewController.h"

@interface MySetViewController : BaseViewController<HttpCallBackDelegate,UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) IBOutlet UITableView *tableView;
@end
