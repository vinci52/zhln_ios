//
//  NewsTypeModel.m
//  xjkd
//
//  Created by 聂宗波 on 14-12-8.
//  Copyright (c) 2014年 聂宗波. All rights reserved.
//

#import "NewsTypeModel.h"

@implementation NewsTypeModel

@synthesize id = _id;
@synthesize name = _name;
@synthesize type = _type;
@synthesize hassub = _hassub;
@synthesize subtypes = _subtypes;
@synthesize parentid = _parentid;
@synthesize ext = _ext;
@synthesize outurl = _outurl;
@synthesize openreply = _openreply;
@synthesize normalImg = _normalImg;
@synthesize selectImg = _selectImg;


- (void)dealloc
{

}
- (void)encodeWithCoder:(NSCoder *)coder {
	[coder encodeObject:self.id forKey:@"id"];
	[coder encodeObject:self.name forKey:@"name"];
	[coder encodeObject:self.type forKey:@"type"];
	[coder encodeObject:self.hassub forKey:@"hassub"];
	[coder encodeObject:self.subtypes forKey:@"subtypes"];
	[coder encodeObject:self.parentid forKey:@"parentid"];
	[coder encodeObject:self.ext forKey:@"ext"];
	[coder encodeObject:self.outurl forKey:@"outurl"];
	[coder encodeObject:self.openreply forKey:@"openreply"];
    [coder encodeObject:self.normalImg forKey:@"normalImg"];
    [coder encodeObject:self.selectImg forKey:@"selectImg"];
}

- (id)initWithCoder:(NSCoder *)coder {
	if ((self = [super init]) != nil) {
		self.id = [coder decodeObjectForKey:@"id"];
		self.name = [coder decodeObjectForKey:@"name"];
		self.type = [coder decodeObjectForKey:@"type"];
		self.hassub = [coder decodeObjectForKey:@"hassub"];
		self.subtypes = [coder decodeObjectForKey:@"subtypes"];
		self.parentid = [coder decodeObjectForKey:@"parentid"];
		self.ext = [coder decodeObjectForKey:@"ext"];
		self.outurl = [coder decodeObjectForKey:@"outurl"];
		self.openreply = [coder decodeObjectForKey:@"openreply"];
        self.normalImg = [coder decodeObjectForKey:@"normalImg"];
        self.selectImg = [coder decodeObjectForKey:@"selectImg"];
	}
	return self;
}

+(Class)subtypes_class{
    return [NewsTypeModel class];
}

@end
