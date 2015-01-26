//
//  ContentBean.m
//  xjkd
//
//  Created by 聂宗波 on 14-12-8.
//  Copyright (c) 2014年 聂宗波. All rights reserved.
//

#import "ContentBean.h"

@implementation ContentBean

@synthesize id = _id;
@synthesize title = _title;
@synthesize content = _content;
@synthesize type = _type;
@synthesize username = _username;
@synthesize attypeName = _attypeName;


- (void)dealloc
{

}
- (void)encodeWithCoder:(NSCoder *)coder {
	[coder encodeObject:self.id forKey:@"id"];
	[coder encodeObject:self.title forKey:@"title"];
	[coder encodeObject:self.content forKey:@"content"];
	[coder encodeInt:self.type forKey:@"type"];
	[coder encodeObject:self.username forKey:@"username"];
	[coder encodeObject:self.attypeName forKey:@"attypeName"];
}

- (id)initWithCoder:(NSCoder *)coder {
	if ((self = [super init]) != nil) {
		self.id = [coder decodeObjectForKey:@"id"];
		self.title = [coder decodeObjectForKey:@"title"];
		self.content = [coder decodeObjectForKey:@"content"];
		self.type = [coder decodeIntForKey:@"type"];
		self.username = [coder decodeObjectForKey:@"username"];
		self.attypeName = [coder decodeObjectForKey:@"attypeName"];
	}
	return self;
}

@end
