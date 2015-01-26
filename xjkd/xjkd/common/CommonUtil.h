//
//  CommonUtil.h
//  xjkd
//
//  Created by 聂宗波 on 15-1-8.
//  Copyright (c) 2015年 聂宗波. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CommonUtil : NSObject
//将16进制转化为uicolor
+(UIColor *) hexStringToColor: (NSString *) stringToConvert;

+(BOOL)stringIsNull:(NSString*)str;

+(BOOL)arrayIsNull:(NSMutableArray*)array;

+(NSString*)fmtDate:(NSDate*)date ftm:(NSString*)fmt;

+(NSString*)fmtNowDate:(NSString*)fmt;

+(NSString*)getWeekDay;

+(NSString*)getChineseCalendarWithDate:(NSDate *)date;

+(BOOL)isValidateEmail:(NSString *)email;
@end
