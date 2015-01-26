//
//  VideoViewController.m
//  xjkd
//
//  Created by 聂宗波 on 15-1-13.
//  Copyright (c) 2015年 聂宗波. All rights reserved.
//

#import "VideoViewController.h"

@interface VideoViewController ()

@end

@implementation VideoViewController
@synthesize moviePlayer;
@synthesize defaultFrame;
@synthesize videoUrl;
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    UIButton *blackBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    blackBtn.frame = CGRectMake(15, 40, 58, 44);
    [blackBtn setBackgroundImage:[UIImage imageNamed:@"pic_back_btn_normal"] forState:UIControlStateNormal];
    [blackBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:blackBtn];
    [self initPlayer];
}

//初始化播放器
-(void)initPlayer{
    self.moviePlayer = [[ALMoviePlayerController alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    self.moviePlayer.view.alpha = 0.f;
    self.moviePlayer.delegate = self;
    
    ALMoviePlayerControls *movieControls = [[ALMoviePlayerControls alloc] initWithMoviePlayer:self.moviePlayer style:ALMoviePlayerControlsStyleDefault];
    [movieControls setBarColor:[UIColor blackColor]];
    [movieControls setTimeRemainingDecrements:YES];
    
    [self.moviePlayer setControls:movieControls];
    [self.view addSubview:self.moviePlayer.view];
    
    [self.moviePlayer setContentURL:videoUrl];
    
    double delayInSeconds = 0.3;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self configureViewForOrientation:[UIApplication sharedApplication].statusBarOrientation];
        [UIView animateWithDuration:0.3 delay:0.0 options:0 animations:^{
            self.moviePlayer.view.alpha = 1.f;
            
        } completion:^(BOOL finished) {
            
        }];
    });
}

-(void)back{
    [self dismissModalViewControllerAnimated:YES];
}
- (void)playClick:(UIButton *)btn
{
    [self.moviePlayer stop];
    [self.moviePlayer setContentURL:videoUrl];
    [self.moviePlayer play];
}

- (void)configureViewForOrientation:(UIInterfaceOrientation)orientation {
    CGFloat videoWidth = 0;
    CGFloat videoHeight = 0;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        videoWidth = 700.f;
        videoHeight = 535.f;
    } else {
        videoWidth = self.view.frame.size.width;
        videoHeight = 220.f;
    }
    
    self.defaultFrame = CGRectMake(self.view.frame.size.width/2 - videoWidth/2, self.view.frame.size.height/2 - videoHeight/2, videoWidth, videoHeight);
    if (self.moviePlayer.isFullscreen)
    return;
    [self.moviePlayer setFrame:self.defaultFrame];
}

- (void)moviePlayerWillMoveFromWindow {
    if (![self.view.subviews containsObject:self.moviePlayer.view])
    [self.view addSubview:self.moviePlayer.view];
    
    [self.moviePlayer setFrame:self.defaultFrame];
}

- (void)movieTimedOut {
    [self.view makeToast:@"播放视频失败"];
}

- (BOOL)shouldAutorotate {
    return YES;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return YES;
}
#pragma
-(void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    [super willAnimateRotationToInterfaceOrientation:toInterfaceOrientation duration:duration];
    [self configureViewForOrientation:toInterfaceOrientation];
}


@end
