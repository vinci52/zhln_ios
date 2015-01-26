//
//  XinHuaAnalytics.h
//  XinHuaAnalytics
//
//  Created by 雷华 on 14-8-14.
//  Copyright (c) 2014年 雷华. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

typedef enum {          //发送策略
    XHBATCH = 0,          //Send Data When Start
    XHREALTIME = 1,       //RealTime Send Policy
    XHEVERYDAY = 2,       //EveryDay send Policy
} XHReportPolicy;

@interface XinHuaAnalytics : NSObject<CLLocationManagerDelegate>


//Debug模式下为调试模式及时发送并打印发送消息及结果，非Debug模式采用发送策略
+(void)setDebugEnabled:(BOOL)value;
//启动验证，需传入参数，appid、appkey和channelID,channelID为nil状态下默认为appStroe渠道
+(void)startWithAppID:(NSString*)appID appKey:(NSString*)appKey channelID:(NSString *)channelID;
//获取sdk版本号
+ (NSString *)getXH_SDKVersion;

//自定义事件上传，参数定义请参见受控词表
+(void)postEvent:(NSString*)operateType seviceParm:(NSString*)seviceParm operateObjID:(NSString*)operateObjID;
//页面开始跳转监听，请在每个view的viewWillApear中调用
+(void)beginEvent:(NSString*)page;
//页面结束跳转监听，请在每个view 的viewWillDisApear中调用
+(void)endEvent:(NSString*)page;
//设置进入后台多长时间sessionID失效并生成新的sessionID
+ (void)setCreatSessionIdTime:(NSInteger)creatSeconds;
//设置登录用户信息
+ (void)setUserID:(NSString*)userID;
+ (void)setUserName:(NSString*)userName;
//获取提供的udid
+ (NSString*)getXH_OpenUDID;
//是否采集地理位置信息，若没有调用此接口的情况下默认为YES.采集状态,如需设置不采集地理位置信息，请在调用startWithAppID:appKey:channelID接口之前调用。
+ (void)enableLocation:(BOOL)value;
@end
