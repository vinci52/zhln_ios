//
//  SpecialtyModel.h
//  xjkd
//
//  Created by 聂宗波 on 14-12-8.
//  Copyright (c) 2014年 聂宗波. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SpecialtyModel : NSObject
{	NSString *_id;
	NSString *_pdtype;
	NSString *_createtime;
	NSString *_intrduce;
	NSString *_photo;
	NSString *_recontent;
	NSString *_replytime;
	NSString *_pdname;
	NSString *_pdphoto;
	NSString *_viewcount;
	NSString *_replycount;
}

@property (nonatomic, retain) NSString *id;
@property (nonatomic, retain) NSString *pdtype;
@property (nonatomic, retain) NSString *createtime;
@property (nonatomic, retain) NSString *intrduce;
@property (nonatomic, retain) NSString *photo;
@property (nonatomic, retain) NSString *recontent;
@property (nonatomic, retain) NSString *replytime;
@property (nonatomic, retain) NSString *pdname;
@property (nonatomic, retain) NSString *pdphoto;
@property (nonatomic, retain) NSString *viewcount;
@property (nonatomic, retain) NSString *replycount;


@end
