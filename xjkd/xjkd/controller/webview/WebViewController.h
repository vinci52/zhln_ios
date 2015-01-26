//
//  WebViewController.h
//  xjkd
//
//  Created by 聂宗波 on 15-1-11.
//  Copyright (c) 2015年 聂宗波. All rights reserved.
//

#import "BaseViewController.h"
#import "NewsInfoModel.h"
#import "NewsTypeModel.h"
#import "CommentView.h"
#import "HttpApi.h"
#import "NewsService.h"

@interface WebViewController : BaseViewController<HttpCallBackDelegate,UIWebViewDelegate>
@property (nonatomic, strong) IBOutlet UIWebView* webViews;
@property (nonatomic, strong) IBOutlet UITextField* tfComment;
@property (nonatomic, strong) IBOutlet UIButton* btnComment;
@property (nonatomic, strong) IBOutlet UIButton* btnShare;
@property (nonatomic, strong) IBOutlet UIButton* btnFav;
@property (nonatomic, strong) IBOutlet UITextView* tvArround;
@property (nonatomic, retain) NewsInfoModel *newsInfo;
@property (nonatomic, retain) NewsTypeModel *newsType;
//@property (nonatomic, retain) NewsInfoModel *newsInfo;
@end
