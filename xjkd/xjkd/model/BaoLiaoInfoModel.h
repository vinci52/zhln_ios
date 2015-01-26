//
//  BaoLiaoInfoModel.h
//  xjkd
//
//  Created by 聂宗波 on 14-12-8.
//  Copyright (c) 2014年 聂宗波. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaoLiaoInfoModel : NSObject
{	NSString *_id;
	NSString *_userid;
	NSString *_username;
	NSString *_userphoto;
	NSString *_createtime;
	NSString *_content;
	NSString *_photo;
	NSString *_audio;
	NSString *_video;
	NSString *_recontent;
	NSString *_replytime;
	NSString *_orgid;
	NSString *_orgname;
	NSString *_orgphoto;
	NSString *_viewcount;
	NSString *_replycount;
}

@property (nonatomic, retain) NSString *id;
@property (nonatomic, retain) NSString *userid;
@property (nonatomic, retain) NSString *username;
@property (nonatomic, retain) NSString *userphoto;
@property (nonatomic, retain) NSString *createtime;
@property (nonatomic, retain) NSString *content;
@property (nonatomic, retain) NSString *photo;
@property (nonatomic, retain) NSString *audio;
@property (nonatomic, retain) NSString *video;
@property (nonatomic, retain) NSString *recontent;
@property (nonatomic, retain) NSString *replytime;
@property (nonatomic, retain) NSString *orgid;
@property (nonatomic, retain) NSString *orgname;
@property (nonatomic, retain) NSString *orgphoto;
@property (nonatomic, retain) NSString *viewcount;
@property (nonatomic, retain) NSString *replycount;


@end
