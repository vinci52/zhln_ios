//
//  GovmentInfoModel.h
//  xjkd
//
//  Created by 聂宗波 on 14-12-8.
//  Copyright (c) 2014年 聂宗波. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GovmentInfoModel : NSObject
{	NSString *_id;
	NSString *_photo;
	NSString *_name;
	NSString *_url;
	NSString *_content;
	NSString *_desc;
}

@property (nonatomic, retain) NSString *id;
@property (nonatomic, retain) NSString *photo;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *url;
@property (nonatomic, retain) NSString *content;
@property (nonatomic, retain) NSString *desc;


@end
