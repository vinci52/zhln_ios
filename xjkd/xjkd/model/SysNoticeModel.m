//
//  SysNoticeModel.m
//  xjkd
//
//  Created by 聂宗波 on 14-12-8.
//  Copyright (c) 2014年 聂宗波. All rights reserved.
//

#import "SysNoticeModel.h"

@implementation SysNoticeModel

@synthesize id = _id;
@synthesize userid = _userid;
@synthesize username = _username;
@synthesize createtime = _createtime;
@synthesize content = _content;


- (void)dealloc
{

}
- (void)encodeWithCoder:(NSCoder *)coder {
	[coder encodeObject:self.id forKey:@"id"];
	[coder encodeObject:self.userid forKey:@"userid"];
	[coder encodeObject:self.username forKey:@"username"];
	[coder encodeObject:self.createtime forKey:@"createtime"];
	[coder encodeObject:self.content forKey:@"content"];
}

- (id)initWithCoder:(NSCoder *)coder {
	if ((self = [super init]) != nil) {
		self.id = [coder decodeObjectForKey:@"id"];
		self.userid = [coder decodeObjectForKey:@"userid"];
		self.username = [coder decodeObjectForKey:@"username"];
		self.createtime = [coder decodeObjectForKey:@"createtime"];
		self.content = [coder decodeObjectForKey:@"content"];
	}
	return self;
}

@end
