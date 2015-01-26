//
//  HttpApi.m
//  xjkd
//
//  Created by 聂宗波 on 15-1-8.
//  Copyright (c) 2015年 聂宗波. All rights reserved.
//

#import "HttpApi.h"
#import "AFHTTPRequestOperationManager.h"
#import "RspResultModel.h"

static HttpApi *_myself;
@implementation HttpApi

@synthesize delegate=_delegate;
//+ (HttpApi*)getInstance
//{
//    
//    if(_myself==nil){
//        _myself =[HttpApi new];
//        
//    }
//    //_myself =[HttpApi new];
//    return _myself;
//}
-(void)testApi{
    
    NSDictionary *parameters = @{@"foo": @"bar"};
    NSString* url = @"http://example.com/resources.json";
    [self doRequest:url params:parameters requestCode:@""];
}
-(void)login:(NSString*)phone password:(NSString*)password{
    NSMutableDictionary *parameters = [self buildBaseParam];
    [parameters setValue:phone forKey:@"phone"];
    [parameters setValue:password forKey:@"password"];
    
    [self doRequest:[self fullUrl:URL_LOGIN] params:parameters requestCode:@"login"];
}
-(void)register: (NSString*)phone password:(NSString*)password username:(NSString*)username smscode:(NSString*)smscode{
    NSMutableDictionary *parameters = [self buildBaseParam];
    [parameters setValue:phone forKey:@"phone"];
    [parameters setValue:password forKey:@"password"];
    [parameters setValue:username forKey:@"username"];
    [parameters setValue:smscode forKey:@"smscode"];
    [self doRequest:[self fullUrl:URL_LOGIN] params:parameters 			requestCode:@"register"];
}
/**
-(void)login: (NSString*)phone password:(NSString*)password{
    NSMutableDictionary *parameters = [self buildBaseParam];
    [parameters setValue:phone forKey:@"phone"];
    [parameters setValue:password forKey:@"password"];
    [self doRequest:[self fullUrl:URL_LOGIN] params:parameters 			requestCode:@"login"];
}
**/
-(void)loginSmsCode: (NSString*)phone smstype:(NSString*)smstype{
    NSMutableDictionary *parameters = [self buildBaseParam];
    [parameters setValue:phone forKey:@"phone"];
    [parameters setValue:smstype forKey:@"smstype"];
    [self doRequest:[self fullUrl:URL_LOGIN_SMS] params:parameters 			requestCode:@"loginSmsCode"];
}

-(void)homePage: (NSString*)loadflag{
    NSMutableDictionary *parameters = [self buildBaseParam];
    [parameters setValue:loadflag forKey:@"loadflag"];
    [self doRequest:[self fullUrl:URL_HOME_PAGE] params:parameters 			requestCode:@"homePage"];
}

-(void)modify_pwd: (NSString*)phone password:(NSString*)password newpassword:(NSString*)newpassword{
    NSMutableDictionary *parameters = [self buildBaseParam];
    [parameters setValue:phone forKey:@"phone"];
    [parameters setValue:password forKey:@"password"];
    [parameters setValue:newpassword forKey:@"newpassword"];
    [self doRequest:[self fullUrl:URL_MODIFY_PWD] params:parameters 			requestCode:@"modify_pwd"];
}

-(void)modifyinfo: (NSString*)username email:(NSString*)email{
    NSMutableDictionary *parameters = [self buildBaseParam];
    [parameters setValue:username forKey:@"username"];
    [parameters setValue:email forKey:@"email"];
    [self doRequest:[self fullUrl:URL_MODIFY_USERINFO] params:parameters 			requestCode:@"modifyinfo"];
}

