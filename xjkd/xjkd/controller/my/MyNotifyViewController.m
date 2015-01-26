//
//  MyNotifyViewController.m
//  xjkd
//
//  Created by 聂宗波 on 15-1-12.
//  Copyright (c) 2015年 聂宗波. All rights reserved.
//

#import "MyNotifyViewController.h"
#import "MJRefresh.h"
@interface MyNotifyViewController ()

@end

@implementation MyNotifyViewController
@synthesize tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initNavBar:@"通知"];
    [self showEmptyListView];
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
