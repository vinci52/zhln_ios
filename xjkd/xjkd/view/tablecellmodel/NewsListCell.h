//
//  NewsListCell.h
//  xjkd
//
//  Created by 聂宗波 on 15-1-23.
//  Copyright (c) 2015年 聂宗波. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsListCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UIImageView *imgLogo;
@property (nonatomic, weak) IBOutlet UIImageView *imgType;
@property (nonatomic, weak) IBOutlet UIImageView *imgVideo;
@property (nonatomic, weak) IBOutlet UILabel *labelTitle;
@property (nonatomic, weak) IBOutlet UILabel *labelType;
@end
