//
//  RspResultModel.h
//  xjkd
//
//  Created by 聂宗波 on 14-12-8.
//  Copyright (c) 2014年 聂宗波. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserInfoModel.h"
#import "AskMsgModel.h"
#import "BaoLiaoInfoModel.h"
#import "GovmentInfoModel.h"
#import "SWAreaModel.h"
#import "SWFrontcastModel.h"
#import "SWObserveModel.h"
#import "AppInfoModel.h"
#import "Jastor.h"
#import "NewsTypeModel.h"
#import "NewsInfoModel.h"
#import "SWIndexModel.h"
#import "CommentModel.h"



@interface RspResultModel : Jastor
{	NSString *_retcode;
	NSString *_retmsg;
	UserInfoModel* _user;
	NSMutableArray* _article_list;
	NSMutableArray* _headnew_list;
	NSMutableArray* _msg_list;
	NSString *_photo;
	NSMutableArray* _org_list;
	AskMsgModel* _msg;
	BaoLiaoInfoModel* _blmsg;
	NSMutableArray* _comments;
	NSMutableArray* _comment_list;
	NSMutableArray* _baoliao_list;
	NSMutableArray* _newsPicList;
	NSMutableArray* _attype_list;
	NSMutableArray* _fqa_list;
	NSMutableArray* _pet_List;
	NSMutableArray* _writerList;
	NSMutableArray* _specList;
	NSMutableArray* _notice_list;
	GovmentInfoModel* _org;
	NSString *_content;
	NSString *_loadflag;
	NSMutableArray* _home_page_list;
	AppInfoModel* _appInfo;
	NSMutableArray* _myreply_list;
	NSMutableArray* _numlist;
	NSMutableArray* _inveslist;
	SWAreaModel* _c;
	SWFrontcastModel* _f;
	SWObserveModel* _l;
	NSMutableArray* _i;
}

@property (nonatomic, retain) NSString *retcode;
@property (nonatomic, retain) NSString *retmsg;
@property (nonatomic, retain) UserInfoModel *user;
@property (nonatomic, retain) NSMutableArray *article_list;
@property (nonatomic, retain) NSMutableArray *headnew_list;
@property (nonatomic, retain) NSMutableArray *msg_list;
@property (nonatomic, retain) NSString *photo;
@property (nonatomic, retain) NSMutableArray *org_list;
@property (nonatomic, retain) AskMsgModel *msg;
@property (nonatomic, retain) BaoLiaoInfoModel *blmsg;
@property (nonatomic, retain) NSMutableArray *comments;
@property (nonatomic, retain) NSMutableArray *comment_list;
@property (nonatomic, retain) NSMutableArray *baoliao_list;
@property (nonatomic, retain) NSMutableArray *newsPicList;
@property (nonatomic, retain) NSMutableArray *attype_list;
@property (nonatomic, retain) NSMutableArray *fqa_list;
@property (nonatomic, retain) NSMutableArray *pet_List;
@property (nonatomic, retain) NSMutableArray *writerList;
@property (nonatomic, retain) NSMutableArray *specList;
@property (nonatomic, retain) NSMutableArray *notice_list;
@property (nonatomic, retain) GovmentInfoModel *org;
@property (nonatomic, retain) NSString *content;
@property (nonatomic, retain) NSString *loadflag;
@property (nonatomic, retain) NSMutableArray *home_page_list;
@property (nonatomic, retain) AppInfoModel *appInfo;
@property (nonatomic, retain) NSMutableArray *myreply_list;
@property (nonatomic, retain) NSMutableArray *numlist;
@property (nonatomic, retain) NSMutableArray *inveslist;
@property (nonatomic, retain) SWAreaModel *c;
@property (nonatomic, retain) SWFrontcastModel *f;
@property (nonatomic, retain) SWObserveModel *l;
@property (nonatomic, retain) NSMutableArray *i;

+(Class)comment_list_class;
+(Class)attype_list_class;
+(Class)home_page_list_class;
+(Class)article_list_class;
+(Class)headnew_list_class;
+(Class)i_class;

@end
