//
//  BaoLiaoInfoModel.m
//  xjkd
//
//  Created by 聂宗波 on 14-12-8.
//  Copyright (c) 2014年 聂宗波. All rights reserved.
//

#import "BaoLiaoInfoModel.h"

@implementation BaoLiaoInfoModel

@synthesize id = _id;
@synthesize userid = _userid;
@synthesize username = _username;
@synthesize userphoto = _userphoto;
@synthesize createtime = _createtime;
@synthesize content = _content;
@synthesize photo = _photo;
@synthesize audio = _audio;
@synthesize video = _video;
@synthesize recontent = _recontent;
@synthesize replytime = _replytime;
@synthesize orgid = _orgid;
@synthesize orgname = _orgname;
@synthesize orgphoto = _orgphoto;
@synthesize viewcount = _viewcount;
@synthesize replycount = _replycount;


- (void)dealloc
{

}
- (void)encodeWithCoder:(NSCoder *)coder {
	[coder encodeObject:self.id forKey:@"id"];
	[coder encodeObject:self.userid forKey:@"userid"];
	[coder encodeObject:self.username forKey:@"username"];
	[coder encodeObject:self.userphoto forKey:@"userphoto"];
	[coder encodeObject:self.createtime forKey:@"createtime"];
	[coder encodeObject:self.content forKey:@"content"];
	[coder encodeObject:self.photo forKey:@"photo"];
	[coder encodeObject:self.audio forKey:@"audio"];
	[coder encodeObject:self.video forKey:@"video"];
	[coder encodeObject:self.recontent forKey:@"recontent"];
	[coder encodeObject:self.replytime forKey:@"replytime"];
	[coder encodeObject:self.orgid forKey:@"orgid"];
	[coder encodeObject:self.orgname forKey:@"orgname"];
	[coder encodeObject:self.orgphoto forKey:@"orgphoto"];
	[coder encodeObject:self.viewcount forKey:@"viewcount"];
	[coder encodeObject:self.replycount forKey:@"replycount"];
}

- (id)initWithCoder:(NSCoder *)coder {
	if ((self = [super init]) != nil) {
		self.id = [coder decodeObjectForKey:@"id"];
		self.userid = [coder decodeObjectForKey:@"userid"];
		self.username = [coder decodeObjectForKey:@"username"];
		self.userphoto = [coder decodeObjectForKey:@"userphoto"];
		self.createtime = [coder decodeObjectForKey:@"createtime"];
		self.content = [coder decodeObjectForKey:@"content"];
		self.photo = [coder decodeObjectForKey:@"photo"];
		self.audio = [coder decodeObjectForKey:@"audio"];
		self.video = [coder decodeObjectForKey:@"video"];
		self.recontent = [coder decodeObjectForKey:@"recontent"];
		self.replytime = [coder decodeObjectForKey:@"replytime"];
		self.orgid = [coder decodeObjectForKey:@"orgid"];
		self.orgname = [coder decodeObjectForKey:@"orgname"];
		self.orgphoto = [coder decodeObjectForKey:@"orgphoto"];
		self.viewcount = [coder decodeObjectForKey:@"viewcount"];
		self.replycount = [coder decodeObjectForKey:@"replycount"];
	}
	return self;
}

@end
