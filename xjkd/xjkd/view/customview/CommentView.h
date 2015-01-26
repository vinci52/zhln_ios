//
//  CommentView.h
//  xjkd
//
//  Created by 聂宗波 on 15-1-11.
//  Copyright (c) 2015年 聂宗波. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CommentView;
@protocol MyInputBarDelegate <NSObject>

-(void)inputBarSure:(CommentView*)inputBar sendBtnPress:(UIButton*)sendBtn withInputString:(NSString*)str;

@end
@interface CommentView : UIView
//代理 用于传递btn事件
@property(assign,nonatomic)id<MyInputBarDelegate> delegate;

@property (nonatomic, strong) IBOutlet UIButton* btnCancel;
@property (nonatomic, strong) IBOutlet UIButton* btnSure;
@property (nonatomic, strong) IBOutlet UITextView* textView;

//点击btn时候 清空textfield  默认NO
@property(assign,nonatomic)BOOL clearInputWhenSend;
//点击btn时候 隐藏键盘  默认NO
@property(assign,nonatomic)BOOL resignFirstResponderWhenSend;

//初始frame
@property(assign,nonatomic)CGRect originalFrame;

//隐藏键盘
-(BOOL)resignFirstResponder;

-(void)initView;
@end
