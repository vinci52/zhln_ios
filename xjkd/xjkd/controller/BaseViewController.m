//
//  BaseViewController.m
//  xjkd
//
//  Created by 聂宗波 on 15-1-8.
//  Copyright (c) 2015年 聂宗波. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()
{
    UIView* mEmptyView;
    UIActivityIndicatorView* myIndicatorView;
    
}
@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIConfig getColor:app_bg];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)showEmptyListView{
    if(mEmptyView==nil){
        NSArray *nib = [[NSBundle mainBundle]loadNibNamed:@"NoDataView" owner:self options:nil];
        //得到第一个UIView
        mEmptyView = [nib objectAtIndex:0];
        //获得屏幕的Frame
        CGRect tmpFrame = [[UIScreen mainScreen] bounds];
        //设置自定义视图的中点为屏幕的中点
        [mEmptyView setCenter:CGPointMake(tmpFrame.size.width / 2, tmpFrame.size.height / 2-60)];
    }
    
    //添加视图
    [self.view addSubview:mEmptyView];
}

-(void)closeEmptyListView{
    if(mEmptyView!=nil){
        [mEmptyView removeFromSuperview];
        
    }
}
-(void)backVC
{
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)initNavBar:(NSString*)title{
    self.navigationItem.title = title;
    UIButton *button  = [[UIButton alloc] initWithFrame:CGRectMake(5, 0, 11, 21)];
    [button setImage:[UIImage imageNamed:@"back_btn_normal"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"back_btn_press"] forState:UIControlStateSelected];
    [button addTarget:self action:@selector(backVC) forControlEvents:UIControlEventTouchUpInside];    
    self.navigationItem.leftBarButtonItem= [[UIBarButtonItem alloc] initWithCustomView:button];
}

-(void)showProccess{
    if(myIndicatorView==nil){
        //初始化:
        myIndicatorView = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
        
        myIndicatorView.tag = 103;
        
        //设置显示样式,见UIActivityIndicatorViewStyle的定义
        myIndicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
        
        
        //设置背景色
        myIndicatorView.backgroundColor = [UIColor blackColor];
        
        //设置背景透明
        myIndicatorView.alpha = 0.4;
        
        //设置背景为圆角矩形
        myIndicatorView.layer.cornerRadius = 6;
        myIndicatorView.layer.masksToBounds = YES;
        //设置显示位置
        [myIndicatorView setCenter:CGPointMake(self.view.frame.size.width / 2.0, self.view.frame.size.height / 2.0)];
        
        [self.view addSubview:myIndicatorView];
        //开始显示Loading动画
        [myIndicatorView startAnimating];
    }
    else{
        if(!myIndicatorView.isAnimating){
            [myIndicatorView startAnimating];
        }
    }
}
-(void)closeProccess{
    if(myIndicatorView!=nil&&myIndicatorView.isAnimating){
        [myIndicatorView stopAnimating];
    }
}

-(BOOL)isRspOk:(RspResultModel*)rsp{
    return rsp!=nil&&[@"0" isEqualToString:rsp.retcode];
}

-(void)setItemSelector:(UIButton*)btn bgColor:(UIColor*)bgColor{
    CGSize imageSize = CGSizeMake(btn.frame.size.width, btn.frame.size.height);
    UIGraphicsBeginImageContextWithOptions(imageSize, 0, [UIScreen mainScreen].scale);
    
    [bgColor set];
    UIRectFill(CGRectMake(0, 0, imageSize.width, imageSize.height));
    UIImage *pressedColorImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    //[btnModifyInfo setImage:pressedColorImg forState:UIControlEventTouchUpInside];
    [btn setBackgroundImage:pressedColorImg forState:UIControlStateHighlighted];
    [btn setHighlighted:true];

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
