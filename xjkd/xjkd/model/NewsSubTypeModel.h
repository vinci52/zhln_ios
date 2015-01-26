//
//  NewsSubTypeModel.h
//  xjkd
//
//  Created by 聂宗波 on 14-12-8.
//  Copyright (c) 2014年 聂宗波. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Jastor.h"

@interface NewsSubTypeModel : Jastor
{	NSString *_id;
	NSString *_name;
}

@property (nonatomic, retain) NSString *id;
@property (nonatomic, retain) NSString *name;


@end
