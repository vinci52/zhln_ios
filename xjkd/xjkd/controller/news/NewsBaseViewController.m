//
//  NewsBaseViewController.m
//  xjkd
//
//  Created by 聂宗波 on 15-1-13.
//  Copyright (c) 2015年 聂宗波. All rights reserved.
//

#import "NewsBaseViewController.h"
#import "SubNewsViewController.h"
#import "VideoNewsViewController.h"

@interface NewsBaseViewController ()

@end

@implementation NewsBaseViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)goToDetail:(NewsInfoModel*)news newsType:(NewsTypeModel*)newsType{
    if(newsType&&[NEWS_SUBTYPE_VIDEO isEqualToString:newsType.type]){
        VideoNewsViewController* vc;
        
        UIStoryboard *cgrvcStory = [UIStoryboard storyboardWithName:@"NewsStoryboard"
                                                             bundle: nil];
        vc = [cgrvcStory instantiateViewControllerWithIdentifier: @"VideoNewsViewController"];
        vc.newsType = newsType;
        vc.newsInfo = news;
        [self.navigationController pushViewController:vc animated:NO];
    }
    else{
        WebViewController *vc = [[WebViewController alloc] init];
        UIStoryboard *cgrvcStory = [UIStoryboard storyboardWithName:@"WebViewStoryboard"
                                                             bundle: nil];
        vc = [cgrvcStory instantiateViewControllerWithIdentifier: @"WebViewController"];
        vc.newsInfo = news;
        vc.newsType = newsType;
        [self.navigationController pushViewController:vc animated:NO];
    }
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
