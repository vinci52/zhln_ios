//
//  SmartWeatherService.h
//  xjkd
//
//  Created by 聂宗波 on 15-1-13.
//  Copyright (c) 2015年 聂宗波. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Base64.h"
#import "Hmacsha.h"
#import "CoreConstants.h"

@interface SmartWeatherService : NSObject
+(NSString*)getSmartWeatherUrl:(NSString*)type;
@end
