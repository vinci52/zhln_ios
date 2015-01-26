//
//  Reply.h
//  xjkd
//
//  Created by 聂宗波 on 14-12-8.
//  Copyright (c) 2014年 聂宗波. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Reply : NSObject
{	NSString *_recontent;
	NSString *_replytime;
	NSString *_art_title;
	NSString *_art_showurl;
	NSString *_art_type;
	NSString *_art_id;
	NSString *_replycount;
}

@property (nonatomic, retain) NSString *recontent;
@property (nonatomic, retain) NSString *replytime;
@property (nonatomic, retain) NSString *art_title;
@property (nonatomic, retain) NSString *art_showurl;
@property (nonatomic, retain) NSString *art_type;
@property (nonatomic, retain) NSString *art_id;
@property (nonatomic, retain) NSString *replycount;


@end