-(void)uploadUserphoto: (NSString*)filename imageIS:(NSData*)imageIS{
    NSMutableDictionary *parameters = [self buildBaseParam];
    [parameters setValue:filename forKey:@"filename"];
    //[parameters setValue:imageIS forKey:@"imageIS"];
    //[self doRequest:[self fullUrl:URL_MODIFY_UPLOADUSERPHOTO] params:parameters 			requestCode:@"uploadUserphoto"];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //NSURL *filePath = [NSURL fileURLWithPath:@"file://path/to/image.png"];
    [manager POST:[self fullUrl:URL_MODIFY_UPLOADUSERPHOTO] parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        //[formData appendPartWithFileURL:filePath name:@"imageIS" error:nil];
        [formData appendPartWithFileData:imageIS name:@"file" fileName:filename mimeType:@"image/jpg"];
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Success: %@", responseObject);
        @try
        {
            RspResultModel * rsp = [[RspResultModel alloc] initWithDictionary:responseObject];
            if(rsp==nil){
                rsp = [[RspResultModel alloc]init];
                rsp.retcode = @"1";
                rsp.retmsg = @"网络不给力哦~~";
            }
            if(self.delegate){
                [self.delegate httpCallback:rsp requestCode:@"uploadUserphoto"];
            }
            
        }@catch (NSException * e) {
            NSLog(@"Exception: %@", e);
            RspResultModel *rsp = [[RspResultModel alloc]init];
            rsp.retcode = @"1";
            rsp.retmsg = @"网络不给力哦~~";
            if(self.delegate){
                [self.delegate httpCallback:rsp requestCode:@"uploadUserphoto"];
            }
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        RspResultModel *rsp = [[RspResultModel alloc]init];
        rsp.retcode = @"1";
        rsp.retmsg = @"网络不给力哦~~";
        if(self.delegate){
            [self.delegate httpCallback:rsp requestCode:@"uploadUserphoto"];
        }

    }];

}

-(void)findpwd: (NSString*)phone smscode:(NSString*)smscode password:(NSString*)password{
    NSMutableDictionary *parameters = [self buildBaseParam];
    [parameters setValue:phone forKey:@"phone"];
    [parameters setValue:smscode forKey:@"smscode"];
    [parameters setValue:password forKey:@"password"];
    [self doRequest:[self fullUrl:URL_PWD_RESET] params:parameters 			requestCode:@"findpwd"];
}

-(void)orgList{
    NSMutableDictionary *parameters = [self buildBaseParam];
    [self doRequest:[self fullUrl:URL_LOGIN] params:parameters 			requestCode:@"orgList"];
}

-(void)orgDetail: (NSString*)orgId{
    NSMutableDictionary *parameters = [self buildBaseParam];
    [parameters setValue:orgId forKey:@"orgId"];
    [self doRequest:[self fullUrl:URL_LOGIN] params:parameters 			requestCode:@"orgDetail"];
}

-(void)politicsAdd: (NSString*)orgid content:(NSString*)content picname1:(NSString*)picname1 pic1:(NSString*)pic1 picname2:(NSString*)picname2 pic2:(NSString*)pic2 picname3:(NSString*)picname3 pic3:(NSString*)pic3 audioname:(NSString*)audioname audio:(NSString*)audio vidioname:(NSString*)vidioname vidio:(NSString*)vidio{
    NSMutableDictionary *parameters = [self buildBaseParam];
    [parameters setValue:orgid forKey:@"orgid"];
    [parameters setValue:content forKey:@"content"];
    [parameters setValue:picname1 forKey:@"picname1"];
    [parameters setValue:pic1 forKey:@"pic1"];
    [parameters setValue:picname2 forKey:@"picname2"];
    [parameters setValue:pic2 forKey:@"pic2"];
    [parameters setValue:picname3 forKey:@"picname3"];
    [parameters setValue:pic3 forKey:@"pic3"];
    [parameters setValue:audioname forKey:@"audioname"];
    [parameters setValue:audio forKey:@"audio"];
    [parameters setValue:vidioname forKey:@"vidioname"];
    [parameters setValue:vidio forKey:@"vidio"];
    [self doRequest:[self fullUrl:URL_LOGIN] params:parameters 			requestCode:@"politicsAdd"];
}

