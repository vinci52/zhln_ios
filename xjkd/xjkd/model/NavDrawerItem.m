//
//  NavDrawerItem.m
//  xjkd
//
//  Created by 聂宗波 on 14-12-8.
//  Copyright (c) 2014年 聂宗波. All rights reserved.
//

#import "NavDrawerItem.h"

@implementation NavDrawerItem

@synthesize title = _title;
@synthesize icon = _icon;
@synthesize count = _count;
@synthesize isCounterVisible = _isCounterVisible;
@synthesize code = _code;


- (void)dealloc
{

}
- (void)encodeWithCoder:(NSCoder *)coder {
	[coder encodeObject:self.title forKey:@"title"];
	[coder encodeInt:self.icon forKey:@"icon"];
	[coder encodeObject:self.count forKey:@"count"];
	[coder encodeInt:self.isCounterVisible forKey:@"isCounterVisible"];
	[coder encodeObject:self.code forKey:@"code"];
}

- (id)initWithCoder:(NSCoder *)coder {
	if ((self = [super init]) != nil) {
		self.title = [coder decodeObjectForKey:@"title"];
		self.icon = [coder decodeIntForKey:@"icon"];
		self.count = [coder decodeObjectForKey:@"count"];
		self.isCounterVisible = [coder decodeIntForKey:@"isCounterVisible"];
		self.code = [coder decodeObjectForKey:@"code"];
	}
	return self;
}

@end
