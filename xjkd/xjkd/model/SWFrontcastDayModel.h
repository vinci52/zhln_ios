//
//  SWFrontcastDayModel.h
//  xjkd
//
//  Created by 聂宗波 on 14-12-8.
//  Copyright (c) 2014年 聂宗波. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Jastor.h"
@interface SWFrontcastDayModel : Jastor
{	NSString *_fa;
	NSString *_fb;
	NSString *_fc;
	NSString *_fd;
	NSString *_fe;
	NSString *_ff;
	NSString *_fg;
	NSString *_fh;
	NSString *_fi;
}

@property (nonatomic, retain) NSString *fa;
@property (nonatomic, retain) NSString *fb;
@property (nonatomic, retain) NSString *fc;
@property (nonatomic, retain) NSString *fd;
@property (nonatomic, retain) NSString *fe;
@property (nonatomic, retain) NSString *ff;
@property (nonatomic, retain) NSString *fg;
@property (nonatomic, retain) NSString *fh;
@property (nonatomic, retain) NSString *fi;
-(NSString*)getWeatherName;
-(NSString*)getWeatherImg;


@end
