//
//  NewsService.m
//  xjkd
//
//  Created by 聂宗波 on 15-1-9.
//  Copyright (c) 2015年 聂宗波. All rights reserved.
//

#import "NewsService.h"

@implementation NewsService
//获取新闻类型列表
+(NSMutableArray*)getNewsType{
    NSString * str = @"{\"retcode\":\"0\",\"retmsg\":\"\",\"attype_list\":[{\"id\":\"10\",\"name\":\"走进宽甸\",\"type\":\"0\",\"hassub\":\"0\",\"outurl\":\"\",\"openreply\":\"1\",\"subtypes\":[{\"id\":\"11\",\"name\":\"宽甸概况\",\"type\":\"0\",\"hassub\":\"0\",\"outurl\":\"\",\"openreply\":\"1\"},{\"id\":\"12\",\"name\":\"宽甸奇闻\",\"type\":\"0\",\"hassub\":\"0\",\"outurl\":\"\",\"openreply\":\"1\"}]},{\"id\":\"14\",\"name\":\"生态旅游实验区\",\"type\":\"0\",\"hassub\":\"0\",\"outurl\":\"\",\"openreply\":\"1\",\"subtypes\":[{\"id\":\"16\",\"name\":\"建设规划\",\"type\":\"0\",\"hassub\":\"0\",\"outurl\":\"\",\"openreply\":\"1\"},{\"id\":\"17\",\"name\":\"绿色经济\",\"type\":\"0\",\"hassub\":\"0\",\"outurl\":\"\",\"openreply\":\"1\"}]},{\"id\":\"23\",\"name\":\"今日关注\",\"type\":\"0\",\"hassub\":\"0\",\"outurl\":\"\",\"openreply\":\"1\",\"subtypes\":[{\"id\":\"24\",\"name\":\"滚动新闻\",\"type\":\"0\",\"hassub\":\"0\",\"outurl\":\"\",\"openreply\":\"1\"},{\"id\":\"25\",\"name\":\"视频宽甸\",\"type\":\"2\",\"hassub\":\"0\",\"outurl\":\"\",\"openreply\":\"1\"},{\"id\":\"322\",\"name\":\"基层快讯\",\"type\":\"0\",\"hassub\":\"0\",\"outurl\":\"\",\"openreply\":\"1\"}]},{\"id\":\"27\",\"name\":\"旅游休闲\",\"type\":\"0\",\"hassub\":\"0\",\"outurl\":\"\",\"openreply\":\"1\",\"subtypes\":[{\"id\":\"388\",\"name\":\"本地热点\",\"type\":\"0\",\"hassub\":\"0\",\"outurl\":\"\",\"openreply\":\"1\"},{\"id\":\"389\",\"name\":\"旅游联盟\",\"type\":\"9\",\"hassub\":\"0\",\"outurl\":\"\",\"openreply\":\"1\"}]},{\"id\":\"28\",\"name\":\"宽甸特产\",\"type\":\"0\",\"hassub\":\"1\",\"outurl\":\"\",\"openreply\":\"1\",\"subtypes\":[]},{\"id\":\"29\",\"name\":\"宽甸美食\",\"type\":\"0\",\"hassub\":\"0\",\"outurl\":\"\",\"openreply\":\"1\",\"subtypes\":[{\"id\":\"31\",\"name\":\"当地特色\",\"type\":\"0\",\"hassub\":\"0\",\"outurl\":\"\",\"openreply\":\"1\"},{\"id\":\"32\",\"name\":\"吃货日记\",\"type\":\"0\",\"hassub\":\"0\",\"outurl\":\"\",\"openreply\":\"1\"}]},{\"id\":\"36\",\"name\":\"摄友天地\",\"type\":\"0\",\"hassub\":\"0\",\"outurl\":\"\",\"openreply\":\"1\",\"subtypes\":[{\"id\":\"37\",\"name\":\"V电影\",\"type\":\"2\",\"hassub\":\"0\",\"outurl\":\"\",\"openreply\":\"1\"},{\"id\":\"38\",\"name\":\"宽甸风光\",\"type\":\"0\",\"hassub\":\"0\",\"outurl\":\"\",\"openreply\":\"1\"},{\"id\":\"39\",\"name\":\"影人交流\",\"type\":\"0\",\"hassub\":\"0\",\"outurl\":\"\",\"openreply\":\"1\"},{\"id\":\"40\",\"name\":\"摄影赛事\",\"type\":\"0\",\"hassub\":\"0\",\"outurl\":\"\",\"openreply\":\"1\"}]},{\"id\":\"41\",\"name\":\"便民信息\",\"type\":\"0\",\"hassub\":\"1\",\"outurl\":\"\",\"openreply\":\"1\",\"subtypes\":[]},{\"id\":\"385\",\"name\":\"新华社发布\",\"type\":\"3\",\"hassub\":\"0\",\"outurl\":\"http://xhpfm.open.zhongguowangshi.com/open/index\",\"openreply\":\"1\",\"subtypes\":[]},{\"id\":\"386\",\"name\":\"中国网事\",\"type\":\"3\",\"hassub\":\"0\",\"outurl\":\"http://www.zhongguowangshi.com/api/open/List.aspx?siteid=327&wt=%E4%B8%AD%E5%9B%BD%E7%BD%91%E4%BA%8B\",\"openreply\":\"1\",\"subtypes\":[]},{\"id\":\"387\",\"name\":\"商城\",\"type\":\"3\",\"hassub\":\"0\",\"outurl\":\"http://m.51tiangou.com/xinHuaShe\",\"openreply\":\"1\",\"subtypes\":[]},{\"id\":\"390\",\"name\":\"书记县长信箱\",\"type\":\"4\",\"hassub\":\"0\",\"outurl\":\"\",\"openreply\":\"1\",\"subtypes\":[]}]}";
    //str = @"{\"retcode\":\"0\",\"retmsg\":\"\"}";
    NSData* xmlData = [str dataUsingEncoding:NSUTF8StringEncoding];
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:xmlData
                                                        options:NSUTF8StringEncoding
                                                          error:nil];
    NSLog(@"%@",dic);
    RspResultModel * rsp = [[RspResultModel alloc] initWithDictionary:dic];
    
    if(rsp){
        NSLog(@"jiexi chenggong %d",rsp.attype_list.count);
    }
    else{
        NSLog(@"fail");
    }
    NewsTypeModel *home = [NewsTypeModel new];
    home.id = @"home";
    home.name = @"首页";
    home.normalImg = [NSString stringWithFormat:@"%@_normal",[[[MyApp getInstance] getLeftMenuDic] valueForKey:home.id]];
    home.selectImg = [NSString stringWithFormat:@"%@_press",[[[MyApp getInstance] getLeftMenuDic] valueForKey:home.id]];
    NSMutableArray* array = [NSMutableArray arrayWithObject:home];
    for(NewsTypeModel* obj in rsp.attype_list){
        obj.normalImg = [NSString stringWithFormat:@"%@_normal",[[[MyApp getInstance] getLeftMenuDic] valueForKey:obj.id]];
        obj.selectImg = [NSString stringWithFormat:@"%@_press",[[[MyApp getInstance] getLeftMenuDic] valueForKey:obj.id]];
        [array addObject:obj];
    }
    
    return array;
}

