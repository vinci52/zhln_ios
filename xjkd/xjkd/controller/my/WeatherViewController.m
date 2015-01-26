//
//  WeatherViewController.m
//  xjkd
//
//  Created by 聂宗波 on 15-1-14.
//  Copyright (c) 2015年 聂宗波. All rights reserved.
//

#import "WeatherViewController.h"
#import "SmartWeatherService.h"
#import "SlideNavigationController.h"

@interface WeatherViewController ()

@end

@implementation WeatherViewController{
    HttpApi* api;
}
@synthesize labelDate;
@synthesize labelName;
@synthesize labelTemp;
@synthesize img;
@synthesize labelName1;
@synthesize labelTemp1;
@synthesize img1;
@synthesize labelName2;
@synthesize labelTemp2;
@synthesize img2;
@synthesize labelName3;
@synthesize labelTemp3;
@synthesize img3;
@synthesize labelIndex;
@synthesize labelPub;
@synthesize btnBack;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    api = [HttpApi new];
    api.delegate = self;
    self.view.backgroundColor = [UIConfig getColor:@"545467"];
    [self.btnBack addTarget:self action:@selector(doBack) forControlEvents:UIControlEventTouchUpInside];
    [self showProccess];
    NSString *url = [SmartWeatherService getSmartWeatherUrl:@"forecast3d"];
    [api getSmartWeather:url];
    url = [SmartWeatherService getSmartWeatherUrl:@"index"];
    [api getSmartWeather:url];
    url = [SmartWeatherService getSmartWeatherUrl:@"observe"];
    [api getSmartWeather:url];
    
}

-(void)doBack{
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    [self backVC];
}
- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidDisappear:(BOOL)animated
{
    NSLog(@"dismiss");
    //[self.parentViewController.navigationController setNavigationBarHidden:NO animated:animated];
    //[[SlideNavigationController sharedInstance]setNavigationBarHidden:NO];
    [super viewDidDisappear:animated];
}

- (void)httpCallback:(RspResultModel*)rsp requestCode:(NSString*)code{
    DLog(@"callback");
    [self closeProccess];
    if([self isRspOk:rsp]){
        if(rsp.f!=nil){
            SWFrontcastDayModel*today = [rsp.f.f1 objectAtIndex:0];
            labelName.text = [today getWeatherName];
            
            [img setImage:[UIImage imageNamed:[today getWeatherImg]]];
            labelDate.text = [NSString stringWithFormat:@"%@ %@ 农历%@",[CommonUtil fmtNowDate:@"yyyy-MM-dd"],[CommonUtil getWeekDay],[CommonUtil getChineseCalendarWithDate:[NSDate date]]];
            labelName1.text = [today getWeatherName];
            labelTemp1.text = [NSString stringWithFormat:@"%@°C/%@°C",today.fc,today.fd];
            [img1 setImage:[UIImage imageNamed:[today getWeatherImg]]];
            if(rsp.f.f1.count>1){
                SWFrontcastDayModel*day2 = [rsp.f.f1 objectAtIndex:1];
                labelName2.text = [day2 getWeatherName];
                labelTemp2.text = [NSString stringWithFormat:@"%@°C/%@°C",day2.fc,day2.fd];
                [img2 setImage:[UIImage imageNamed:[day2 getWeatherImg]]];
            }
            if(rsp.f.f1.count>2){
                SWFrontcastDayModel*day3 = [rsp.f.f1 objectAtIndex:2];
                labelName3.text = [day3 getWeatherName];
                labelTemp3.text = [NSString stringWithFormat:@"%@°C/%@°C",day3.fc,day3.fd];
                [img3 setImage:[UIImage imageNamed:[day3 getWeatherImg]]];
            }
            
            
        }
        else if(rsp.i!=nil&&rsp.i.count>0){
            SWIndexModel* indexModel = [rsp.i objectAtIndex:0];
            labelIndex.text = indexModel.i5;
        }
        else if(rsp.l!=nil){
            labelTemp.text = [NSString stringWithFormat:@"%@°C",rsp.l.l1];
            labelPub.text = [NSString stringWithFormat:@"%@发布",rsp.l.l7];
        }
    }
    else{
        
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
