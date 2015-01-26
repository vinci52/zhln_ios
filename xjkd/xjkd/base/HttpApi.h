//
//  HttpApi.h
//  xjkd
//
//  Created by 聂宗波 on 15-1-8.
//  Copyright (c) 2015年 聂宗波. All rights reserved.
//
#define BASE_URL @"http://221.180.149.181/lndz/server/"


/**
 * app启动对接
 */
#define XINHUA_STARTUP_URL   @"http://xhpfm.open.zhongguowangshi.com/open/startad"

//api地址
#define URL_REGISTER   @"user/register"
#define URL_LOGIN   @"user/login"
#define URL_LOGIN_SMS   @"common/smscode"
#define URL_HOME_PAGE  @"art/home_page_list"
#define URL_MODIFY_PWD  @"user/modify_pwd"
#define URL_MODIFY_USERINFO  @"user/modifyinfo"
#define URL_MODIFY_UPLOADUSERPHOTO  @"user/uploadphoto"
#define URL_PWD_RESET  @"user/reset_pwd"
#define URL_ORG_LIST  @"org/list"
#define URL_ORG_DETAIL  @"org/detail"
#define URL_ORG_POLITICS_ADD  @"politics/add"
#define URL_ORG_POLITICS_LIST  @"politics/list"
#define URL_ORG_POLITICS_DETAIL  @"politics/detail"
#define URL_ORG_POLITICS_COMMENT  @"politics/comment"
#define URL_ORG_POLITICS_MYLIST  @"politics/mylist"
#define URL_ORG_POLITICS_MYREPLY  @"politics/myreply"
#define URL_ORG_POLITICS_ORG  @"politics/org"
#define URL_NETF_BAOLIAO  @"reveal/list"
#define URL_MY_BAOLIAO  @"reveal/mylist"
#define URL_MYREPLY_BAOLIAO  @"reveal/myreply"
#define URL_BAOLIAO_DETAIL  @"reveal/detail"
#define URL_BAOLIAO_PUB  @"reveal/add"
#define URL_BAOLIAO_COM  @"reveal/comment"
#define URL_ART_ARTICLE_LIST  @"art/article_list"
#define URL_ART_ARTICLE_VIDEOLIST  @"art/vidio_list"
#define URL_NEWS_CM_PUB  @"art/reply"
#define URL_NEWS_CM_LIST  @"comment/list"
#define URL_ATTYPE_LIST  @"art/attype_list"
#define URL_ART_SUBARTICLE_LIST  @"art/sub_article_list"
#define URL_ART_PIC_DETAIL  @"art/pic_detail"
#define URL_SYS_FEEDBACK  @"common/feedback"
#define URL_SYS_APPUPDATE  @"appupdate"
#define URL_MY_MYREPLY  @"comment/myreply"
#define URL_NEWS_PIC_LIST  @"art/pic_list"
#define URL_NEWS_PIC_DETAIL  @"art/pic_detail"
#define URL_ART_VIEW  @"art/view"//访问统计推送

#import <Foundation/Foundation.h>
#import "RspResultModel.h"
#import "MyApp.h"
#import "UserInfoModel.h"


@protocol HttpCallBackDelegate
- (void)httpCallback:(RspResultModel*)rsp requestCode:(NSString*)code;
@end
@interface HttpApi : NSObject
@property (nonatomic, assign) id<HttpCallBackDelegate> delegate;
//+(HttpApi*)getInstance;
-(void)testApi;

-(void)register: (NSString*)phone password:(NSString*)password username:(NSString*)username smscode:(NSString*)smscode;

-(void)login: (NSString*)phone password:(NSString*)password;

-(void)loginSmsCode: (NSString*)phone smstype:(NSString*)smstype;

-(void)homePage: (NSString*)loadflag;

-(void)modify_pwd: (NSString*)phone password:(NSString*)password newpassword:(NSString*)newpassword;

-(void)modifyinfo: (NSString*)username email:(NSString*)email;

-(void)uploadUserphoto: (NSString*)filename imageIS:(NSData*)imageIS;

-(void)findpwd: (NSString*)phone smscode:(NSString*)smscode password:(NSString*)password;

-(void)orgList;

-(void)orgDetail: (NSString*)orgId;

-(void)politicsAdd: (NSString*)orgid content:(NSString*)content picname1:(NSString*)picname1 pic1:(NSString*)pic1 picname2:(NSString*)picname2 pic2:(NSString*)pic2 picname3:(NSString*)picname3 pic3:(NSString*)pic3 audioname:(NSString*)audioname audio:(NSString*)audio vidioname:(NSString*)vidioname vidio:(NSString*)vidio;

-(void)politicsAddExt: (NSString*)mGov content:(NSString*)content picname1:(NSString*)picname1 pic1:(NSString*)pic1 picname2:(NSString*)picname2 pic2:(NSString*)pic2 picname3:(NSString*)picname3 pic3:(NSString*)pic3 audioname:(NSString*)audioname audio:(NSString*)audio vidioname:(NSString*)vidioname vidio:(NSString*)vidio;

-(void)politicsList: (NSString*)start size:(NSString*)size hot:(NSString*)hot;

-(void)politicsDetail: (NSString*)askId;

-(void)politicsComment: (NSString*)askId content:(NSString*)content;

-(void)politicsMyAsk: (NSString*)start size:(NSString*)size;

-(void)politicsMyComment: (NSString*)start size:(NSString*)size;

-(void)politicsOrgAnswer: (NSString*)start size:(NSString*)size orgid:(NSString*)orgid;

-(void)getNetfBliaoList: (NSString*)start size:(NSString*)size;

-(void)getBaoliaoDetail: (NSString*)id;

-(void)getMyBaoliaoList: (NSString*)sessionid start:(NSString*)start size:(NSString*)size;

-(void)getMyReplyBaoliaoList: (NSString*)start size:(NSString*)size;

-(void)pubBaoliaoInfo: (NSString*)content picname1:(NSString*)picname1 pic1:(NSString*)pic1 picname2:(NSString*)picname2 pic2:(NSString*)pic2 picname3:(NSString*)picname3 pic3:(NSString*)pic3 audioname:(NSString*)audioname audio:(NSString*)audio vidioname:(NSString*)vidioname vidio:(NSString*)vidio;

-(void)commentBaoliao: (NSString*)cm sessionid:(NSString*)sessionid;

-(void)getNewsList: (NSString*)attype subattype:(NSString*)subattype start:(NSString*)start size:(NSString*)size;

-(void)getNewsVideoList: (NSString*)start size:(NSString*)size;

-(void)pubNewComment: (NSString*)articleid replycontent:(NSString*)replycontent attype:(NSString*)attype;

-(void)commentsList: (NSString*)id type:(NSString*)type start:(NSString*)start size:(NSString*)size attype:(NSString*)attype;

-(void)artTypeList;
-(void)getSubNewsList: (NSString*)attype subattype:(NSString*)subattype start:(NSString*)start size:(NSString*)size pid:(NSString*)pid;

-(void)getPicArtDetail: (NSString*)attype id:(NSString*)id;

-(void)userFeedback: (NSString*)content;

-(void)sysAppupdate: (NSString*)nowversion;

-(void)getMyCmNewList: (NSString*)start size:(NSString*)size;

-(void)smartWeather: (NSString*)areaid type:(NSString*)type date:(NSString*)date;

-(void)newsPicDetail: (NSString*)id;

-(void)newsPicList: (NSString*)start size:(NSString*)size;

-(void)pushArtViewTimes: (NSString*)viewstr;
-(void)getSmartWeather: (NSString*)url;

@end
