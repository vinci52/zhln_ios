//
//  WeatherViewController.h
//  xjkd
//
//  Created by 聂宗波 on 15-1-14.
//  Copyright (c) 2015年 聂宗波. All rights reserved.
//

#import "BaseViewController.h"
#import "SWIndexModel.h"

@interface WeatherViewController : BaseViewController<HttpCallBackDelegate>
@property (nonatomic, strong) IBOutlet UILabel *labelTemp;
@property (nonatomic, strong) IBOutlet UILabel *labelName;
@property (nonatomic, strong) IBOutlet UILabel *labelDate;
@property (nonatomic, strong) IBOutlet UIImageView *img;
@property (nonatomic, strong) IBOutlet UILabel *labelIndex;

@property (nonatomic, strong) IBOutlet UILabel *labelTemp1;
@property (nonatomic, strong) IBOutlet UILabel *labelName1;
@property (nonatomic, strong) IBOutlet UIImageView *img1;

@property (nonatomic, strong) IBOutlet UILabel *labelTemp2;
@property (nonatomic, strong) IBOutlet UILabel *labelName2;
@property (nonatomic, strong) IBOutlet UIImageView *img2;

@property (nonatomic, strong) IBOutlet UILabel *labelTemp3;
@property (nonatomic, strong) IBOutlet UILabel *labelName3;
@property (nonatomic, strong) IBOutlet UIImageView *img3;

@property (nonatomic, strong) IBOutlet UILabel *labelPub;
@property (nonatomic, strong) IBOutlet UIButton *btnBack;
@end
