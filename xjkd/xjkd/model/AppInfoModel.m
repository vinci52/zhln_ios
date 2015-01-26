//
//  AppInfoModel.m
//  xjkd
//
//  Created by 聂宗波 on 14-12-8.
//  Copyright (c) 2014年 聂宗波. All rights reserved.
//

#import "AppInfoModel.h"

@implementation AppInfoModel

@synthesize id = _id;
@synthesize version = _version;
@synthesize path = _path;
@synthesize info = _info;


- (void)dealloc
{

}
- (void)encodeWithCoder:(NSCoder *)coder {
	[coder encodeObject:self.id forKey:@"id"];
	[coder encodeObject:self.version forKey:@"version"];
	[coder encodeObject:self.path forKey:@"path"];
	[coder encodeObject:self.info forKey:@"info"];
}

- (id)initWithCoder:(NSCoder *)coder {
	if ((self = [super init]) != nil) {
		self.id = [coder decodeObjectForKey:@"id"];
		self.version = [coder decodeObjectForKey:@"version"];
		self.path = [coder decodeObjectForKey:@"path"];
		self.info = [coder decodeObjectForKey:@"info"];
	}
	return self;
}

@end