//初始化新闻列表
+(void)initNewsType:(NSMutableArray*)newTypeList{
    if(newTypeList==nil||newTypeList.count==0){
        return;
    }

    return;
}

//获取缓存的新闻列表
+(RspResultModel*)getCacheNewsList:(NSString*)flag{
    return (RspResultModel*)[DataCache getObject:flag];
}

//设置缓存新闻列表
+(void)setCacheNewsList:(NSString*)flag data:(RspResultModel*)data{
    [DataCache setObject:flag value:data];
}

//新增新闻搜藏
+(void)addNewsFav:(NewsInfoModel*)news{
    if([self isFav:news]){
        return;
    }
    
    RspResultModel* data = [self getFavNewsList];
    if(data==nil){
        data = [RspResultModel new];
        NSMutableArray * list = [[NSMutableArray alloc]init];
        data.article_list = list;
    }
    [data.article_list addObject:news];
    [DataCache setObject:KEY_NEWS_FAV value:data];
}

//取消搜藏
+(void)cancelNewsFav:(NewsInfoModel*)news{
    if([self isFav:news]){
       RspResultModel* data = [self getFavNewsList];
        for(NewsInfoModel* item in data.article_list){
            if([[NSString stringWithFormat:@"%@",item.id] isEqualToString:[NSString stringWithFormat:@"%@",news.id]]&&[item.arttype isEqualToString:news.arttype]){
                [data.article_list removeObject:item];
                break;
            }
        }
        [DataCache setObject:KEY_NEWS_FAV value:data];

    }
}

//获取新闻收藏列表
+(RspResultModel*)getFavNewsList{
    return (RspResultModel*)[DataCache getObject:KEY_NEWS_FAV];
}


+(BOOL)isFav:(NewsInfoModel*)news{
    RspResultModel* data = [self getFavNewsList];
    if(data==nil){
        return false;
    }
    
    for(NewsInfoModel* item in data.article_list){
        //NSLog(@"%@,%@",item.id,news.id);
        if([[NSString stringWithFormat:@"%@",item.id] isEqualToString:[NSString stringWithFormat:@"%@",news.id]]&&[item.arttype isEqualToString:news.arttype]){
            return true;
        }
    }
    return false;
    
    

}
@end
