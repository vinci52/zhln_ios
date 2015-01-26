//
//  NewsCommentViewController.h
//  xjkd
//
//  Created by 聂宗波 on 15-1-17.
//  Copyright (c) 2015年 聂宗波. All rights reserved.
//

#import "NewsBaseViewController.h"
#import "MJRefresh.h"
#import "NewsTypeModel.h"
#import "UIButton+WebCache.h"
#import "UIImageView+WebCache.h"

@interface NewsCommentViewController : NewsBaseViewController<HttpCallBackDelegate,UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, retain) NewsInfoModel *newsInfo;
@property (nonatomic, strong) IBOutlet UITextField* tfComment;
@property (nonatomic, strong) IBOutlet UIButton* btnComment;
@property (nonatomic, strong) IBOutlet UIButton* btnShare;
@property (nonatomic, strong) IBOutlet UIButton* btnFav;
@property (nonatomic, strong) IBOutlet UITextView* tvArround;
@end
