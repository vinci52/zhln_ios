//
//  HomeViewController.m
//  SlideMenu
//
//  Created by Aryan Gh on 4/24/13.
//  Copyright (c) 2013 Aryan Ghassemi. All rights reserved.
//

#import "HomeViewController.h"
#import "LeftMenuViewController.h"
#import "CoreConstants.h"
#import "MenuModel.h"
#import "AppInfoModel.h"
#import "DialogUtil.h"
#import "MJRefresh.h"
#import "LoginViewController.h"

@implementation HomeViewController{
    NSMutableArray *list;
    HttpApi* api;
}
@synthesize tableView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    //list = rsp.home_page_list;
    // 刷新表格
    //[HttpApi getInstance].delegate = self;
    api = [HttpApi new];
    api.delegate = self;
    RspResultModel* cacheData = [NewsService getCacheNewsList:KEY_HOME];
    if(cacheData!=nil&&cacheData.home_page_list!=nil){
        list = cacheData.home_page_list;
    }
    if(list==nil||list.count==0){
        [self showEmptyListView];
    }
    [self.tableView reloadData];
    
    [self.tableView addHeaderWithTarget:self action:@selector(headerRereshing)];
#warning 自动刷新(一进入程序就下拉刷新)
    if([[MyApp getInstance] isNeedLoad:[NSString stringWithFormat:@"%@_%@",KEY_NEWS,@"home"]]){
        [self.tableView headerBeginRefreshing];
    }
    
    
    // 2.上拉加载更多(进入刷新状态就会调用self的footerRereshing)
    //[self.tableView addFooterWithTarget:self action:@selector(footerRereshing)];
    
    

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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(list==nil){
        return 0;
    }
    return list.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *spid = @"tablecell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:spid];
    if(cell==nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:spid];
    }
    cell.tag = indexPath.row;
    UIButton* bt1 = (UIButton *)[cell viewWithTag:31];
    UIButton* bt2 = (UIButton *)[cell viewWithTag:11];
    UIButton* bt3 = (UIButton *)[cell viewWithTag:21];
    
    UILabel* label1 = (UILabel*)[cell viewWithTag:32];
    UILabel* label2 = (UILabel*)[cell viewWithTag:12];
    UILabel* label3 = (UILabel*)[cell viewWithTag:22];
    
    UIImageView* img2 = (UIImageView*)[cell viewWithTag:13];
    UIImageView* img3 = (UIImageView*)[cell viewWithTag:23];
    /**
    CGSize imageSize = CGSizeMake(bt1.frame.size.width, bt1.frame.size.height);
    UIGraphicsBeginImageContextWithOptions(imageSize, 0, [UIScreen mainScreen].scale);
    
    [[UIColor colorWithRed:0 green:0 blue:0 alpha:0.4] set];
    UIRectFill(CGRectMake(0, 0, imageSize.width, imageSize.height));
    UIImage *pressedColorImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [bt2 setImage:pressedColorImg forState:UIControlStateNormal];
     **/
    //[bt2 setBackgroundImage:pressedColorImg forState:UIControlStateSelected];
    //bt1.showsTouchWhenHighlighted = YES;
    //bt2.showsTouchWhenHighlighted = YES;
    //bt3.showsTouchWhenHighlighted = YES;
    
    NSArray* newGroup = [list objectAtIndex:indexPath.row];
    if(newGroup&&newGroup.count>0){
        for(int i=0;i<newGroup.count;i++){
            NSDictionary *newsDic = [newGroup objectAtIndex:i];
            NewsInfoModel *news = [[NewsInfoModel alloc] initWithDictionary:newsDic];
            if(i==0){
                [bt1 sd_setBackgroundImageWithURL:[NSURL URLWithString:news.img]
                                         forState:UIControlStateNormal];
                label1.text = news.title;
                [bt1 addTarget:self action:@selector(newsOnclick1:) forControlEvents:UIControlEventTouchUpInside];
                
            }
            else if(i==1){
                label2.text = news.title;
                [img2 sd_setImageWithURL:[NSURL URLWithString:news.img]];
                [bt2 addTarget:self action:@selector(newsOnclick2:) forControlEvents:UIControlEventTouchUpInside];
            }
            else if(i==2){
                label3.text = news.title;
                [img3 sd_setImageWithURL:[NSURL URLWithString:news.img]];
                [bt3 addTarget:self action:@selector(newsOnclick3:) forControlEvents:UIControlEventTouchUpInside];
            }
        }
    }
    
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
}

-(void)newsOnclick1:(id)sender
{
    UIButton * but=(UIButton *)sender;
    NSInteger groupIndex = (NSInteger)but.superview.superview.tag;
    NewsInfoModel *news = [self getNews:groupIndex index:0];
    [self goToDetail:news];
    
    
}

-(void)newsOnclick2:(id)sender
{
    UIButton * but=(UIButton *)sender;
    NSInteger groupIndex = (NSInteger)but.superview.superview.tag;
    NewsInfoModel *news = [self getNews:groupIndex index:1];
    [self goToDetail:news];
    
}
-(void)newsOnclick3:(id)sender
{
    UIButton * but=(UIButton *)sender;
    NSInteger groupIndex = (NSInteger)but.superview.superview.tag;
    NewsInfoModel *news = [self getNews:groupIndex index:2];
    [self goToDetail:news];
    
}

-(void)goToDetail:(NewsInfoModel*)news{
    NSLog(@"go to %@",news.title);
    [self goToDetail:news newsType:nil];
    /**
    WebViewController *vc = [[WebViewController alloc] init];
    UIStoryboard *cgrvcStory = [UIStoryboard storyboardWithName:@"WebViewStoryboard"
                                                             bundle: nil];
    vc = [cgrvcStory instantiateViewControllerWithIdentifier: @"WebViewController"];
    vc.newsInfo = news;
    
    [self.navigationController pushViewController:vc animated:YES];
  **/
}

-(NewsInfoModel*)getNews:(int)groupIndex index:(int)index{
    NSArray* newGroup = [list objectAtIndex:groupIndex];
    NSDictionary *newsDic = [newGroup objectAtIndex:index];
    NewsInfoModel *news = [[NewsInfoModel alloc] initWithDictionary:newsDic];
    return news;
}

#pragma mark 开始进入刷新状态
- (void)headerRereshing
{
    [api homePage:@"1"];
    // 2.2秒后刷新表格UI
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
       //[self.tableView headerEndRefreshing];
    });
}

- (void)footerRereshing
{
    
    // 2.2秒后刷新表格UI
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        [self.tableView reloadData];
        
        // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
        [self.tableView footerEndRefreshing];
    });
}

#pragma
- (void)httpCallback:(RspResultModel*)rsp requestCode:(NSString*)code{
    DLog(@"callback");
    [self.tableView headerEndRefreshing];
    if([@"0" isEqualToString:rsp.retcode]){
        [[MyApp getInstance] setLastLoadTime:[NSString stringWithFormat:@"%@_%@",KEY_NEWS,@"home"]];
        list = rsp.home_page_list;
        // 刷新表格
        [self.tableView reloadData];
        
        // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
        
        if(list.count>0){
            [self closeEmptyListView];
        }else{
            [self showEmptyListView];
        }
        [NewsService setCacheNewsList:KEY_HOME data:rsp];
    }
  
}

@end
