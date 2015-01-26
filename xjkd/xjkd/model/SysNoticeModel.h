//
//  SysNoticeModel.h
//  xjkd
//
//  Created by 聂宗波 on 14-12-8.
//  Copyright (c) 2014年 聂宗波. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SysNoticeModel : NSObject
{	NSString *_id;
	NSString *_userid;
	NSString *_username;
	NSString *_createtime;
	NSString *_content;
}

@property (nonatomic, retain) NSString *id;
@property (nonatomic, retain) NSString *userid;
@property (nonatomic, retain) NSString *username;
@property (nonatomic, retain) NSString *createtime;
@property (nonatomic, retain) NSString *content;


@end
