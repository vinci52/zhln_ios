//
//  NewsSubTypeModel.m
//  xjkd
//
//  Created by 聂宗波 on 14-12-8.
//  Copyright (c) 2014年 聂宗波. All rights reserved.
//

#import "NewsSubTypeModel.h"

@implementation NewsSubTypeModel

@synthesize id = _id;
@synthesize name = _name;


- (void)dealloc
{

}
- (void)encodeWithCoder:(NSCoder *)coder {
	[coder encodeObject:self.id forKey:@"id"];
	[coder encodeObject:self.name forKey:@"name"];
}

- (id)initWithCoder:(NSCoder *)coder {
	if ((self = [super init]) != nil) {
		self.id = [coder decodeObjectForKey:@"id"];
		self.name = [coder decodeObjectForKey:@"name"];
	}
	return self;
}

@end
