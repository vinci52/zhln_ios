//
//  InvestigateModel.h
//  xjkd
//
//  Created by 聂宗波 on 14-12-8.
//  Copyright (c) 2014年 聂宗波. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InvestigateModel : NSObject
{	NSString *_id;
	NSString *_title;
	NSString *_type;
	NSString *_voteCount;
	NSString *_status;
	NSString *_reserved;
}

@property (nonatomic, retain) NSString *id;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *type;
@property (nonatomic, retain) NSString *voteCount;
@property (nonatomic, retain) NSString *status;
@property (nonatomic, retain) NSString *reserved;


@end
