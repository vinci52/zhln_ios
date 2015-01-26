//
//  MyApp.h
//  xjkd
//
//  Created by 聂宗波 on 15-1-9.
//  Copyright (c) 2015年 聂宗波. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserInfoModel.h"
#import "DataCache.h"
#import "XinHuaAnalytics.h"


@interface MyApp : NSObject
@property (nonatomic, retain) NSMutableDictionary* leftMenuDic;
+(MyApp*)getInstance;
//获取左边菜单的图标
-(NSMutableDictionary*)getLeftMenuDic;
-(UserInfoModel*)getUserInfo;
-(void)setUserInfo:(UserInfoModel*)userInfo;
-(void)setLastLoadTime:(NSString*)loadFlag;
-(BOOL)isNeedLoad:(NSString*)loadFlag;
@end
