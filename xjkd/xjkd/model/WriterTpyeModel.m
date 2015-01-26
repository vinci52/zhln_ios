//
//  WriterTpyeModel.m
//  xjkd
//
//  Created by 聂宗波 on 14-12-8.
//  Copyright (c) 2014年 聂宗波. All rights reserved.
//

#import "WriterTpyeModel.h"

@implementation WriterTpyeModel

@synthesize id = _id;
@synthesize type = _type;
@synthesize tycode = _tycode;
@synthesize typeName = _typeName;


- (void)dealloc
{

}
- (void)encodeWithCoder:(NSCoder *)coder {
	[coder encodeObject:self.id forKey:@"id"];
	[coder encodeObject:self.type forKey:@"type"];
	[coder encodeObject:self.tycode forKey:@"tycode"];
	[coder encodeObject:self.typeName forKey:@"typeName"];
}

- (id)initWithCoder:(NSCoder *)coder {
	if ((self = [super init]) != nil) {
		self.id = [coder decodeObjectForKey:@"id"];
		self.type = [coder decodeObjectForKey:@"type"];
		self.tycode = [coder decodeObjectForKey:@"tycode"];
		self.typeName = [coder decodeObjectForKey:@"typeName"];
	}
	return self;
}

@end
