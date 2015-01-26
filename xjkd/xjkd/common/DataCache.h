//
//  DataCache.h
//  xjkd
//
//  Created by 聂宗波 on 15-1-9.
//  Copyright (c) 2015年 聂宗波. All rights reserved.
//
#define KEY_NEWSTYPE @"KEY_NEWSTYPE"
#define KEY_HOME @"KEY_HOME"
#define KEY_USER @"KEY_USER"
#define KEY_NEWS @"KEY_NEWS"
#define KEY_NEWS_FAV @"KEY_NEWS_FAV"
#import <Foundation/Foundation.h>

@interface DataCache : NSObject
+(void)setObject:(NSString*)key value:(NSObject*)obj;
+(NSObject*)getObject:(NSString*)key;
@end
