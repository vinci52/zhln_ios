//
//  NewsCommentViewController.m
//  xjkd
//
//  Created by 聂宗波 on 15-1-17.
//  Copyright (c) 2015年 聂宗波. All rights reserved.
//

#import "NewsCommentViewController.h"
#import "CommentModel.h"
#import "CommentView.h"
#import "NewsService.h"

@interface NewsCommentViewController()<MyInputBarDelegate>

@end

@implementation NewsCommentViewController{
    HttpApi *api;
    NSMutableArray *list;
    CommentView *myView;
}
@synthesize newsInfo;
@synthesize tableView;
@synthesize tvArround;
@synthesize tfComment;
@synthesize btnFav;
@synthesize btnComment;
@synthesize btnShare;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = newsInfo.title;
    api = [HttpApi new];
    api.delegate = self;
    [self initNavBar:@"跟帖"];
    self.view.backgroundColor = [UIConfig getColor:app_bg];
    [self.tableView addHeaderWithTarget:self action:@selector(headerRereshing)];
    [self.tableView headerBeginRefreshing];
    
    tvArround.layer.borderWidth =1.0;
    tvArround.layer.cornerRadius =2.0;
    [tvArround.layer setBorderColor:[[UIColor lightGrayColor]CGColor]];
    
    [btnComment addTarget:self action:@selector(commentOnclick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.btnFav addTarget:self action:@selector(doFav) forControlEvents:UIControlEventTouchUpInside];
    [self refreshFavBtn];
    self.tableView.backgroundColor = [UIConfig getColor:app_bg];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)commentOnclick{
    NSArray *nib = [[NSBundle mainBundle]loadNibNamed:@"CommentView" owner:self options:nil];
    //得到第一个UIView
    myView = [nib objectAtIndex:0];
    
    //获得屏幕的Frame
    CGRect tmpFrame = [[UIScreen mainScreen] bounds];
    //设置自定义视图的中点为屏幕的中点
    [myView setCenter:CGPointMake(tmpFrame.size.width / 2, tmpFrame.size.height / 2-50)];
    myView.delegate = self;
    myView.clearInputWhenSend = YES;
    myView.resignFirstResponderWhenSend = YES;
    [myView initView];
    [self.view addSubview:myView];
    
    
}

-(void)inputBarSure:(CommentView *)inputBar sendBtnPress:(UIButton *)sendBtn withInputString:(NSString *)str
{
    NSLog(@"%@",str);
    if(str.length==0){
        [self.view makeToast:@"请填写评论" duration:3.0 position:@"center"];
        return;
    }
    else if([@"isclose" isEqualToString:str]){
        [myView removeFromSuperview];
    }
    else {//发起请求
        [self showProccess];
        [api pubNewComment:newsInfo.id replycontent:str attype:newsInfo.arttype];
    }
    
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view.subviews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [((UIView*)obj) resignFirstResponder];
    }];
}

-(void)doFav{
    if([NewsService isFav:newsInfo]){
        [NewsService cancelNewsFav:newsInfo];
        //[self.view makeToast:@"取消收藏成功"];
    }
    else{
        [NewsService addNewsFav:newsInfo];
        //[self.view makeToast:@"收藏成功"];
    }
    [self refreshFavBtn];
}

-(void)refreshFavBtn{
    if([NewsService isFav:newsInfo]){
        [btnFav setBackgroundImage:[UIImage imageNamed:@"collect_bnt_press"] forState:UIControlStateNormal];
    }
    else{
        [btnFav setBackgroundImage:[UIImage imageNamed:@"collect_bnt_normal"] forState:UIControlStateNormal];
    }
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
    CommentModel * comment = [list objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:spid];
    //UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if(cell==nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:spid];
    }
    cell.tag = indexPath.row;
    UIImageView* img1 = (UIImageView*)[cell viewWithTag:11];
    UILabel* label1 = (UILabel*)[cell viewWithTag:12];
    UILabel* label2 = (UILabel*)[cell viewWithTag:13];
    UILabel* label3 = (UILabel*)[cell viewWithTag:14];
    
    [img1 sd_setImageWithURL:[NSURL URLWithString:comment.userphoto] placeholderImage:[UIImage imageNamed:@"placeholder_c"]];
    label1.text = comment.username;
    label2.text = comment.createtime;
    label3.text = comment.content;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NewsInfoModel * news = [list objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
}

#pragma
- (void)httpCallback:(RspResultModel*)rsp requestCode:(NSString*)code{
    DLog(@"callback");
    if([code isEqualToString:@"pubNewComment"]){
        [self closeProccess];
        
        if([@"0" isEqualToString:rsp.retcode]){
            [self.view makeToast:@"评论成功"];
            [myView removeFromSuperview];
        }
        else{
            [self.view makeToast:rsp.retmsg duration:3.0 position:@"center"];
        }

    }
    else {
        [self.tableView headerEndRefreshing];
        if([@"0" isEqualToString:rsp.retcode]){
            
            list = rsp.comment_list;
            // 刷新表格
            [self.tableView reloadData];
            if(list.count>0){
                [self closeEmptyListView];
            }else{
                [self showEmptyListView];
                [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
            }
            
            //[NewsService setCacheNewsList:KEY_HOME data:rsp];
        }

    }
}

#pragma mark 开始进入刷新状态
- (void)headerRereshing
{
    [api commentsList:[NSString stringWithFormat:@"%@",newsInfo.id] type:@"0" start:@"0" size:@"20" attype:newsInfo.arttype];
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
