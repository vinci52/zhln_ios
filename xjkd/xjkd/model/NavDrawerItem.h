//
//  NavDrawerItem.h
//  xjkd
//
//  Created by 聂宗波 on 14-12-8.
//  Copyright (c) 2014年 聂宗波. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NavDrawerItem : NSObject
{	NSString *_title;
	int _icon;
	NSString *_count;
	Boolean _isCounterVisible;
	NSString *_code;
}

@property (nonatomic, retain) NSString *title;
@property (nonatomic) int icon;
@property (nonatomic, retain) NSString *count;
@property (nonatomic) Boolean isCounterVisible;
@property (nonatomic, retain) NSString *code;


@end