-(void)politicsAddExt: (NSString*)mGov content:(NSString*)content picname1:(NSString*)picname1 pic1:(NSString*)pic1 picname2:(NSString*)picname2 pic2:(NSString*)pic2 picname3:(NSString*)picname3 pic3:(NSString*)pic3 audioname:(NSString*)audioname audio:(NSString*)audio vidioname:(NSString*)vidioname vidio:(NSString*)vidio{
    NSMutableDictionary *parameters = [self buildBaseParam];
    [parameters setValue:mGov forKey:@"AskMsgModel mGov"];
    [parameters setValue:content forKey:@"content"];
    [parameters setValue:picname1 forKey:@"picname1"];
    [parameters setValue:pic1 forKey:@"pic1"];
    [parameters setValue:picname2 forKey:@"picname2"];
    [parameters setValue:pic2 forKey:@"pic2"];
    [parameters setValue:picname3 forKey:@"picname3"];
    [parameters setValue:pic3 forKey:@"pic3"];
    [parameters setValue:audioname forKey:@"audioname"];
    [parameters setValue:audio forKey:@"audio"];
    [parameters setValue:vidioname forKey:@"vidioname"];
    [parameters setValue:vidio forKey:@"vidio"];
    [self doRequest:[self fullUrl:URL_LOGIN] params:parameters 			requestCode:@"politicsAddExt"];
}

-(void)politicsList: (NSString*)start size:(NSString*)size hot:(NSString*)hot{
    NSMutableDictionary *parameters = [self buildBaseParam];
    [parameters setValue:start forKey:@"start"];
    [parameters setValue:size forKey:@"size"];
    [parameters setValue:hot forKey:@"hot"];
    [self doRequest:[self fullUrl:URL_LOGIN] params:parameters 			requestCode:@"politicsList"];
}

-(void)politicsDetail: (NSString*)askId{
    NSMutableDictionary *parameters = [self buildBaseParam];
    [parameters setValue:askId forKey:@"askId"];
    [self doRequest:[self fullUrl:URL_LOGIN] params:parameters 			requestCode:@"politicsDetail"];
}

-(void)politicsComment: (NSString*)askId content:(NSString*)content{
    NSMutableDictionary *parameters = [self buildBaseParam];
    [parameters setValue:askId forKey:@"askId"];
    [parameters setValue:content forKey:@"content"];
    [self doRequest:[self fullUrl:URL_LOGIN] params:parameters 			requestCode:@"politicsComment"];
}

-(void)politicsMyAsk: (NSString*)start size:(NSString*)size{
    NSMutableDictionary *parameters = [self buildBaseParam];
    [parameters setValue:start forKey:@"start"];
    [parameters setValue:size forKey:@"size"];
    [self doRequest:[self fullUrl:URL_LOGIN] params:parameters 			requestCode:@"politicsMyAsk"];
}

-(void)politicsMyComment: (NSString*)start size:(NSString*)size{
    NSMutableDictionary *parameters = [self buildBaseParam];
    [parameters setValue:start forKey:@"start"];
    [parameters setValue:size forKey:@"size"];
    [self doRequest:[self fullUrl:URL_LOGIN] params:parameters 			requestCode:@"politicsMyComment"];
}

-(void)politicsOrgAnswer: (NSString*)start size:(NSString*)size orgid:(NSString*)orgid{
    NSMutableDictionary *parameters = [self buildBaseParam];
    [parameters setValue:start forKey:@"start"];
    [parameters setValue:size forKey:@"size"];
    [parameters setValue:orgid forKey:@"orgid"];
    [self doRequest:[self fullUrl:URL_LOGIN] params:parameters 			requestCode:@"politicsOrgAnswer"];
}

-(void)getNetfBliaoList: (NSString*)start size:(NSString*)size{
    NSMutableDictionary *parameters = [self buildBaseParam];
    [parameters setValue:start forKey:@"start"];
    [parameters setValue:size forKey:@"size"];
    [self doRequest:[self fullUrl:URL_LOGIN] params:parameters 			requestCode:@"getNetfBliaoList"];
}

-(void)getBaoliaoDetail: (NSString*)id{
    NSMutableDictionary *parameters = [self buildBaseParam];
    [parameters setValue:id forKey:@"id"];
    [self doRequest:[self fullUrl:URL_LOGIN] params:parameters 			requestCode:@"getBaoliaoDetail"];
}

