//
//  WebViewController.m
//  xjkd
//
//  Created by 聂宗波 on 15-1-11.
//  Copyright (c) 2015年 聂宗波. All rights reserved.
//

#import "WebViewController.h"
#import "Toast+UIView.h"
#import "NewsCommentViewController.h"

@interface WebViewController ()<MyInputBarDelegate>
{
    CommentView *myView;
    NSString *typeId;
    HttpApi* api;
}

@end

@implementation WebViewController
@synthesize webViews;
@synthesize newsInfo;
@synthesize newsType;
@synthesize tfComment;
@synthesize btnComment;
@synthesize btnFav;
@synthesize btnShare;
@synthesize tvArround;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSURL *url = [NSURL URLWithString:newsInfo.url];
    [webViews loadRequest:[[NSURLRequest alloc]initWithURL:url]];
    [self initNavBar:@""];
    api = [HttpApi new];
    api.delegate = self;
    self.webViews.delegate = self;
    
    tvArround.layer.borderWidth =1.0;
    tvArround.layer.cornerRadius =2.0;
    [tvArround.layer setBorderColor:[[UIColor lightGrayColor]CGColor]];
    
    
    [btnComment addTarget:self action:@selector(commentOnclick) forControlEvents:UIControlEventTouchUpInside];
    if(![CommonUtil stringIsNull:newsInfo.arttype]){
        typeId = newsInfo.arttype;
    }
    else{
        typeId = [CommonUtil stringIsNull:newsType.parentid]?newsType.id:newsType.parentid;
        newsInfo.arttype = typeId;
    }
    NSLog(@"newsInfo.replycount:%@",newsInfo.replycount);
    newsInfo.replycount = newsInfo.replycount?[NSString stringWithFormat:@"%@",newsInfo.replycount]:@"0";
    UIButton *button  = [[UIButton alloc] initWithFrame:CGRectMake(0, 6, 58, 30)];
    button.layer.borderWidth =1.0;
    button.layer.cornerRadius =5.0;
    button.titleLabel.font = [UIFont systemFontOfSize: 12.0];

    [button.layer setBorderColor:[[UIConfig getColor:title_text_color]CGColor]];
    //button.backgroundColor = [UIConfig getColor:title_text_color];
    [button setTitleColor:[UIConfig getColor:title_text_color] forState:UIControlStateNormal];
    [button setTitle:[NSString stringWithFormat:@"%@跟帖",newsInfo.replycount] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(goToCommentList) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
    
    //[self.view addSubview:myView];
    [self refreshFavBtn];
    [self.btnFav addTarget:self action:@selector(doFav) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)goToCommentList{
    NewsCommentViewController *vc;
    UIStoryboard *cgrvcStory = [UIStoryboard storyboardWithName:@"NewsStoryboard"
                                                         bundle: nil];
    vc = [cgrvcStory instantiateViewControllerWithIdentifier: @"NewsCommentViewController"];
    vc.newsInfo = newsInfo;
    
    [self.navigationController pushViewController:vc animated:YES];
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
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    NSLog(@"开始加载页面");
    [self showProccess];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [self closeProccess];
        //[self.webView stringByEvaluatingJavaScriptFromString:@"fn();"];
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
        [api pubNewComment:newsInfo.id replycontent:str attype:typeId];
    }
    
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view.subviews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [((UIView*)obj) resignFirstResponder];
    }];
}

#pragma
- (void)httpCallback:(RspResultModel*)rsp requestCode:(NSString*)code{
    DLog(@"callback");
    [self closeProccess];
    
    if([@"0" isEqualToString:rsp.retcode]){
        [self.view makeToast:@"评论成功"];
       [myView removeFromSuperview];
    }
    else{
        [self.view makeToast:rsp.retmsg duration:3.0 position:@"center"];
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
