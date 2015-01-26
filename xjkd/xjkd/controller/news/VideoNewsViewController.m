//
//  VideoNewsViewController.m
//  xjkd
//
//  Created by 聂宗波 on 15-1-13.
//  Copyright (c) 2015年 聂宗波. All rights reserved.
//

#import "VideoNewsViewController.h"
#import "UIButton+WebCache.h"

@interface VideoNewsViewController ()<MyInputBarDelegate>
{
    CommentView *myView;
    NSString *typeId;
    HttpApi* api;
}

@end

@implementation VideoNewsViewController
@synthesize newsType;
@synthesize newsInfo;
@synthesize tfComment;
@synthesize btnComment;
@synthesize btnFav;
@synthesize btnShare;
@synthesize tvArround;
@synthesize labeTime;
@synthesize labeTitle;
@synthesize btnLogo;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initNavBar:@""];
    api = [HttpApi new];
    api.delegate = self;
    
    labeTitle.text = newsInfo.title;
    labeTime.text = newsInfo.createtime;
    [btnLogo sd_setBackgroundImageWithURL:[NSURL URLWithString:newsInfo.img]
                             forState:UIControlStateNormal];
    tvArround.layer.borderWidth =1.0;
    tvArround.layer.cornerRadius =2.0;
    [tvArround.layer setBorderColor:[[UIColor lightGrayColor]CGColor]];
    
    
    [btnComment addTarget:self action:@selector(commentOnclick) forControlEvents:UIControlEventTouchUpInside];
    if(![CommonUtil stringIsNull:newsInfo.newtype]){
        typeId = newsInfo.arttype;
    }
    else{
        typeId = [CommonUtil stringIsNull:newsType.parentid]?newsType.id:newsType.parentid;
        newsInfo.arttype = typeId;
    }

    [btnLogo addTarget:self action:@selector(goToVideo) forControlEvents:UIControlEventTouchUpInside];
}

-(void)goToVideo{
    VideoViewController* vc = [[VideoViewController alloc]init];
    vc.videoUrl = [NSURL URLWithString:newsInfo.videourl];
    //vc.videoUrl = [NSURL URLWithString:@"http://221.180.149.181/file/static/webfiles/20141215/1403268826.mp4"];
    //[self.navigationController pushViewController:vc animated:NO];
    [self presentModalViewController:vc animated:YES];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
