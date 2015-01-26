//
//  ContentViewController.h
//  ICViewPager
//
//  Created by Ilter Cengiz on 28/08/2013.
//  Copyright (c) 2013 Ilter Cengiz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MediaPlayer/MPMoviePlayerController.h"
#import "ALMoviePlayerController.h"
#import "UIConfig.h"

@interface ContentViewController : UIViewController<ALMoviePlayerControllerDelegate>
@property (nonatomic, strong) ALMoviePlayerController *moviePlayer;
@property (nonatomic) CGRect defaultFrame;

@end
