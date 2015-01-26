//
//  SWFrontcastDayModel.m
//  xjkd
//
//  Created by 聂宗波 on 14-12-8.
//  Copyright (c) 2014年 聂宗波. All rights reserved.
//

#import "SWFrontcastDayModel.h"

@implementation SWFrontcastDayModel

@synthesize fa = _fa;
@synthesize fb = _fb;
@synthesize fc = _fc;
@synthesize fd = _fd;
@synthesize fe = _fe;
@synthesize ff = _ff;
@synthesize fg = _fg;
@synthesize fh = _fh;
@synthesize fi = _fi;


- (void)dealloc
{

}
- (void)encodeWithCoder:(NSCoder *)coder {
	[coder encodeObject:self.fa forKey:@"fa"];
	[coder encodeObject:self.fb forKey:@"fb"];
	[coder encodeObject:self.fc forKey:@"fc"];
	[coder encodeObject:self.fd forKey:@"fd"];
	[coder encodeObject:self.fe forKey:@"fe"];
	[coder encodeObject:self.ff forKey:@"ff"];
	[coder encodeObject:self.fg forKey:@"fg"];
	[coder encodeObject:self.fh forKey:@"fh"];
	[coder encodeObject:self.fi forKey:@"fi"];
}

- (id)initWithCoder:(NSCoder *)coder {
	if ((self = [super init]) != nil) {
		self.fa = [coder decodeObjectForKey:@"fa"];
		self.fb = [coder decodeObjectForKey:@"fb"];
		self.fc = [coder decodeObjectForKey:@"fc"];
		self.fd = [coder decodeObjectForKey:@"fd"];
		self.fe = [coder decodeObjectForKey:@"fe"];
		self.ff = [coder decodeObjectForKey:@"ff"];
		self.fg = [coder decodeObjectForKey:@"fg"];
		self.fh = [coder decodeObjectForKey:@"fh"];
		self.fi = [coder decodeObjectForKey:@"fi"];
	}
	return self;
}

-(NSString*)getWeatherName{
    
    int index = [self.fa intValue];
    NSString* name = @"";
    if([self getCurHour]>18){
        index = [self.fb intValue];
    }
    
    switch (index) {
        case 0:
            name = @"晴";
        break;
        
        case 1:
        name = @"多云";
        break;
        
        
        case 3:
        name = @"阵雨";
        break;
        
        case 4:
        name = @"雷阵雨";
        break;
        
        case 5:
        name = @"雷阵雨伴有冰雹";
        break;
        
        case 6:
        name = @"雨夹雪";
        break;
        
        case 7:
        name = @"小雨";
        break;
        
        case 8:
        name = @"中雨";
        break;
        
        case 9:
        name = @"大雨";
        break;
        
        case 10:
        name = @"暴雨";
        break;
        
        case 11:
        name = @"大暴雨";
        break;
        
        case 12:
        name = @"特大暴雨";
        break;
        
        case 13:
        name = @"阵雪";
        break;
        
        case 14:
        name = @"小雪";
        break;
        
        case 15:
        name = @"中雪";
        break;
        
        case 16:
        name = @"大雪";
        break;
        
        case 17:
        name = @"暴雪";
        break;
        
        case 18:
        name = @"雾";
        break;
        
        case 19:
        name = @"冻雨";
        break;
        
        case 20:
        name = @"沙尘暴";
        break;
        
        case 21:
        name = @"小到中雨";
        break;
        
        case 22:
        name = @"中到大雨";
        break;
        
        case 23:
        name = @"大到暴雨";
        break;
        
        case 24:
        name = @"暴雨到大暴雨";
        break;
        
        case 25:
        name = @"大暴雨到特大暴雨";
        break;
        
        case 26:
        name = @"小到中雪";
        break;
        
        case 27:
        name = @"中到大雪";
        break;
        
        case 28:
        name = @"大到暴雪";
        break;
        
        case 29:
        name = @"浮尘";
        break;
        
        case 30:
        name = @"扬沙";
        break;
        
        case 31:
        name = @"强沙尘暴";
        break;
        
        case 53:
        name = @"霾";
        break;
        
        default:name = @"未知";
        break;
    }
    return name;
    
}
-(NSString*)getWeatherImg{
    if([self getCurHour]>18){
        return [NSString stringWithFormat:@"night_%@",self.fb];
    }
    else{
        return [NSString stringWithFormat:@"day_%@",self.fa];
    }
}
-(int)getCurHour{
    NSDate *date = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH"];
    NSString *strHour = [dateFormatter stringFromDate:date];
    return [strHour intValue];
}


@end
