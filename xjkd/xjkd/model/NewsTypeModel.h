//
//  NewsTypeModel.h
//  xjkd
//
//  Created by 聂宗波 on 14-12-8.
//  Copyright (c) 2014年 聂宗波. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Jastor.h"
@interface NewsTypeModel : Jastor
{	NSString *_id;
	NSString *_name;
	NSString *_type;
	NSString *_hassub;
	NSMutableArray* _subtypes;
	NSString *_parentid;
	NSString *_ext;
	NSString *_outurl;
	NSString *_openreply;
    NSString *_normalImg;
    NSString *_selectImg;
}

@property (nonatomic, retain) NSString *id;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *type;
@property (nonatomic, retain) NSString *hassub;
@property (nonatomic, retain) NSMutableArray *subtypes;
@property (nonatomic, retain) NSString *parentid;
@property (nonatomic, retain) NSString *ext;
@property (nonatomic, retain) NSString *outurl;
@property (nonatomic, retain) NSString *openreply;
@property (nonatomic, retain) NSString *normalImg;
@property (nonatomic, retain) NSString *selectImg;

+(Class)subtypes_class;


@end
