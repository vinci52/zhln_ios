//
//  CommentModel.m
//  xjkd
//
//  Created by 聂宗波 on 14-12-8.
//  Copyright (c) 2014年 聂宗波. All rights reserved.
//

#import "CommentModel.h"

@implementation CommentModel

@synthesize id = _id;
@synthesize userid = _userid;
@synthesize username = _username;
@synthesize userphoto = _userphoto;
@synthesize createtime = _createtime;
@synthesize content = _content;
@synthesize orgid = _orgid;
@synthesize orgcontent = _orgcontent;


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
	[coder encodeObject:self.orgid forKey:@"orgid"];
	[coder encodeObject:self.orgcontent forKey:@"orgcontent"];
}

- (id)initWithCoder:(NSCoder *)coder {
	if ((self = [super init]) != nil) {
		self.id = [coder decodeObjectForKey:@"id"];
		self.userid = [coder decodeObjectForKey:@"userid"];
		self.username = [coder decodeObjectForKey:@"username"];
		self.userphoto = [coder decodeObjectForKey:@"userphoto"];
		self.createtime = [coder decodeObjectForKey:@"createtime"];
		self.content = [coder decodeObjectForKey:@"content"];
		self.orgid = [coder decodeObjectForKey:@"orgid"];
		self.orgcontent = [coder decodeObjectForKey:@"orgcontent"];
	}
	return self;
}

@end
