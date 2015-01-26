//
//  NumberModel.h
//  xjkd
//
//  Created by 聂宗波 on 14-12-8.
//  Copyright (c) 2014年 聂宗波. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NumberModel : NSObject
{	NSString *_id;
	NSString *_telNum;
	NSString *_username;
	NSString *_address;
	NSString *_reserved;
}

@property (nonatomic, retain) NSString *id;
@property (nonatomic, retain) NSString *telNum;
@property (nonatomic, retain) NSString *username;
@property (nonatomic, retain) NSString *address;
@property (nonatomic, retain) NSString *reserved;


@end