-(void)getMyBaoliaoList: (NSString*)sessionid start:(NSString*)start size:(NSString*)size{
    NSMutableDictionary *parameters = [self buildBaseParam];
    [parameters setValue:sessionid forKey:@"sessionid"];
    [parameters setValue:start forKey:@"start"];
    [parameters setValue:size forKey:@"size"];
    [self doRequest:[self fullUrl:URL_LOGIN] params:parameters 			requestCode:@"getMyBaoliaoList"];
}

-(void)getMyReplyBaoliaoList: (NSString*)start size:(NSString*)size{
    NSMutableDictionary *parameters = [self buildBaseParam];
    [parameters setValue:start forKey:@"start"];
    [parameters setValue:size forKey:@"size"];
    [self doRequest:[self fullUrl:URL_LOGIN] params:parameters 			requestCode:@"getMyReplyBaoliaoList"];
}

-(void)pubBaoliaoInfo: (NSString*)content picname1:(NSString*)picname1 pic1:(NSString*)pic1 picname2:(NSString*)picname2 pic2:(NSString*)pic2 picname3:(NSString*)picname3 pic3:(NSString*)pic3 audioname:(NSString*)audioname audio:(NSString*)audio vidioname:(NSString*)vidioname vidio:(NSString*)vidio{
    NSMutableDictionary *parameters = [self buildBaseParam];
    [parameters setValue:content forKey:@"content"];
    [parameters setValue:picname1 forKey:@"picname1"];
    [parameters setValue:pic1 forKey:@"pic1"];
    [parameters setValue:picname2 forKey:@"picname2"];
    [parameters setValue:pic2 forKey:@"pic2"];
    [parameters setValue:picname3 forKey:@"picname3"];
    [parameters setValue:pic3 forKey:@"pic3"];
    [parameters setValue:audioname forKey:@"audioname"];
    [parameters setValue:audio forKey:@"audio"];
    [parameters setValue:vidioname forKey:@"vidioname"];
    [parameters setValue:vidio forKey:@"vidio"];
    [self doRequest:[self fullUrl:URL_LOGIN] params:parameters 			requestCode:@"pubBaoliaoInfo"];
}

-(void)commentBaoliao: (NSString*)cm sessionid:(NSString*)sessionid{
    NSMutableDictionary *parameters = [self buildBaseParam];
    [parameters setValue:cm forKey:@"CommentModel cm"];
    [parameters setValue:sessionid forKey:@"sessionid"];
    [self doRequest:[self fullUrl:URL_LOGIN] params:parameters 			requestCode:@"commentBaoliao"];
}

-(void)getNewsList: (NSString*)attype subattype:(NSString*)subattype start:(NSString*)start size:(NSString*)size{
    NSMutableDictionary *parameters = [self buildBaseParam];
    [parameters setValue:attype forKey:@"attype"];
    [parameters setValue:subattype forKey:@"subattype"];
    [parameters setValue:start forKey:@"start"];
    [parameters setValue:size forKey:@"size"];
    [self doRequest:[self fullUrl:URL_ART_ARTICLE_LIST] params:parameters 			requestCode:@"getNewsList"];
}

-(void)getNewsVideoList: (NSString*)start size:(NSString*)size{
    NSMutableDictionary *parameters = [self buildBaseParam];
    [parameters setValue:start forKey:@"start"];
    [parameters setValue:size forKey:@"size"];
    [self doRequest:[self fullUrl:URL_LOGIN] params:parameters 			requestCode:@"getNewsVideoList"];
}

-(void)pubNewComment: (NSString*)articleid replycontent:(NSString*)replycontent attype:(NSString*)attype{
    NSMutableDictionary *parameters = [self buildBaseParam];
    [parameters setValue:articleid forKey:@"articleid"];
    [parameters setValue:replycontent forKey:@"replycontent"];
    [parameters setValue:attype forKey:@"attype"];
    [self doRequest:[self fullUrl:URL_NEWS_CM_PUB] params:parameters 			requestCode:@"pubNewComment"];
}

