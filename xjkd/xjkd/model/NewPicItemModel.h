//
//  NewPicItemModel.h
//  xjkd
//
//  Created by 聂宗波 on 14-12-8.
//  Copyright (c) 2014年 聂宗波. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewPicItemModel : NSObject
{	NSString *_id;
	NSString *_img;
	NSString *_title;
	NSString *_content;
	NSString *_descition;
}

@property (nonatomic, retain) NSString *id;
@property (nonatomic, retain) NSString *img;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *content;
@property (nonatomic, retain) NSString *descition;


@end
