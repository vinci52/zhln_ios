//
//  SWFrontcastModel.h
//  xjkd
//
//  Created by 聂宗波 on 14-12-8.
//  Copyright (c) 2014年 聂宗波. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Jastor.h"
#import "SWFrontcastDayModel.h"
@interface SWFrontcastModel : Jastor
{	NSMutableArray* _f1;
	NSString *_f0;
}

@property (nonatomic, retain) NSMutableArray *f1;
@property (nonatomic, retain) NSString *f0;
+(Class)f1_class;

@end
