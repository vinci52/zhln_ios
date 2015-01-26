//
//  KeyValueObj.h
//  xjkd
//
//  Created by 聂宗波 on 15-1-11.
//  Copyright (c) 2015年 聂宗波. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KeyValueObj : NSObject
@property (nonatomic, retain) NSString *code;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *url;

+(KeyValueObj*)newObj:(NSString*)code name:(NSString*)name;
@end
