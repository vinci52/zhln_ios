//
//  NewsTabViewController.m
//  xjkd
//
//  Created by 聂宗波 on 15-1-12.
//  Copyright (c) 2015年 聂宗波. All rights reserved.
//

#import "NewsTabViewController.h"
#import "NewsListCell.h"

@interface NewsTabViewController ()

@end

@implementation NewsTabViewController{
    NSMutableArray *list;
    HttpApi* api;
}
@synthesize tableView;
@synthesize newsType;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = newsType.name;
    api = [HttpApi new];
    api.delegate = self;
    
    RspResultModel* cacheData = [NewsService getCacheNewsList:[NSString stringWithFormat:@"%@_%@_%@",KEY_NEWS,newsType.parentid,newsType.id]];
    if(cacheData!=nil&&cacheData.article_list!=nil){
        list = cacheData.article_list;
    }
    
    if(list==nil||list.count==0){
        [self showEmptyListView];
    }
    [self.tableView reloadData];
    
    [self.tableView addHeaderWithTarget:self action:@selector(headerRereshing)];
#warning 自动刷新(一进入程序就下拉刷新)
    if([[MyApp getInstance] isNeedLoad:[NSString stringWithFormat:@"%@_%@_%@",KEY_NEWS,newsType.parentid,newsType.id]]){
        [self.tableView headerBeginRefreshing];
    }
    
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    NewsInfoModel * news = [list objectAtIndex:indexPath.row];
    NewsListCell *cell = [tableView dequeueReusableCellWithIdentifier:spid];
    cell.tag = indexPath.row;
    cell.labelTitle.text = news.title;
    [cell.imgLogo sd_setImageWithURL:[NSURL URLWithString:news.img] placeholderImage:[UIImage imageNamed:@"placeholder_c"]];
    if([CommonUtil stringIsNull:news.subtypename]){
        cell.imgType.hidden = true;
        cell.labelType.hidden = true;
    }
    else{
        cell.labelType.text = news.subtypename;
    }
    if(![NEWS_SUBTYPE_VIDEO isEqualToString:newsType.type]){
        cell.imgVideo.hidden = true;
    }

    /**
    UILabel* label1 = (UILabel*)[cell viewWithTag:14];
    UILabel* label2 = (UILabel*)[cell viewWithTag:15];
    
    UIImageView* img1 = (UIImageView*)[cell viewWithTag:11];
    UIImageView* img2 = (UIImageView*)[cell viewWithTag:12];
    UIImageView* img3 = (UIImageView*)[cell viewWithTag:13];
    if(img1){
        //[img1 sd_setImageWithURL:[NSURL URLWithString:news.img]];
        
        //[img1 sd_setImageWithURL:[NSURL URLWithString:news.img] placeholderImage:[UIImage imageNamed:@"placeholder_c"]];
        label1.text = news.title;
    }
    if([CommonUtil stringIsNull:news.subtypename]){
        img2.hidden = true;
        label2.hidden = true;
    }
    else{
        label2.text = news.subtypename;
    }
    if(![NEWS_SUBTYPE_VIDEO isEqualToString:newsType.type]){
        img3.hidden = true;
    }
    **/
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    NewsInfoModel * news = [list objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    //[cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    /**
    WebViewController *vc = [[WebViewController alloc] init];
    UIStoryboard *cgrvcStory = [UIStoryboard storyboardWithName:@"WebViewStoryboard"
                                                         bundle: nil];
    vc = [cgrvcStory instantiateViewControllerWithIdentifier: @"WebViewController"];
    vc.newsInfo = news;
     **/
    //ContentViewController* vc = [[ContentViewController alloc]init];
    //[self.navigationController pushViewController:vc animated:NO];
    //[self presentModalViewController:vc animated:YES];
    [self goToDetail:news newsType:newsType];
}

#pragma
- (void)httpCallback:(RspResultModel*)rsp requestCode:(NSString*)code{
    DLog(@"callback");
    [self.tableView headerEndRefreshing];
    if([@"0" isEqualToString:rsp.retcode]){
        [[MyApp getInstance] setLastLoadTime:[NSString stringWithFormat:@"%@_%@_%@",KEY_NEWS,newsType.parentid,newsType.id]];
        list = rsp.article_list;
        // 刷新表格
        [self.tableView reloadData];
        [NewsService setCacheNewsList:[NSString stringWithFormat:@"%@_%@_%@",KEY_NEWS,newsType.parentid,newsType.id] data:rsp];
        // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
        
        if(list.count>0){
            [self closeEmptyListView];
        }else{
            [self showEmptyListView];
            [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        }
        
        //[NewsService setCacheNewsList:KEY_HOME data:rsp];
    }
    
}

#pragma mark 开始进入刷新状态
- (void)headerRereshing
{
    [api getNewsList:newsType.parentid subattype:newsType.id start:@"0" size:@"20"];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