-(void)commentsList: (NSString*)idstr type:(NSString*)type start:(NSString*)start size:(NSString*)size attype:(NSString*)attype{
    NSMutableDictionary *parameters = [self buildBaseParam];
    [parameters setValue:idstr forKey:@"id"];
    [parameters setValue:type forKey:@"type"];
    [parameters setValue:start forKey:@"start"];
    [parameters setValue:size forKey:@"size"];
    [parameters setValue:attype forKey:@"attype"];
    [self doRequest:[self fullUrl:URL_NEWS_CM_LIST] params:parameters 			requestCode:@"commentsList"];
}

-(void)artTypeList{
    NSMutableDictionary *parameters = [self buildBaseParam];
    [self doRequest:[self fullUrl:URL_ATTYPE_LIST] params:parameters 			requestCode:@"artTypeList"];
}

-(void)getSubNewsList: (NSString*)attype subattype:(NSString*)subattype start:(NSString*)start size:(NSString*)size pid:(NSString*)pid{
    NSMutableDictionary *parameters = [self buildBaseParam];
    [parameters setValue:attype forKey:@"attype"];
    [parameters setValue:subattype forKey:@"subattype"];
    [parameters setValue:start forKey:@"start"];
    [parameters setValue:size forKey:@"size"];
    [parameters setValue:pid forKey:@"pid"];
    [self doRequest:[self fullUrl:URL_ART_SUBARTICLE_LIST] params:parameters 			requestCode:@"getSubNewsList"];
}

-(void)getPicArtDetail: (NSString*)attype id:(NSString*)id{
    NSMutableDictionary *parameters = [self buildBaseParam];
    [parameters setValue:attype forKey:@"attype"];
    [parameters setValue:id forKey:@"id"];
    [self doRequest:[self fullUrl:URL_LOGIN] params:parameters 			requestCode:@"getPicArtDetail"];
}

-(void)userFeedback: (NSString*)content{
    NSMutableDictionary *parameters = [self buildBaseParam];
    [parameters setValue:content forKey:@"content"];
    [self doRequest:[self fullUrl:URL_SYS_FEEDBACK] params:parameters 			requestCode:@"userFeedback"];
}

-(void)sysAppupdate: (NSString*)nowversion{
    NSMutableDictionary *parameters = [self buildBaseParam];
    [parameters setValue:nowversion forKey:@"nowversion"];
    [self doRequest:[self fullUrl:URL_LOGIN] params:parameters 			requestCode:@"sysAppupdate"];
}

-(void)getMyCmNewList: (NSString*)start size:(NSString*)size{
    NSMutableDictionary *parameters = [self buildBaseParam];
    [parameters setValue:start forKey:@"start"];
    [parameters setValue:size forKey:@"size"];
    [self doRequest:[self fullUrl:URL_LOGIN] params:parameters 			requestCode:@"getMyCmNewList"];
}

-(void)smartWeather: (NSString*)areaid type:(NSString*)type date:(NSString*)date{
    NSMutableDictionary *parameters = [self buildBaseParam];
    [parameters setValue:areaid forKey:@"areaid"];
    [parameters setValue:type forKey:@"type"];
    [parameters setValue:date forKey:@"date"];
    [self doRequest:[self fullUrl:URL_LOGIN] params:parameters 			requestCode:@"smartWeather"];
}

-(void)newsPicDetail: (NSString*)id{
    NSMutableDictionary *parameters = [self buildBaseParam];
    [parameters setValue:id forKey:@"id"];
    [self doRequest:[self fullUrl:URL_LOGIN] params:parameters 			requestCode:@"newsPicDetail"];
}

-(void)newsPicList: (NSString*)start size:(NSString*)size{
    NSMutableDictionary *parameters = [self buildBaseParam];
    [parameters setValue:start forKey:@"start"];
    [parameters setValue:size forKey:@"size"];
    [self doRequest:[self fullUrl:URL_LOGIN] params:parameters 			requestCode:@"newsPicList"];
}

-(void)pushArtViewTimes: (NSString*)viewstr{
    NSMutableDictionary *parameters = [self buildBaseParam];
    [parameters setValue:viewstr forKey:@"viewstr"];
    [self doRequest:[self fullUrl:URL_LOGIN] params:parameters 			requestCode:@"pushArtViewTimes"];
}

