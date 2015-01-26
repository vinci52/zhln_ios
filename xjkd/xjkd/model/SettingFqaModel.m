//
//  SettingFqaModel.m
//  xjkd
//
//  Created by 聂宗波 on 14-12-8.
//  Copyright (c) 2014年 聂宗波. All rights reserved.
//

#import "SettingFqaModel.h"

@implementation SettingFqaModel

@synthesize id = _id;
@synthesize content = _content;


- (void)dealloc
{

}
- (void)encodeWithCoder:(NSCoder *)coder {
	[coder encodeObject:self.id forKey:@"id"];
	[coder encodeObject:self.content forKey:@"content"];
}

- (id)initWithCoder:(NSCoder *)coder {
	if ((self = [super init]) != nil) {
		self.id = [coder decodeObjectForKey:@"id"];
		self.content = [coder decodeObjectForKey:@"content"];
	}
	return self;
}

@end
