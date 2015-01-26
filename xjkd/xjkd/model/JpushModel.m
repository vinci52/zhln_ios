//
//  JpushModel.m
//  xjkd
//
//  Created by 聂宗波 on 14-12-8.
//  Copyright (c) 2014年 聂宗波. All rights reserved.
//

#import "JpushModel.h"

@implementation JpushModel

@synthesize type = _type;
@synthesize title = _title;
@synthesize content = _content;
@synthesize id = _id;
@synthesize arttype = _arttype;
@synthesize subtype = _subtype;
@synthesize showurl = _showurl;


- (void)dealloc
{

}
- (void)encodeWithCoder:(NSCoder *)coder {
	[coder encodeObject:self.type forKey:@"type"];
	[coder encodeObject:self.title forKey:@"title"];
	[coder encodeObject:self.content forKey:@"content"];
	[coder encodeObject:self.id forKey:@"id"];
	[coder encodeObject:self.arttype forKey:@"arttype"];
	[coder encodeObject:self.subtype forKey:@"subtype"];
	[coder encodeObject:self.showurl forKey:@"showurl"];
}

- (id)initWithCoder:(NSCoder *)coder {
	if ((self = [super init]) != nil) {
		self.type = [coder decodeObjectForKey:@"type"];
		self.title = [coder decodeObjectForKey:@"title"];
		self.content = [coder decodeObjectForKey:@"content"];
		self.id = [coder decodeObjectForKey:@"id"];
		self.arttype = [coder decodeObjectForKey:@"arttype"];
		self.subtype = [coder decodeObjectForKey:@"subtype"];
		self.showurl = [coder decodeObjectForKey:@"showurl"];
	}
	return self;
}

@end
