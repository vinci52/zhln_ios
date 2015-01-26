//
//  SWAreaModel.m
//  xjkd
//
//  Created by 聂宗波 on 14-12-8.
//  Copyright (c) 2014年 聂宗波. All rights reserved.
//

#import "SWAreaModel.h"

@implementation SWAreaModel

@synthesize c1 = _c1;
@synthesize c2 = _c2;
@synthesize c3 = _c3;
@synthesize c4 = _c4;
@synthesize c5 = _c5;
@synthesize c6 = _c6;
@synthesize c7 = _c7;
@synthesize c8 = _c8;
@synthesize c9 = _c9;
@synthesize c10 = _c10;
@synthesize c11 = _c11;
@synthesize c12 = _c12;
@synthesize c13 = _c13;
@synthesize c14 = _c14;
@synthesize c15 = _c15;
@synthesize c16 = _c16;
@synthesize c17 = _c17;


- (void)dealloc
{

}
- (void)encodeWithCoder:(NSCoder *)coder {
	[coder encodeObject:self.c1 forKey:@"c1"];
	[coder encodeObject:self.c2 forKey:@"c2"];
	[coder encodeObject:self.c3 forKey:@"c3"];
	[coder encodeObject:self.c4 forKey:@"c4"];
	[coder encodeObject:self.c5 forKey:@"c5"];
	[coder encodeObject:self.c6 forKey:@"c6"];
	[coder encodeObject:self.c7 forKey:@"c7"];
	[coder encodeObject:self.c8 forKey:@"c8"];
	[coder encodeObject:self.c9 forKey:@"c9"];
	[coder encodeObject:self.c10 forKey:@"c10"];
	[coder encodeObject:self.c11 forKey:@"c11"];
	[coder encodeObject:self.c12 forKey:@"c12"];
	[coder encodeObject:self.c13 forKey:@"c13"];
	[coder encodeObject:self.c14 forKey:@"c14"];
	[coder encodeObject:self.c15 forKey:@"c15"];
	[coder encodeObject:self.c16 forKey:@"c16"];
	[coder encodeObject:self.c17 forKey:@"c17"];
}

- (id)initWithCoder:(NSCoder *)coder {
	if ((self = [super init]) != nil) {
		self.c1 = [coder decodeObjectForKey:@"c1"];
		self.c2 = [coder decodeObjectForKey:@"c2"];
		self.c3 = [coder decodeObjectForKey:@"c3"];
		self.c4 = [coder decodeObjectForKey:@"c4"];
		self.c5 = [coder decodeObjectForKey:@"c5"];
		self.c6 = [coder decodeObjectForKey:@"c6"];
		self.c7 = [coder decodeObjectForKey:@"c7"];
		self.c8 = [coder decodeObjectForKey:@"c8"];
		self.c9 = [coder decodeObjectForKey:@"c9"];
		self.c10 = [coder decodeObjectForKey:@"c10"];
		self.c11 = [coder decodeObjectForKey:@"c11"];
		self.c12 = [coder decodeObjectForKey:@"c12"];
		self.c13 = [coder decodeObjectForKey:@"c13"];
		self.c14 = [coder decodeObjectForKey:@"c14"];
		self.c15 = [coder decodeObjectForKey:@"c15"];
		self.c16 = [coder decodeObjectForKey:@"c16"];
		self.c17 = [coder decodeObjectForKey:@"c17"];
	}
	return self;
}

@end
