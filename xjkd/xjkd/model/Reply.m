//
//  Reply.m
//  xjkd
//
//  Created by 聂宗波 on 14-12-8.
//  Copyright (c) 2014年 聂宗波. All rights reserved.
//

#import "Reply.h"

@implementation Reply

@synthesize recontent = _recontent;
@synthesize replytime = _replytime;
@synthesize art_title = _art_title;
@synthesize art_showurl = _art_showurl;
@synthesize art_type = _art_type;
@synthesize art_id = _art_id;
@synthesize replycount = _replycount;


- (void)dealloc
{

}
- (void)encodeWithCoder:(NSCoder *)coder {
	[coder encodeObject:self.recontent forKey:@"recontent"];
	[coder encodeObject:self.replytime forKey:@"replytime"];
	[coder encodeObject:self.art_title forKey:@"art_title"];
	[coder encodeObject:self.art_showurl forKey:@"art_showurl"];
	[coder encodeObject:self.art_type forKey:@"art_type"];
	[coder encodeObject:self.art_id forKey:@"art_id"];
	[coder encodeObject:self.replycount forKey:@"replycount"];
}

- (id)initWithCoder:(NSCoder *)coder {
	if ((self = [super init]) != nil) {
		self.recontent = [coder decodeObjectForKey:@"recontent"];
		self.replytime = [coder decodeObjectForKey:@"replytime"];
		self.art_title = [coder decodeObjectForKey:@"art_title"];
		self.art_showurl = [coder decodeObjectForKey:@"art_showurl"];
		self.art_type = [coder decodeObjectForKey:@"art_type"];
		self.art_id = [coder decodeObjectForKey:@"art_id"];
		self.replycount = [coder decodeObjectForKey:@"replycount"];
	}
	return self;
}

@end
