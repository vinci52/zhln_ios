//
//  Hmacsha.h
//  xjkd
//
//  Created by 聂宗波 on 15-1-13.
//  Copyright (c) 2015年 聂宗波. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <CommonCrypto/CommonDigest.h>
#include <CommonCrypto/CommonHMAC.h>

#include "Base64.h"
@interface Hmacsha : NSObject
+ (NSString *)hmacsha1:(NSString *)text key:(NSString *)secret;
@end
