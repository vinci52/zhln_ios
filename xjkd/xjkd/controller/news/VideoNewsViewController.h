//
//  VideoNewsViewController.h
//  xjkd
//
//  Created by 聂宗波 on 15-1-13.
//  Copyright (c) 2015年 聂宗波. All rights reserved.
//

#import "NewsBaseViewController.h"
#import "CommentView.h"
#import "VideoViewController.h"

@interface VideoNewsViewController : NewsBaseViewController<HttpCallBackDelegate>
@property (nonatomic, retain) NewsTypeModel *newsType;
@property (nonatomic, retain) NewsInfoModel *newsInfo;
@property (nonatomic, strong) IBOutlet UITextField* tfComment;
@property (nonatomic, strong) IBOutlet UIButton* btnComment;
@property (nonatomic, strong) IBOutlet UIButton* btnShare;
@property (nonatomic, strong) IBOutlet UIButton* btnFav;
@property (nonatomic, strong) IBOutlet UITextView* tvArround;
@property (nonatomic, strong) IBOutlet UILabel* labeTitle;
@property (nonatomic, strong) IBOutlet UILabel* labeTime;
@property (nonatomic, strong) IBOutlet UIButton* btnLogo;
@end
