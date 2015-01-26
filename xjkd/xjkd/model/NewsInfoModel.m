//
//  NewsInfoModel.m
//  xjkd
//
//  Created by 聂宗波 on 14-12-8.
//  Copyright (c) 2014年 聂宗波. All rights reserved.
//

#import "NewsInfoModel.h"

@implementation NewsInfoModel

@synthesize id = _id;
@synthesize img = _img;
@synthesize title = _title;
@synthesize url = _url;
@synthesize content = _content;
@synthesize descition = _descition;
@synthesize replycount = _replycount;
@synthesize location = _location;
@synthesize newtype = _newtype;
@synthesize arttype = _arttype;
@synthesize subtypename = _subtypename;
@synthesize videourl = _videourl;
@synthesize createtime = _createtime;
@synthesize openreply = _openreply;
@synthesize viewTimes = _viewTimes;


- (void)dealloc
{

}
- (void)encodeWithCoder:(NSCoder *)coder {
	[coder encodeObject:self.id forKey:@"id"];
	[coder encodeObject:self.img forKey:@"img"];
	[coder encodeObject:self.title forKey:@"title"];
	[coder encodeObject:self.url forKey:@"url"];
	[coder encodeObject:self.content forKey:@"content"];
	[coder encodeObject:self.descition forKey:@"descition"];
	[coder encodeObject:self.replycount forKey:@"replycount"];
	[coder encodeObject:self.location forKey:@"location"];
	[coder encodeObject:self.newtype forKey:@"newtype"];
	[coder encodeObject:self.arttype forKey:@"arttype"];
	[coder encodeObject:self.subtypename forKey:@"subtypename"];
	[coder encodeObject:self.videourl forKey:@"videourl"];
	[coder encodeObject:self.createtime forKey:@"createtime"];
	[coder encodeObject:self.openreply forKey:@"openreply"];
	[coder encodeInt:self.viewTimes forKey:@"viewTimes"];
}

- (id)initWithCoder:(NSCoder *)coder {
	if ((self = [super init]) != nil) {
		self.id = [coder decodeObjectForKey:@"id"];
		self.img = [coder decodeObjectForKey:@"img"];
		self.title = [coder decodeObjectForKey:@"title"];
		self.url = [coder decodeObjectForKey:@"url"];
		self.content = [coder decodeObjectForKey:@"content"];
		self.descition = [coder decodeObjectForKey:@"descition"];
		self.replycount = [coder decodeObjectForKey:@"replycount"];
		self.location = [coder decodeObjectForKey:@"location"];
		self.newtype = [coder decodeObjectForKey:@"newtype"];
		self.arttype = [coder decodeObjectForKey:@"arttype"];
		self.subtypename = [coder decodeObjectForKey:@"subtypename"];
		self.videourl = [coder decodeObjectForKey:@"videourl"];
		self.createtime = [coder decodeObjectForKey:@"createtime"];
		self.openreply = [coder decodeObjectForKey:@"openreply"];
		self.viewTimes = [coder decodeIntForKey:@"viewTimes"];
	}
	return self;
}

@end
