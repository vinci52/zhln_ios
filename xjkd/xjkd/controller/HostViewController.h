//
//  HostViewController.h
//  ICViewPager
//
//  Created by Ilter Cengiz on 28/08/2013.
//  Copyright (c) 2013 Ilter Cengiz. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "ViewPagerController.h"
#import "SlideNavigationController.h"
#import "NewsTypeModel.h"
#import "UIConfig.h"
#import "NewsTabViewController.h"

@interface HostViewController : ViewPagerController<SlideNavigationControllerDelegate>
@property (nonatomic, retain) NewsTypeModel *newsType;
@end
