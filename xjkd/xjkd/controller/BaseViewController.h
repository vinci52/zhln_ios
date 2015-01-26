//
//  BaseViewController.h
//  xjkd
//
//  Created by 聂宗波 on 15-1-8.
//  Copyright (c) 2015年 聂宗波. All rights reserved.
//

#define ISINDEBUG //如果要发布就注释此行代码，关闭打印
#ifdef ISINDEBUG
//# define DLog(fmt, ...) NSLog((@"[%s];" "[%s];" "[line:%d]:" fmt), __FILE__, __FUNCTION__, __LINE__, ##__VA_ARGS__);
#define DLog(fmt, ...) NSLog((@"[line:%d]:" fmt), __LINE__, ##__VA_ARGS__);
#else
# define DLog(...);
#endif

#import <UIKit/UIKit.h>
#import "CoreConstants.h"
#import "CommonUtil.h"
#import "DataCache.h"
#import "UIConfig.h"
#import "HttpApi.h"
#import "Toast+UIView.h"
#import "MyApp.h"
#import "UIImageView+WebCache.h"
#import "XinHuaAnalytics.h"
#import "XHConstants.h"
#import "XHSDKUtil.h"

@interface BaseViewController : UIViewController
-(void)showEmptyListView;
-(void)closeEmptyListView;
-(void)backVC;
-(void)initNavBar:(NSString*)title;

-(void)showProccess;
-(void)closeProccess;
-(BOOL)isRspOk:(RspResultModel*)rsp;
-(void)setItemSelector:(UIButton*)btn bgColor:(UIColor*)bgColor;

@end
