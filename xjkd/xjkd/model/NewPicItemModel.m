//
//  NewPicItemModel.m
//  xjkd
//
//  Created by 聂宗波 on 14-12-8.
//  Copyright (c) 2014年 聂宗波. All rights reserved.
//

#import "NewPicItemModel.h"

@implementation NewPicItemModel

@synthesize id = _id;
@synthesize img = _img;
@synthesize title = _title;
@synthesize content = _content;
@synthesize descition = _descition;


- (void)dealloc
{

}
- (void)encodeWithCoder:(NSCoder *)coder {
	[coder encodeObject:self.id forKey:@"id"];
	[coder encodeObject:self.img forKey:@"img"];
	[coder encodeObject:self.title forKey:@"title"];
	[coder encodeObject:self.content forKey:@"content"];
	[coder encodeObject:self.descition forKey:@"descition"];
}

- (id)initWithCoder:(NSCoder *)coder {
	if ((self = [super init]) != nil) {
		self.id = [coder decodeObjectForKey:@"id"];
		self.img = [coder decodeObjectForKey:@"img"];
		self.title = [coder decodeObjectForKey:@"title"];
		self.content = [coder decodeObjectForKey:@"content"];
		self.descition = [coder decodeObjectForKey:@"descition"];
	}
	return self;
}

@end
