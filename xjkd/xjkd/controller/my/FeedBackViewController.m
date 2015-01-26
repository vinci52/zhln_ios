//
//  FeedBackViewController.m
//  xjkd
//
//  Created by 聂宗波 on 15-1-13.
//  Copyright (c) 2015年 聂宗波. All rights reserved.
//

#import "FeedBackViewController.h"

@interface FeedBackViewController ()
{
    HttpApi* api;
}

@end

@implementation FeedBackViewController
@synthesize tvContent;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initNavBar:@"意见反馈"];
    api = [HttpApi new];
    api.delegate = self;
    tvContent.layer.borderWidth =1.0;
    tvContent.layer.cornerRadius =5.0;
    [tvContent.layer setBorderColor:[[UIColor lightGrayColor]CGColor]];
    //[tvContent setContentOffset:CGPointZero];
    
    //[tvContent addObserver:self forKeyPath:@"contentSize" options:(NSKeyValueObservingOptionNew) context:NULL];
    
    UIButton *button  = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    [button setImage:[UIImage imageNamed:@"confirm_btn_normal"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"confirm_btn_press"] forState:UIControlStateSelected];
    [button addTarget:self action:@selector(doFeedback) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
    
    if ([self respondsToSelector:@selector(setAutomaticallyAdjustsScrollViewInsets:)]) {
        
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)httpCallback:(RspResultModel*)rsp requestCode:(NSString*)code{
    DLog(@"callback");
    [self closeProccess];
    if([self isRspOk:rsp]){
        [self.view makeToast:@"反馈成功"];
        //[self backVC];
        self.tvContent.text = @"";
    }
    else{
        [self.view makeToast:rsp.retmsg];
    }
}

-(void)doFeedback{
    NSString* content = self.tvContent.text;
    if([CommonUtil stringIsNull:content]){
        [self.view makeToast:@"请输入反馈意见"];
        return;
    }
        [self showProccess];
    [api userFeedback:content];
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
