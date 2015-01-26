//
//  WebWithBottomViewController.h
//  xjkd
//
//  Created by 聂宗波 on 15-1-11.
//  Copyright (c) 2015年 聂宗波. All rights reserved.
//

#import "BaseViewController.h"
#import "SlideNavigationController.h"
@interface WebWithBottomViewController : BaseViewController<SlideNavigationControllerDelegate,UIWebViewDelegate>
@property (nonatomic, strong) IBOutlet UIWebView* webViews;
@property (nonatomic, retain) NSString *webUrl;
@property (nonatomic, retain) NSString *webType;
@property (nonatomic, retain) NSString *title;
@end
