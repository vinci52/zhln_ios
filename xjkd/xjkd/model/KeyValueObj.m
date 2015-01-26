//
//  KeyValueObj.m
//  xjkd
//
//  Created by 聂宗波 on 15-1-11.
//  Copyright (c) 2015年 聂宗波. All rights reserved.
//

#import "KeyValueObj.h"

@implementation KeyValueObj
@synthesize code;
@synthesize name;
@synthesize url;
+(KeyValueObj*)newObj:(NSString*)code name:(NSString*)name{
    KeyValueObj *obj = [KeyValueObj new];
    obj.code = code;
    obj.name = name ;
    return obj;
}
@end
