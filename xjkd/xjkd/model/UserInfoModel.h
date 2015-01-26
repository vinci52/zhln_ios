//
//  UserInfoModel.h
//  xjkd
//
//  Created by 聂宗波 on 14-12-8.
//  Copyright (c) 2014年 聂宗波. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Jastor.h"

@interface UserInfoModel : Jastor
{	NSString *_phone;
	NSString *_userid;
	NSString *_username;
	NSString *_photo;
	NSString *_sessionid;
	NSString *_email;
	NSString *_identity;
}

@property (nonatomic, retain) NSString *phone;
@property (nonatomic, retain) NSString *userid;
@property (nonatomic, retain) NSString *username;
@property (nonatomic, retain) NSString *photo;
@property (nonatomic, retain) NSString *sessionid;
@property (nonatomic, retain) NSString *email;
@property (nonatomic, retain) NSString *identity;


@end
