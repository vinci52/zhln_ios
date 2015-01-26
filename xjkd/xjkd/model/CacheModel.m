//
//  CacheModel.m
//  xjkd
//
//  Created by 聂宗波 on 14-12-8.
//  Copyright (c) 2014年 聂宗波. All rights reserved.
//

#import "CacheModel.h"

@implementation CacheModel

@synthesize id = _id;
@synthesize type = _type;
@synthesize msg = _msg;


- (void)dealloc
{

}
- (void)encodeWithCoder:(NSCoder *)coder {
	[coder encodeObject:self.id forKey:@"id"];
	[coder encodeInt:self.type forKey:@"type"];
	[coder encodeObject:self.msg forKey:@"msg"];
}

- (id)initWithCoder:(NSCoder *)coder {
	if ((self = [super init]) != nil) {
		self.id = [coder decodeObjectForKey:@"id"];
		self.type = [coder decodeIntForKey:@"type"];
		self.msg = [coder decodeObjectForKey:@"msg"];
	}
	return self;
}

@end
