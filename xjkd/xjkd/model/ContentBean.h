//
//  ContentBean.h
//  xjkd
//
//  Created by 聂宗波 on 14-12-8.
//  Copyright (c) 2014年 聂宗波. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ContentBean : NSObject
{	NSString *_id;
	NSString *_title;
	NSString *_content;
	int _type;
	NSString *_username;
	NSString *_attypeName;
}

@property (nonatomic, retain) NSString *id;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *content;
@property (nonatomic) int type;
@property (nonatomic, retain) NSString *username;
@property (nonatomic, retain) NSString *attypeName;


@end
