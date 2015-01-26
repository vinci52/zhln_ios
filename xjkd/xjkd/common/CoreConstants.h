//
//  CoreConstants.h
//  xjkd
//
//  Created by 聂宗波 on 15-1-8.
//  Copyright (c) 2015年 聂宗波. All rights reserved.
//

#define ISDEBUG false
/**成功失败返回码*/
#define RETCODE_SUCC @"0"
#define RETCODE_ERR @"1"
/**
 * 每页item数目大小
 */
#define  PAGE_SIZE  20


/**smart weather**/
#define SW_APPID @"c408b1bc7145b9f8"//
#define SW_PKEY @"082850_SmartWeatherAPI_1b67cac"//
#define SW_URL @"http://open.weather.com.cn/data/?"//
#define SW_AREA @"101070603"
#define SMS_TYPE_0 @"0"//注册验证码
#define SMS_TYPE_1 @"1"//重置密码

#define ACTIVITY_COSE @"1"//关闭activity
#define ACTIVITY_RETTRUN @"2"//返回

/**通知类型-系统通知**/
#define NOTIFY_TYPE_SYS @"0"
/**通知类型-新闻通知**/
#define NOTIFY_TYPE_NEWS @"1"

//请求类型

/**
 * 评论列表
 */
#define REQUEST_COMMENT @"REQUEST_COMMENT"
/**
 * 信件列表
 */
#define REQUEST_LETTER @"REQUEST_LETTER"
/**
 * 我的-信件列表
 */
#define REQUEST_MY_LETTER @"REQUEST_MY_LETTER"

/**
 * 我的-休闲旅游
 */
#define REQUEST_ART_27 @"REQUEST_ART_27"


/**
 * 我的-评论
 */
#define REQUEST_MY_COMMENT @"REQUEST_MY_COMMENT"

/**
 * 我的-通知
 */
#define REQUEST_NOTICE @"REQUEST_NOTICE"


/** 缓存*/

#define CACHE_USER @"userinfo"

#define CACHE_ACCTION @"attenction"//关注
#define CACHE_ASK_GOVLIST @"ask_govlist"//问政机构列表
#define CACHE_ASK_ASKLIST @"ask_asklist"//问政列表
#define CACHE_ASK_MYASK @"CACHE_ASK_MYASK"//我的问政列表
#define CACHE_ASK_MYANSWER @"CACHE_ASK_MYANSWER"//我的问政回答列表
#define CACHE_ASK_ORGANSWER @"CACHE_ASK_ORGANSWER"//机构回答列表
#define CACHE_NEWS_NEWSLIST @"CACHE_NEWS_NEWSLIST"//新闻列表
#define CACHE_NEWS_ARTTYPE @"CACHE_NEWS_ARTTYPE"//新闻大类列表
#define CACHE_NEWS_COMMENTLIST @"cache_news_commentlist"//新闻评论列表
#define CACHE_BAOLIAO_COMMENTLIST @"cache_baoliao_commentlist"//爆料评论列表
#define CACHE_BAOLIAO_NETFLIST @"cache_baoliao_netflist"//网友爆料评论列表
#define CACHE_BAOLIAO_MYLIST @"cache_baoliao_mylist"//我的爆料评论列表
#define CACHE_BAOLIAO_MYREPLY @"cache_baoliao_myreply"//我的爆料评论列表
#define CACHE_BAOLIAO_DETAIL @"cache_baoliao_detail"//爆料详情
#define CACHE_MY_ASKGOV @"cache_my_askgov"//我的-问政
#define CACHE_HOME_LIST @"CACHE_HOME_LIST"//首页
#define CACHE_NOTIFY_LIST @"CACHE_NOTIFY_LIST"//通知
#define CACHE_MYREPLY_LIST @"CACHE_MYREPLY_LIST"//我评论的新闻
#define CACHE_AREA @"CACHE_AREA"//地区缓存
#define CACHE_ART_VIEW @"CACHE_ART_VIEW"//图文访问此时缓存


/**
 * 子栏目类别
 * 0图文  1图片 2视频 3外部WEB  4问政 5报料 6调查，7号码通  9暂时未开通栏目
 */
#define NEWS_SUBTYPE_WORD @"0"//新闻类别--图文
#define NEWS_SUBTYPE_PIC @"1"//新闻类别--图片
#define NEWS_SUBTYPE_VIDEO @"2"//新闻类别--视频
#define NEWS_SUBTYPE_WAP @"3"//外部web
#define NEWS_SUBTYPE_WENZHENG @"4"//问政
#define NEWS_SUBTYPE_BAOLIAO @"5"//报料
#define NEWS_SUBTYPE_DIAOCHA @"6"//调查
#define NEWS_SUBTYPE_NUMBER @"7"//号码通
#define NEWS_SUBTYPE_DEVELOPPING @"9"//开发中
#define NEWS_SUBTYPE_TTIP @"trip"//新闻类别--旅游联盟
/**登录视图传递参数的key*/
#define PARAM_BACK @"back"
#define PARAM_CODE @"code"


#define NEWS_TYPE_NEWS @"1"//新闻类别--新闻
#define NEWS_TYPE_GOV @"2"//新闻类别--政务

#define INF_VERSION_CODE @"11"

/**activity 跳转传递参数时*/
#define PARAMS_NEWS @"news"
#define PARAMS_TYPE @"type"

#define PARAMS_MSG @"params_msg"
#define PARAMS_MSG_ID @"msg_id"
#define URL_PARAM @"url"

/**
 * 用于判断文章是否需要评论还是仅仅提供收藏
 * 0用于表示需要评论+收藏
 */
#define NEWS_COMMENT @"1"
/**
 * 用于判断文章是否需要评论还是仅仅提供收藏
 * 1 用于收藏
 */
#define NEWS_COLLECTION @"0"


/**
 * 辽宁政协 不需要忘记密码和注册的标识
 */
#define APP_LNZX @"lnzx"

/**
 * 鹿鸣西丰
 */
#define APP_LMXF @"zhlmxf"

/**
 * 请求吗
 */
#define  REQ_CODE_1000 1000

/**
 * 访问统计action
 */
#define ACTION_OCLICK_TIMES @"com.artc.oclick.times"

/**
 * 图文累计访问次数为最大值时，触发上送请求
 */
#define  MAXREQ_TIMES 10
/**
 * 每次启动app的时候上送
 */
#define PUSH_TYPE @"APP_STARTUP"
#import <Foundation/Foundation.h>
@interface CoreConstants : NSObject

@end
