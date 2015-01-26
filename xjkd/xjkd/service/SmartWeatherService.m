//
//  SmartWeatherService.m
//  xjkd
//
//  Created by 聂宗波 on 15-1-13.
//  Copyright (c) 2015年 聂宗波. All rights reserved.
//

#import "SmartWeatherService.h"
#import "RspResultModel.h"
@implementation SmartWeatherService
+(NSString*)getSmartWeatherUrl:(NSString*)type{
    NSDate *  senddate = [NSDate date];
    NSDateFormatter  *dateformatter = [[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"YYYYMMddhhmm"];
    NSString *  timeStr = [dateformatter stringFromDate:senddate];
    
    //你的appid
    NSString *appid = SW_APPID;
    //你的appid前6位
    NSString *shortappid = @"c408b1";
    
    NSString *areaid = SW_AREA;
    
    NSString *base = [NSString stringWithFormat:@"http://open.weather.com.cn/data/?areaid=%@&type=%@&date=",areaid,type];
    
    //生成公钥时:取完整的 appid
    NSString *urlAppid = [NSString stringWithFormat:@"%@%@&appid=%@",base,timeStr,appid];
    
    //传递参数时:截取 appid 的前 6 位
    NSString *urlShortAppid = [NSString stringWithFormat:@"%@%@&appid=%@",base,timeStr,shortappid];
    //你的private_key
    NSString *privateKey = SW_PKEY;
    
    //得到了key
    NSString *key = [Hmacsha hmacsha1:urlAppid key:privateKey
                     ];
    //IOS的URL中文以及符号转码
    key = [self encodeToPercentEscapeString:key];
    
    //接口的完整URL
    NSString *endUrl = [NSString stringWithFormat:@"%@&key=%@",urlShortAppid,key];
    NSLog(@"swur;%@",endUrl);
    return endUrl;
}

+(NSString *)encodeToPercentEscapeString: (NSString *) input
{
    NSString *outputStr = (NSString *)
    CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                            (CFStringRef)input,
                                            NULL,
                                            (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                            kCFStringEncodingUTF8);
    return outputStr;
}

@end
