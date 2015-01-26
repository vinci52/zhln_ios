//
//  VideoViewController.h
//  xjkd
//
//  Created by 聂宗波 on 15-1-13.
//  Copyright (c) 2015年 聂宗波. All rights reserved.
//

#import "BaseViewController.h"
#import "MediaPlayer/MPMoviePlayerController.h"
#import "ALMoviePlayerController.h"
#import "UIConfig.h"
//用窗口模式进入
@interface VideoViewController : BaseViewController<ALMoviePlayerControllerDelegate>
@property (nonatomic, strong) ALMoviePlayerController *moviePlayer;
@property (nonatomic) CGRect defaultFrame;
@property (nonatomic, retain) NSURL* videoUrl;


@end
