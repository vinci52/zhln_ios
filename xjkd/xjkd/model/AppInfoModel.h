//
//  AppInfoModel.h
//  xjkd
//
//  Created by 聂宗波 on 14-12-8.
//  Copyright (c) 2014年 聂宗波. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppInfoModel : NSObject
{	NSString *_id;
	NSString *_version;
	NSString *_path;
	NSString *_info;
}

@property (nonatomic, retain) NSString *id;
@property (nonatomic, retain) NSString *version;
@property (nonatomic, retain) NSString *path;
@property (nonatomic, retain) NSString *info;


@end
