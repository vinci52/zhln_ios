//
//  LeftViewController.h
//  xjkd
//
//  Created by 聂宗波 on 15-1-7.
//  Copyright (c) 2015年 聂宗波. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SlideNavigationController.h"
#import "BaseViewController.h"
#import "NewsService.h"
#import "HostViewController.h"
#import "SubNewsViewController.h"

@interface LeftViewController : BaseViewController<UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong) IBOutlet UICollectionView *tableView;
@property (nonatomic, assign) BOOL slideOutAnimationEnabled;
@end
