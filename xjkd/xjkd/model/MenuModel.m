//
//  MenuModel.m
//  xjkd
//
//  Created by 聂宗波 on 14-12-8.
//  Copyright (c) 2014年 聂宗波. All rights reserved.
//

#import "MenuModel.h"

@implementation MenuModel

@synthesize name = _name;
@synthesize code = _code;
@synthesize icon = _icon;


- (void)dealloc
{

}
- (void)encodeWithCoder:(NSCoder *)coder {
	[coder encodeObject:self.name forKey:@"name"];
	[coder encodeObject:self.code forKey:@"code"];
	[coder encodeInt:self.icon forKey:@"icon"];
}

- (id)initWithCoder:(NSCoder *)coder {
	if ((self = [super init]) != nil) {
		self.name = [coder decodeObjectForKey:@"name"];
		self.code = [coder decodeObjectForKey:@"code"];
		self.icon = [coder decodeIntForKey:@"icon"];
	}
	return self;
}

@end
