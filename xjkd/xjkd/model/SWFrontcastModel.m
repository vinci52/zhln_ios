//
//  SWFrontcastModel.m
//  xjkd
//
//  Created by 聂宗波 on 14-12-8.
//  Copyright (c) 2014年 聂宗波. All rights reserved.
//

#import "SWFrontcastModel.h"

@implementation SWFrontcastModel

@synthesize f1 = _f1;
@synthesize f0 = _f0;


- (void)dealloc
{

}
- (void)encodeWithCoder:(NSCoder *)coder {
	[coder encodeObject:self.f1 forKey:@"f1"];
	[coder encodeObject:self.f0 forKey:@"f0"];
}

- (id)initWithCoder:(NSCoder *)coder {
	if ((self = [super init]) != nil) {
		self.f1 = [coder decodeObjectForKey:@"f1"];
		self.f0 = [coder decodeObjectForKey:@"f0"];
	}
	return self;
}
+(Class)f1_class{
    return [SWFrontcastDayModel class];
}
@end
