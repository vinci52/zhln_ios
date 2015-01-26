//
//  MJTableViewController.h
//  快速集成下拉刷新
//
//  Created by mj on 14-1-3.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com

#import <UIKit/UIKit.h>
#import "SGFocusImageFrame.h"
#import "SGFocusImageItem.h"
#import "NewsInfoModel.h"
#import "NewsTypeModel.h"
#import "HttpApi.h"

@interface MJTableViewController : UITableViewController<SGFocusImageFrameDelegate>
@property (nonatomic, retain) NewsTypeModel *newsType;
@end