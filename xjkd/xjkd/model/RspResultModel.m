//
//  RspResultModel.m
//  xjkd
//
//  Created by 聂宗波 on 14-12-8.
//  Copyright (c) 2014年 聂宗波. All rights reserved.
//

#import "RspResultModel.h"

@implementation RspResultModel

@synthesize retcode = _retcode;
@synthesize retmsg = _retmsg;
@synthesize user = _user;
@synthesize article_list = _article_list;
@synthesize headnew_list = _headnew_list;
@synthesize msg_list = _msg_list;
@synthesize photo = _photo;
@synthesize org_list = _org_list;
@synthesize msg = _msg;
@synthesize blmsg = _blmsg;
@synthesize comments = _comments;
@synthesize comment_list = _comment_list;
@synthesize baoliao_list = _baoliao_list;
@synthesize newsPicList = _newsPicList;
@synthesize attype_list = _attype_list;
@synthesize fqa_list = _fqa_list;
@synthesize pet_List = _pet_List;
@synthesize writerList = _writerList;
@synthesize specList = _specList;
@synthesize notice_list = _notice_list;
@synthesize org = _org;
@synthesize content = _content;
@synthesize loadflag = _loadflag;
@synthesize home_page_list = _home_page_list;
@synthesize appInfo = _appInfo;
@synthesize myreply_list = _myreply_list;
@synthesize numlist = _numlist;
@synthesize inveslist = _inveslist;
@synthesize c = _c;
@synthesize f = _f;
@synthesize l = _l;
@synthesize i = _i;


- (void)dealloc
{

}
+(Class)comment_list_class{
    return [CommentModel class];
}
+(Class)attype_list_class{
    return [NewsTypeModel class];
}
+(Class)home_page_list_class{
    return [NewsInfoModel class];
}
+(Class)article_list_class{
    return [NewsInfoModel class];
}
+(Class)headnew_list_class{
    return [NewsInfoModel class];
}
+(Class)i_class{
    return [SWIndexModel class];
}
- (void)encodeWithCoder:(NSCoder *)coder {
	[coder encodeObject:self.retcode forKey:@"retcode"];
	[coder encodeObject:self.retmsg forKey:@"retmsg"];
	[coder encodeObject:self.user forKey:@"user"];
	[coder encodeObject:self.article_list forKey:@"article_list"];
	[coder encodeObject:self.headnew_list forKey:@"headnew_list"];
	[coder encodeObject:self.msg_list forKey:@"msg_list"];
	[coder encodeObject:self.photo forKey:@"photo"];
	[coder encodeObject:self.org_list forKey:@"org_list"];
	[coder encodeObject:self.msg forKey:@"msg"];
	[coder encodeObject:self.blmsg forKey:@"blmsg"];
	[coder encodeObject:self.comments forKey:@"comments"];
	[coder encodeObject:self.comment_list forKey:@"comment_list"];
	[coder encodeObject:self.baoliao_list forKey:@"baoliao_list"];
	[coder encodeObject:self.newsPicList forKey:@"newsPicList"];
	[coder encodeObject:self.attype_list forKey:@"attype_list"];
	[coder encodeObject:self.fqa_list forKey:@"fqa_list"];
	[coder encodeObject:self.pet_List forKey:@"pet_List"];
	[coder encodeObject:self.writerList forKey:@"writerList"];
	[coder encodeObject:self.specList forKey:@"specList"];
	[coder encodeObject:self.notice_list forKey:@"notice_list"];
	[coder encodeObject:self.org forKey:@"org"];
	[coder encodeObject:self.content forKey:@"content"];
	[coder encodeObject:self.loadflag forKey:@"loadflag"];
	[coder encodeObject:self.home_page_list forKey:@"home_page_list"];
	[coder encodeObject:self.appInfo forKey:@"appInfo"];
	[coder encodeObject:self.myreply_list forKey:@"myreply_list"];
	[coder encodeObject:self.numlist forKey:@"numlist"];
	[coder encodeObject:self.inveslist forKey:@"inveslist"];
	[coder encodeObject:self.c forKey:@"c"];
	[coder encodeObject:self.f forKey:@"f"];
	[coder encodeObject:self.l forKey:@"l"];
	[coder encodeObject:self.i forKey:@"i"];
}

- (id)initWithCoder:(NSCoder *)coder {
	if ((self = [super init]) != nil) {
		self.retcode = [coder decodeObjectForKey:@"retcode"];
		self.retmsg = [coder decodeObjectForKey:@"retmsg"];
		self.user = [coder decodeObjectForKey:@"user"];
		self.article_list = [coder decodeObjectForKey:@"article_list"];
		self.headnew_list = [coder decodeObjectForKey:@"headnew_list"];
		self.msg_list = [coder decodeObjectForKey:@"msg_list"];
		self.photo = [coder decodeObjectForKey:@"photo"];
		self.org_list = [coder decodeObjectForKey:@"org_list"];
		self.msg = [coder decodeObjectForKey:@"msg"];
		self.blmsg = [coder decodeObjectForKey:@"blmsg"];
		self.comments = [coder decodeObjectForKey:@"comments"];
		self.comment_list = [coder decodeObjectForKey:@"comment_list"];
		self.baoliao_list = [coder decodeObjectForKey:@"baoliao_list"];
		self.newsPicList = [coder decodeObjectForKey:@"newsPicList"];
		self.attype_list = [coder decodeObjectForKey:@"attype_list"];
		self.fqa_list = [coder decodeObjectForKey:@"fqa_list"];
		self.pet_List = [coder decodeObjectForKey:@"pet_List"];
		self.writerList = [coder decodeObjectForKey:@"writerList"];
		self.specList = [coder decodeObjectForKey:@"specList"];
		self.notice_list = [coder decodeObjectForKey:@"notice_list"];
		self.org = [coder decodeObjectForKey:@"org"];
		self.content = [coder decodeObjectForKey:@"content"];
		self.loadflag = [coder decodeObjectForKey:@"loadflag"];
		self.home_page_list = [coder decodeObjectForKey:@"home_page_list"];
		self.appInfo = [coder decodeObjectForKey:@"appInfo"];
		self.myreply_list = [coder decodeObjectForKey:@"myreply_list"];
		self.numlist = [coder decodeObjectForKey:@"numlist"];
		self.inveslist = [coder decodeObjectForKey:@"inveslist"];
		self.c = [coder decodeObjectForKey:@"c"];
		self.f = [coder decodeObjectForKey:@"f"];
		self.l = [coder decodeObjectForKey:@"l"];
		self.i = [coder decodeObjectForKey:@"i"];
	}
	return self;
}

@end
