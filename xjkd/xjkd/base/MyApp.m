//
//  MyApp.m
//  xjkd
//
//  Created by 聂宗波 on 15-1-9.
//  Copyright (c) 2015年 聂宗波. All rights reserved.
//

#import "MyApp.h"
static MyApp* _myself;
@implementation MyApp{
    UserInfoModel *mUser;
    NSMutableDictionary* mLastLoadTime;
}
@synthesize leftMenuDic;
+ (MyApp*)getInstance
{
    if(_myself==nil){
        _myself =[MyApp new];
        
    }
    return _myself;
}
-(NSMutableDictionary*)getLeftMenuDic{
    if(leftMenuDic==nil){
        leftMenuDic = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"home_btn",@"home", nil];
        [leftMenuDic setObject:@"walk_kd_btn" forKey:@"10"];
        [leftMenuDic setObject:@"experiment_plot_btn" forKey:@"14"];
        [leftMenuDic setObject:@"xhsa_news_btn" forKey:@"60"];
        [leftMenuDic setObject:@"xinhua_btn" forKey:@"385"];
        [leftMenuDic setObject:@"net_btn" forKey:@"386"];
        [leftMenuDic setObject:@"news_btn" forKey:@"23"];
        [leftMenuDic setObject:@"reqiqiu_btn" forKey:@"27"];
        [leftMenuDic setObject:@"special_local_product_btn" forKey:@"28"];
        [leftMenuDic setObject:@"fine_food_btn" forKey:@"29"];
        [leftMenuDic setObject:@"photographer_btn" forKey:@"36"];
        [leftMenuDic setObject:@"convenience_services_btn" forKey:@"41"];
        [leftMenuDic setObject:@"e_mail_btn" forKey:@"390"];
        [leftMenuDic setObject:@"shop_btn" forKey:@"387"];
    }
    
    return  leftMenuDic;
}

-(UserInfoModel*)getUserInfo{
    if(mUser==nil){
        mUser = (UserInfoModel*)[DataCache getObject:KEY_USER];
    }
    return mUser;
}
-(void)setUserInfo:(UserInfoModel*)userInfo{
    mUser = userInfo;
    [DataCache setObject:KEY_USER value:userInfo];
}

-(void)setLastLoadTime:(NSString*)loadFlag{
    NSDate *date = [NSDate date];
    if(mLastLoadTime==nil){
        mLastLoadTime = [[NSMutableDictionary alloc] initWithObjectsAndKeys:date,loadFlag, nil];
    }
    else{
        [mLastLoadTime setObject:date forKey:loadFlag];
    }
    
}
-(BOOL)isNeedLoad:(NSString*)loadFlag{
    if(mLastLoadTime){
        NSDate* date = [mLastLoadTime objectForKey:loadFlag];
        if(date){
            NSDate* now = [NSDate date];
            NSTimeInterval secondsBetweenDates= [now timeIntervalSinceDate:date];
            NSLog(@"secondsBetweenDates=  %lf",secondsBetweenDates);
            if(secondsBetweenDates<2*60){
                NSLog(@"少于加载间隔，不用加载");
                return false;
            }
        }
    }
    return true;
}
@end
