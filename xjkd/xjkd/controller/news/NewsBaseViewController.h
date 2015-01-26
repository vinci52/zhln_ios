//
//  NewsBaseViewController.h
//  xjkd
//
//  Created by 聂宗波 on 15-1-13.
//  Copyright (c) 2015年 聂宗波. All rights reserved.
//

#import "BaseViewController.h"

@interface NewsBaseViewController : BaseViewController

-(void)goToDetail:(NewsInfoModel*)news newsType:(NewsTypeModel*)newsType;
@end
