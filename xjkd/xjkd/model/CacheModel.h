//
//  CacheModel.h
//  xjkd
//
//  Created by 聂宗波 on 14-12-8.
//  Copyright (c) 2014年 聂宗波. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CacheModel : NSObject
{
	NSString *_id;
	int _type;
	NSObject* _msg;
}

@property (nonatomic, retain) NSString *id;
@property (nonatomic) int type;
@property (nonatomic, retain) NSObject *msg;


@end
