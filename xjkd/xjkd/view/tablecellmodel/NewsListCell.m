//
//  NewsListCell.m
//  xjkd
//
//  Created by 聂宗波 on 15-1-23.
//  Copyright (c) 2015年 聂宗波. All rights reserved.
//

#import "NewsListCell.h"

@implementation NewsListCell
@synthesize labelTitle;
@synthesize labelType;
@synthesize imgLogo;
@synthesize imgType;
@synthesize imgVideo;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
