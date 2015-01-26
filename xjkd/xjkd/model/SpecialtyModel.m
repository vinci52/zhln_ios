//
//  SpecialtyModel.m
//  xjkd
//
//  Created by 聂宗波 on 14-12-8.
//  Copyright (c) 2014年 聂宗波. All rights reserved.
//

#import "SpecialtyModel.h"

@implementation SpecialtyModel

@synthesize id = _id;
@synthesize pdtype = _pdtype;
@synthesize createtime = _createtime;
@synthesize intrduce = _intrduce;
@synthesize photo = _photo;
@synthesize recontent = _recontent;
@synthesize replytime = _replytime;
@synthesize pdname = _pdname;
@synthesize pdphoto = _pdphoto;
@synthesize viewcount = _viewcount;
@synthesize replycount = _replycount;


- (void)dealloc
{

}
- (void)encodeWithCoder:(NSCoder *)coder {
	[coder encodeObject:self.id forKey:@"id"];
	[coder encodeObject:self.pdtype forKey:@"pdtype"];
	[coder encodeObject:self.createtime forKey:@"createtime"];
	[coder encodeObject:self.intrduce forKey:@"intrduce"];
	[coder encodeObject:self.photo forKey:@"photo"];
	[coder encodeObject:self.recontent forKey:@"recontent"];
	[coder encodeObject:self.replytime forKey:@"replytime"];
	[coder encodeObject:self.pdname forKey:@"pdname"];
	[coder encodeObject:self.pdphoto forKey:@"pdphoto"];
	[coder encodeObject:self.viewcount forKey:@"viewcount"];
	[coder encodeObject:self.replycount forKey:@"replycount"];
}

- (id)initWithCoder:(NSCoder *)coder {
	if ((self = [super init]) != nil) {
		self.id = [coder decodeObjectForKey:@"id"];
		self.pdtype = [coder decodeObjectForKey:@"pdtype"];
		self.createtime = [coder decodeObjectForKey:@"createtime"];
		self.intrduce = [coder decodeObjectForKey:@"intrduce"];
		self.photo = [coder decodeObjectForKey:@"photo"];
		self.recontent = [coder decodeObjectForKey:@"recontent"];
		self.replytime = [coder decodeObjectForKey:@"replytime"];
		self.pdname = [coder decodeObjectForKey:@"pdname"];
		self.pdphoto = [coder decodeObjectForKey:@"pdphoto"];
		self.viewcount = [coder decodeObjectForKey:@"viewcount"];
		self.replycount = [coder decodeObjectForKey:@"replycount"];
	}
	return self;
}

@end
