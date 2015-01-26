//
//  DataCache.m
//  xjkd
//
//  Created by 聂宗波 on 15-1-9.
//  Copyright (c) 2015年 聂宗波. All rights reserved.
//

#import "DataCache.h"

@implementation DataCache
+(void)setObject:(NSString*)key value:(NSObject*)obj{
    NSUserDefaults * setting = [NSUserDefaults standardUserDefaults];
    NSData *udObject = [NSKeyedArchiver archivedDataWithRootObject:obj];
    [setting setObject:udObject forKey:key];
    [setting synchronize];
}
+(NSObject*)getObject:(NSString*)key{
    NSUserDefaults * settings = [NSUserDefaults standardUserDefaults];
    NSData *udObject = [settings objectForKey:key];
    NSObject* obj = [NSKeyedUnarchiver unarchiveObjectWithData:udObject] ;
    return obj;
}
@end
