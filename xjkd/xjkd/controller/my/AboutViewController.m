//
//  AboutViewController.m
//  xjkd
//
//  Created by 聂宗波 on 15-1-13.
//  Copyright (c) 2015年 聂宗波. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController
@synthesize labelAddress;
@synthesize labelFax;
@synthesize labelOrg;
@synthesize labelPhone;
@synthesize labelSuborg;
@synthesize labelWeb;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initNavBar:@"关于我们"];
    self.labelWeb.text = string_about_web;
    self.labelAddress.text = string_about_address;
    self.labelFax.text = string_about_fax;
    self.labelOrg.text = string_about_org;
    self.labelSuborg.text = string_about_suborg;
    self.labelPhone.text = string_about_phone;
    [self.labelPhone setTextColor:[UIConfig getColor:title_text_color]];
    [self.labelWeb setTextColor:[UIConfig getColor:title_text_color]];
    [self.labelAddress setTextColor:[UIConfig getColor:title_text_color]];
    [self.labelFax setTextColor:[UIConfig getColor:title_text_color]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
