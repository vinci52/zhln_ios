//
//  NumberModel.m
//  xjkd
//
//  Created by 聂宗波 on 14-12-8.
//  Copyright (c) 2014年 聂宗波. All rights reserved.
//

#import "NumberModel.h"

@implementation NumberModel

@synthesize id = _id;
@synthesize telNum = _telNum;
@synthesize username = _username;
@synthesize address = _address;
@synthesize reserved = _reserved;


- (void)dealloc
{

}
- (void)encodeWithCoder:(NSCoder *)coder {
	[coder encodeObject:self.id forKey:@"id"];
	[coder encodeObject:self.telNum forKey:@"telNum"];
	[coder encodeObject:self.username forKey:@"username"];
	[coder encodeObject:self.address forKey:@"address"];
	[coder encodeObject:self.reserved forKey:@"reserved"];
}

- (id)initWithCoder:(NSCoder *)coder {
	if ((self = [super init]) != nil) {
		self.id = [coder decodeObjectForKey:@"id"];
		self.telNum = [coder decodeObjectForKey:@"telNum"];
		self.username = [coder decodeObjectForKey:@"username"];
		self.address = [coder decodeObjectForKey:@"address"];
		self.reserved = [coder decodeObjectForKey:@"reserved"];
	}
	return self;
}

@end
