//
//  UserInfoModel.m
//  xjkd
//
//  Created by 聂宗波 on 14-12-8.
//  Copyright (c) 2014年 聂宗波. All rights reserved.
//

#import "UserInfoModel.h"

@implementation UserInfoModel

@synthesize phone = _phone;
@synthesize userid = _userid;
@synthesize username = _username;
@synthesize photo = _photo;
@synthesize sessionid = _sessionid;
@synthesize email = _email;
@synthesize identity = _identity;


- (void)dealloc
{

}
- (void)encodeWithCoder:(NSCoder *)coder {
	[coder encodeObject:self.phone forKey:@"phone"];
	[coder encodeObject:self.userid forKey:@"userid"];
	[coder encodeObject:self.username forKey:@"username"];
	[coder encodeObject:self.photo forKey:@"photo"];
	[coder encodeObject:self.sessionid forKey:@"sessionid"];
	[coder encodeObject:self.email forKey:@"email"];
	[coder encodeObject:self.identity forKey:@"identity"];
}

- (id)initWithCoder:(NSCoder *)coder {
	if ((self = [super init]) != nil) {
		self.phone = [coder decodeObjectForKey:@"phone"];
		self.userid = [coder decodeObjectForKey:@"userid"];
		self.username = [coder decodeObjectForKey:@"username"];
		self.photo = [coder decodeObjectForKey:@"photo"];
		self.sessionid = [coder decodeObjectForKey:@"sessionid"];
		self.email = [coder decodeObjectForKey:@"email"];
		self.identity = [coder decodeObjectForKey:@"identity"];
	}
	return self;
}

@end
