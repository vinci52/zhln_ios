//
//  WebWithBottomViewController.m
//  xjkd
//
//  Created by 聂宗波 on 15-1-11.
//  Copyright (c) 2015年 聂宗波. All rights reserved.
//

#import "WebWithBottomViewController.h"

@interface WebWithBottomViewController ()

@end

@implementation WebWithBottomViewController
@synthesize webType;
@synthesize webUrl;
@synthesize webViews;
@synthesize title;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.webViews.delegate = self;
    self.navigationItem.title = title;
    [webViews loadRequest:[[NSURLRequest alloc]initWithURL:[NSURL URLWithString:webUrl]]];
    [[NSNotificationCenter defaultCenter] addObserverForName:@"menuleftweb" object:nil queue:nil usingBlock:^(NSNotification *note) {
        title = note.userInfo[@"title"];
        webUrl = note.userInfo[@"url"];
        NSLog(@"Opened %@", webUrl);
        self.navigationItem.title = title;
        [webViews loadRequest:[[NSURLRequest alloc]initWithURL:[NSURL URLWithString:webUrl]]];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - SlideNavigationController Methods -
- (BOOL)slideNavigationControllerShouldDisplayLeftMenu
{
    return YES;
}

- (BOOL)slideNavigationControllerShouldDisplayRightMenu
{
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    NSLog(@"开始加载页面");
    [self showProccess];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [self closeProccess];
    //[self.webView stringByEvaluatingJavaScriptFromString:@"fn();"];
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
