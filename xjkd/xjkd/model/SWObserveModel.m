//
//  SWObserveModel.m
//  xjkd
//
//  Created by 聂宗波 on 14-12-8.
//  Copyright (c) 2014年 聂宗波. All rights reserved.
//

#import "SWObserveModel.h"

@implementation SWObserveModel

@synthesize l1 = _l1;
@synthesize l2 = _l2;
@synthesize l3 = _l3;
@synthesize l4 = _l4;
@synthesize l7 = _l7;


- (void)dealloc
{

}
- (void)encodeWithCoder:(NSCoder *)coder {
	[coder encodeObject:self.l1 forKey:@"l1"];
	[coder encodeObject:self.l2 forKey:@"l2"];
	[coder encodeObject:self.l3 forKey:@"l3"];
	[coder encodeObject:self.l4 forKey:@"l4"];
	[coder encodeObject:self.l7 forKey:@"l7"];
}

- (id)initWithCoder:(NSCoder *)coder {
	if ((self = [super init]) != nil) {
		self.l1 = [coder decodeObjectForKey:@"l1"];
		self.l2 = [coder decodeObjectForKey:@"l2"];
		self.l3 = [coder decodeObjectForKey:@"l3"];
		self.l4 = [coder decodeObjectForKey:@"l4"];
		self.l7 = [coder decodeObjectForKey:@"l7"];
	}
	return self;
}

@end
