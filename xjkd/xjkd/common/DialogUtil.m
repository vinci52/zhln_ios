//
//  DialogUtil.m
//  xjkd
//
//  Created by 聂宗波 on 15-1-8.
//  Copyright (c) 2015年 聂宗波. All rights reserved.
//

#import "DialogUtil.h"

@implementation DialogUtil
+(UIActivityIndicatorView*)showProccess:(UIView*)parentView indicatorView:(UIActivityIndicatorView*)indicator{
    if(parentView){
        if(indicator==nil){
            //初始化:
            indicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
            
            indicator.tag = 103;
            
            //设置显示样式,见UIActivityIndicatorViewStyle的定义
            indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
            
            
            //设置背景色
            indicator.backgroundColor = [UIColor blackColor];
            
            //设置背景透明
            indicator.alpha = 0.4;
            
            //设置背景为圆角矩形
            indicator.layer.cornerRadius = 6;
            indicator.layer.masksToBounds = YES;
            //设置显示位置
            [indicator setCenter:CGPointMake(parentView.frame.size.width / 2.0, parentView.frame.size.height / 2.0)];
            
            [parentView addSubview:indicator];
            //开始显示Loading动画
            [indicator startAnimating];
        }
        else{
            if(![indicator isAnimating]){
                [indicator startAnimating];
            }
        }
    }
    return  indicator;
}
+(void)closeProccess:(UIActivityIndicatorView*)indicatorV{
    if(indicatorV&&[indicatorV isAnimating]){
         NSLog(@"ffdfdsfds");
        [indicatorV stopAnimating];
    }
}
@end
