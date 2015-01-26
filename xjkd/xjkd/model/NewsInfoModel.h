//
//  NewsInfoModel.h
//  xjkd
//
//  Created by 聂宗波 on 14-12-8.
//  Copyright (c) 2014年 聂宗波. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Jastor.h"
@interface NewsInfoModel : Jastor
{	NSString *_id;
	NSString *_img;
	NSString *_title;
	NSString *_url;
	NSString *_content;
	NSString *_descition;
	NSString *_replycount;
	NSString *_location;
	NSString *_newtype;
	NSString *_arttype;
	NSString *_subtypename;
	NSString *_videourl;
	NSString *_createtime;
	NSString *_openreply;
	int _viewTimes;
}

@property (nonatomic, retain) NSString *id;
@property (nonatomic, retain) NSString *img;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *url;
@property (nonatomic, retain) NSString *content;
@property (nonatomic, retain) NSString *descition;
@property (nonatomic, retain) NSString *replycount;
@property (nonatomic, retain) NSString *location;
@property (nonatomic, retain) NSString *newtype;
@property (nonatomic, retain) NSString *arttype;
@property (nonatomic, retain) NSString *subtypename;
@property (nonatomic, retain) NSString *videourl;
@property (nonatomic, retain) NSString *createtime;
@property (nonatomic, retain) NSString *openreply;
@property (nonatomic) int viewTimes;


@end
