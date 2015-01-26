//
//  InvestigateModel.m
//  xjkd
//
//  Created by 聂宗波 on 14-12-8.
//  Copyright (c) 2014年 聂宗波. All rights reserved.
//

#import "InvestigateModel.h"

@implementation InvestigateModel

@synthesize id = _id;
@synthesize title = _title;
@synthesize type = _type;
@synthesize voteCount = _voteCount;
@synthesize status = _status;
@synthesize reserved = _reserved;


- (void)dealloc
{

}
- (void)encodeWithCoder:(NSCoder *)coder {
	[coder encodeObject:self.id forKey:@"id"];
	[coder encodeObject:self.title forKey:@"title"];
	[coder encodeObject:self.type forKey:@"type"];
	[coder encodeObject:self.voteCount forKey:@"voteCount"];
	[coder encodeObject:self.status forKey:@"status"];
	[coder encodeObject:self.reserved forKey:@"reserved"];
}

- (id)initWithCoder:(NSCoder *)coder {
	if ((self = [super init]) != nil) {
		self.id = [coder decodeObjectForKey:@"id"];
		self.title = [coder decodeObjectForKey:@"title"];
		self.type = [coder decodeObjectForKey:@"type"];
		self.voteCount = [coder decodeObjectForKey:@"voteCount"];
		self.status = [coder decodeObjectForKey:@"status"];
		self.reserved = [coder decodeObjectForKey:@"reserved"];
	}
	return self;
}

@end
