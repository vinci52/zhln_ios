//
//  GovmentInfoModel.m
//  xjkd
//
//  Created by 聂宗波 on 14-12-8.
//  Copyright (c) 2014年 聂宗波. All rights reserved.
//

#import "GovmentInfoModel.h"

@implementation GovmentInfoModel

@synthesize id = _id;
@synthesize photo = _photo;
@synthesize name = _name;
@synthesize url = _url;
@synthesize content = _content;
@synthesize desc = _desc;


- (void)dealloc
{

}
- (void)encodeWithCoder:(NSCoder *)coder {
	[coder encodeObject:self.id forKey:@"id"];
	[coder encodeObject:self.photo forKey:@"photo"];
	[coder encodeObject:self.name forKey:@"name"];
	[coder encodeObject:self.url forKey:@"url"];
	[coder encodeObject:self.content forKey:@"content"];
	[coder encodeObject:self.desc forKey:@"desc"];
}

- (id)initWithCoder:(NSCoder *)coder {
	if ((self = [super init]) != nil) {
		self.id = [coder decodeObjectForKey:@"id"];
		self.photo = [coder decodeObjectForKey:@"photo"];
		self.name = [coder decodeObjectForKey:@"name"];
		self.url = [coder decodeObjectForKey:@"url"];
		self.content = [coder decodeObjectForKey:@"content"];
		self.desc = [coder decodeObjectForKey:@"desc"];
	}
	return self;
}

@end
