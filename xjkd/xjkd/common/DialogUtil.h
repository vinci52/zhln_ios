//
//  DialogUtil.h
//  xjkd
//
//  Created by 聂宗波 on 15-1-8.
//  Copyright (c) 2015年 聂宗波. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DialogUtil : NSObject
+(UIActivityIndicatorView*)showProccess:(UIView*)parentView indicatorView:(UIActivityIndicatorView*)indicatorV;
+(void)closeProccess:(UIActivityIndicatorView*)indicatorV;
@end