-(void)getSmartWeather: (NSString*)url{
    [self doSweatherRequest:url params:nil
        requestCode:@"getSmartWeather"];
}

-(void)doRequest:(NSString*)url params:(NSDictionary*)parameters requestCode:(NSString*)code{
    NSLog(@"请求:%@",parameters);
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    //manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager POST:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"请求返回: %@", responseObject);
        /**
        NSString *result = [[NSString alloc] initWithData:responseObject  encoding:NSUTF8StringEncoding];
        
        NSLog(@"JSON----: %@", result);
        **/
        @try
        {
            RspResultModel * rsp = [[RspResultModel alloc] initWithDictionary:responseObject];
            if(rsp==nil){
                rsp = [[RspResultModel alloc]init];
                rsp.retcode = @"1";
                rsp.retmsg = @"网络不给力哦~~";
            }
            if(self.delegate){
                [self.delegate httpCallback:rsp requestCode:code];
            }
            
        }@catch (NSException * e) {
            NSLog(@"Exception: %@", e);
            RspResultModel *rsp = [[RspResultModel alloc]init];
            rsp.retcode = @"1";
            rsp.retmsg = @"网络不给力哦~~";
            if(self.delegate){
                [self.delegate httpCallback:rsp requestCode:code];
            }
        }
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        RspResultModel *rsp = [[RspResultModel alloc]init];
        rsp.retcode = @"1";
        rsp.retmsg = @"网络不给力哦~~";
        //[self.delegate];
        [self.delegate httpCallback:rsp requestCode:code];
    }];
}

-(void)doSweatherRequest:(NSString*)url params:(NSDictionary*)parameters requestCode:(NSString*)code{
    NSLog(@"请求:%@",parameters);
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager POST:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //NSLog(@"请求返回: %@", responseObject);
                NSString *result = [[NSString alloc] initWithData:responseObject  encoding:NSUTF8StringEncoding];
         
         NSLog(@"JSON: %@", result);
        
        @try
        {
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject
                                                                options:NSUTF8StringEncoding
                                                                  error:nil];
            NSLog(@"请求返回: dic%@", dic);

            RspResultModel * rsp = [[RspResultModel alloc] initWithDictionary:dic];
            if(rsp==nil){
                rsp = [[RspResultModel alloc]init];
                rsp.retcode = @"1";
                rsp.retmsg = @"网络不给力哦~~";
            }
            if(self.delegate){
                rsp.retcode = @"0";
                [self.delegate httpCallback:rsp requestCode:code];
            }
            
        }@catch (NSException * e) {
            NSLog(@"Exception: %@", e);
            RspResultModel *rsp = [[RspResultModel alloc]init];
            rsp.retcode = @"1";
            rsp.retmsg = @"网络不给力哦~~";
            if(self.delegate){
                [self.delegate httpCallback:rsp requestCode:code];
            }
        }
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        RspResultModel *rsp = [[RspResultModel alloc]init];
        rsp.retcode = @"1";
        rsp.retmsg = @"网络不给力哦~~";
        //[self.delegate];
        [self.delegate httpCallback:rsp requestCode:code];
    }];
}

-(NSMutableDictionary*)buildBaseParam{
    UserInfoModel* user = [[MyApp getInstance]getUserInfo];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"",@"user_id", nil];
    [dic setValue:@"" forKey:@"user_id"];
    [dic setValue:@"11" forKey:@"version"];
    [dic setValue:@"" forKey:@"sessionid"];
    [dic setValue:@"" forKey:@"sign"];
    [dic setValue:@"1" forKey:@"systype"];
    [dic setValue:@"2" forKey:@"sysid"];
    if(user){
        [dic setValue:user.phone forKey:@"user_id"];
        [dic setValue:user.sessionid forKey:@"sessionid"];
    }
    return  dic;
}

-(NSString*)fullUrl:(NSString*)url{
    return [NSString stringWithFormat:@"%@%@",BASE_URL,url];
}
@end
