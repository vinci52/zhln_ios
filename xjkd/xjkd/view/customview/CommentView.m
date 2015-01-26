//
//  CommentView.m
//  xjkd
//
//  Created by 聂宗波 on 15-1-11.
//  Copyright (c) 2015年 聂宗波. All rights reserved.
//

#import "CommentView.h"
#import "AppDelegate.h"

@implementation CommentView
@synthesize btnCancel;
@synthesize btnSure;
@synthesize textView;
@synthesize clearInputWhenSend;
@synthesize resignFirstResponderWhenSend;
@synthesize originalFrame;
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)initView{
    //注册键盘通知
    self.btnCancel = (UIButton *)[self viewWithTag:11];
    self.btnSure = (UIButton *)[self viewWithTag:12];
    self.textView = (UITextView*)[self viewWithTag:13];
    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    [btnSure addTarget:self action:@selector(sendBtnPress:) forControlEvents:UIControlEventTouchUpInside];
    [btnCancel addTarget:self action:@selector(cancelBtnPress:) forControlEvents:UIControlEventTouchUpInside];
    textView.layer.borderWidth =1.0;
    textView.layer.cornerRadius =5.0;
    [textView.layer setBorderColor:[[UIColor lightGrayColor]CGColor]];
    [textView becomeFirstResponder];
    
}

#pragma mark selfDelegate method

-(void)cancelBtnPress:(UIButton*)sender
{
    if (self.delegate&&[self.delegate respondsToSelector:@selector(inputBarSure:sendBtnPress:withInputString:)]) {
        [self.delegate inputBarSure:self sendBtnPress:sender withInputString:@"isclose"];
    }
}

-(void)sendBtnPress:(UIButton*)sender
{
    if (self.delegate&&[self.delegate respondsToSelector:@selector(inputBarSure:sendBtnPress:withInputString:)]) {
        [self.delegate inputBarSure:self sendBtnPress:sender withInputString:self.textView.text];
    }
    if (self.clearInputWhenSend) {
        //self.textField.text = @"";
    }
    if (self.resignFirstResponderWhenSend) {
        //[self resignFirstResponder];
    }
}

#pragma mark keyboardNotification

- (void)keyboardWillShow:(NSNotification*)notification{
    /**
    CGRect _keyboardRect = [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    NSLog(@"%f-%f-%f-%f",_keyboardRect.origin.y,_keyboardRect.size.height,[self getHeighOfWindow]-CGRectGetMaxY(self.frame),CGRectGetMinY(self.frame));
    
    //如果self在键盘之下 才做偏移
    if ([self convertYToWindow:CGRectGetMaxY(self.originalFrame)]>=_keyboardRect.origin.y)
    {
        //没有偏移 就说明键盘没出来，使用动画
        if (self.frame.origin.y== self.originalFrame.origin.y) {
            
            [UIView animateWithDuration:0.3
                                  delay:0
                                options:UIViewAnimationOptionCurveEaseInOut
                             animations:^{
                                 self.transform = CGAffineTransformMakeTranslation(0, -_keyboardRect.size.height+[self getHeighOfWindow]-CGRectGetMaxY(self.originalFrame));
                             } completion:nil];
        }
        else
        {
            self.transform = CGAffineTransformMakeTranslation(0, -_keyboardRect.size.height+[self getHeighOfWindow]-CGRectGetMaxY(self.originalFrame));
        }
        
    }
    else
    {
        
    }
    **/
}

- (void)keyboardWillHide:(NSNotification*)notification{
    
    
    [UIView animateWithDuration:0.3
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.transform = CGAffineTransformMakeTranslation(0, 0);
                     } completion:nil];
}
#pragma  mark ConvertPoint
//将坐标点y 在window和superview转化  方便和键盘的坐标比对
-(float)convertYFromWindow:(float)Y
{
    AppDelegate *appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    CGPoint o = [appDelegate.window convertPoint:CGPointMake(0, Y) toView:self.superview];
    return o.y;
    
}
-(float)convertYToWindow:(float)Y
{
    AppDelegate *appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    CGPoint o = [self.superview convertPoint:CGPointMake(0, Y) toView:appDelegate.window];
    return o.y;
    
}
-(float)getHeighOfWindow
{
    AppDelegate *appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    return appDelegate.window.frame.size.height;
}



-(BOOL)resignFirstResponder
{
    [self.textView resignFirstResponder];
    return [super resignFirstResponder];
}

@end
