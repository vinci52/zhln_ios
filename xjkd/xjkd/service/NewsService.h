//
//  NewsService.h
//  xjkd
//
//  Created by 聂宗波 on 15-1-9.
//  Copyright (c) 2015年 聂宗波. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RspResultModel.h"
#import "MyApp.h"
#import "DataCache.h"


@interface NewsService : NSObject

//获取新闻类型列表
+(NSMutableArray*)getNewsType;

//初始化新闻列表
+(void)initNewsType:(NSMutableArray*)newTypeList;

//获取缓存的新闻列表
+(RspResultModel*)getCacheNewsList:(NSString*)flag;

//设置缓存新闻列表
+(void)setCacheNewsList:(NSString*)flag data:(RspResultModel*)data;

//新增新闻搜藏
+(void)addNewsFav:(NewsInfoModel*)news;
//取消搜藏
+(void)cancelNewsFav:(NewsInfoModel*)news;

//获取新闻收藏列表
+(RspResultModel*)getFavNewsList;

+(BOOL)isFav:(NewsInfoModel*)news;
@end
