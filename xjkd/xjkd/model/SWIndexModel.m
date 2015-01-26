//
//  SWIndexModel.m
//  xjkd
//
//  Created by 聂宗波 on 14-12-8.
//  Copyright (c) 2014年 聂宗波. All rights reserved.
//

#import "SWIndexModel.h"

@implementation SWIndexModel

@synthesize i1 = _i1;
@synthesize i2 = _i2;
@synthesize i3 = _i3;
@synthesize i4 = _i4;
@synthesize i5 = _i5;
@synthesize i6 = _i6;
@synthesize i7 = _i7;
@synthesize i8 = _i8;
@synthesize i9 = _i9;
@synthesize i10 = _i10;


- (void)dealloc
{

}
- (void)encodeWithCoder:(NSCoder *)coder {
	[coder encodeObject:self.i1 forKey:@"i1"];
	[coder encodeObject:self.i2 forKey:@"i2"];
	[coder encodeObject:self.i3 forKey:@"i3"];
	[coder encodeObject:self.i4 forKey:@"i4"];
	[coder encodeObject:self.i5 forKey:@"i5"];
	[coder encodeObject:self.i6 forKey:@"i6"];
	[coder encodeObject:self.i7 forKey:@"i7"];
	[coder encodeObject:self.i8 forKey:@"i8"];
	[coder encodeObject:self.i9 forKey:@"i9"];
	[coder encodeObject:self.i10 forKey:@"i10"];
}

- (id)initWithCoder:(NSCoder *)coder {
	if ((self = [super init]) != nil) {
		self.i1 = [coder decodeObjectForKey:@"i1"];
		self.i2 = [coder decodeObjectForKey:@"i2"];
		self.i3 = [coder decodeObjectForKey:@"i3"];
		self.i4 = [coder decodeObjectForKey:@"i4"];
		self.i5 = [coder decodeObjectForKey:@"i5"];
		self.i6 = [coder decodeObjectForKey:@"i6"];
		self.i7 = [coder decodeObjectForKey:@"i7"];
		self.i8 = [coder decodeObjectForKey:@"i8"];
		self.i9 = [coder decodeObjectForKey:@"i9"];
		self.i10 = [coder decodeObjectForKey:@"i10"];
	}
	return self;
}

@end
