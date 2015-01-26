//
//  CommentModel.h
//  xjkd
//
//  Created by 聂宗波 on 14-12-8.
//  Copyright (c) 2014年 聂宗波. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Jastor.h"

@interface CommentModel : Jastor
{	NSString *_id;
	NSString *_userid;
	NSString *_username;
	NSString *_userphoto;
	NSString *_createtime;
	NSString *_content;
	NSString *_orgid;
	NSString *_orgcontent;
}

@property (nonatomic) NSString *id;
@property (nonatomic, retain) NSString *userid;
@property (nonatomic, retain) NSString *username;
@property (nonatomic, retain) NSString *userphoto;
@property (nonatomic, retain) NSString *createtime;
@property (nonatomic, retain) NSString *content;
@property (nonatomic, retain) NSString *orgid;
@property (nonatomic, retain) NSString *orgcontent;


@end
