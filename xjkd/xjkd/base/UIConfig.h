//
//  UIConfig.h
//  xjkd
//
//  Created by 聂宗波 on 15-1-10.
//  Copyright (c) 2015年 聂宗波. All rights reserved.
//
#define title_text_color  @"#1787f7"
#define title_bg_color  @"#ffffff"
#define select_tap_title_text_color  @"#1787f7"
#define unselect_tap_title_text_color  @"#a2a2a2"
#define menu_title_color  @"#ffffff"
#define backgroup_reft_color  @"#0f93b8"
#define backgroup_right_color  @"#0f93b8"
#define list_item_title  @"#fff"
#define list_background  @"#303030"
#define list_background_pressed  @"#992416"
#define list_divider  @"#272727"
#define counter_text_bg  @"#626262"

#define yellow  @"#F9F900"
#define white  @"#ffffff"
#define black  @"#000000"
#define grey_start  @"#CBCBCB"
#define grey_end  @"#8C9DAE"
#define blue_start  @"#0f93b8"
#define blue_end  @"#0f93b8"
#define green_start  @"#c6df7a"
#define green_end  @"#92b130"
#define bg_green  @"#94b234"
#define bg_green_9alp  @"#9094b234"
#define bg_green_5alp  @"#5094b234"
#define black_start  @"#333333"
#define black_end  @"#181818"
#define vlgrey  @"#EEEEEE"
#define transparent  @"#00000000"
#define red  @"#ff0000"
#define app_bg  @"#eeeeee"
#define font_blue_normal @"#138ef8"

#define string_about_org @"新华社辽宁分社"
#define string_about_suborg @"中共宽甸满族自治县委宣传部"
#define string_about_phone @"0415-5122792"
#define string_about_fax @"0415-5122792"
#define string_about_address @"宽甸满族自治县宽甸镇婆娑府街11号"
#define string_about_web @"http://www.kdxw.cn/"

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface UIConfig : NSObject
+(UIColor *) getColor: (NSString *) stringToConvert;
@end
