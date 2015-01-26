//
//  TourModel.m
//  xjkd
//
//  Created by 聂宗波 on 14-12-8.
//  Copyright (c) 2014年 聂宗波. All rights reserved.
//

#import "TourModel.h"

@implementation TourModel

@synthesize id = _id;
@synthesize title = _title;
@synthesize content = _content;
@synthesize photo = _photo;


- (void)dealloc
{

}
- (void)encodeWithCoder:(NSCoder *)coder {
	[coder encodeObject:self.id forKey:@"id"];
	[coder encodeObject:self.title forKey:@"title"];
	[coder encodeObject:self.content forKey:@"content"];
	[coder encodeObject:self.photo forKey:@"photo"];
}

- (id)initWithCoder:(NSCoder *)coder {
	if ((self = [super init]) != nil) {
		self.id = [coder decodeObjectForKey:@"id"];
		self.title = [coder decodeObjectForKey:@"title"];
		self.content = [coder decodeObjectForKey:@"content"];
		self.photo = [coder decodeObjectForKey:@"photo"];
	}
	return self;
}

@end
