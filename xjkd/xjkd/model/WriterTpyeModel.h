//
//  WriterTpyeModel.h
//  xjkd
//
//  Created by 聂宗波 on 14-12-8.
//  Copyright (c) 2014年 聂宗波. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WriterTpyeModel : NSObject
{	NSString *_id;
	NSString *_type;
	NSString *_tycode;
	NSString *_typeName;
}

@property (nonatomic, retain) NSString *id;
@property (nonatomic, retain) NSString *type;
@property (nonatomic, retain) NSString *tycode;
@property (nonatomic, retain) NSString *typeName;


@end
