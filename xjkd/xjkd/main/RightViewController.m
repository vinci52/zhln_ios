//
//  RightViewController.m
//  xjkd
//
//  Created by 聂宗波 on 15-1-11.
//  Copyright (c) 2015年 聂宗波. All rights reserved.
//

#import "RightViewController.h"

#import "UIImageView+WebCache.h"
#import "MyGroupViewController.h"
#import "SmartWeatherService.h"
#import "SmartWeatherService.h"

@interface RightViewController ()

@end

@implementation RightViewController{
    NSMutableArray *list;
    HttpApi* api;
}
@synthesize tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    api = [HttpApi new];
    api.delegate = self;
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [CommonUtil hexStringToColor:@"#0f93b8"];
    list = [NSMutableArray arrayWithObject:[KeyValueObj newObj:@"user" name:@""]];
    [list addObject:[KeyValueObj newObj:@"正在努力加载天气..." name:@"weather"]];
    [list addObject:[KeyValueObj newObj:@"我的" name:@"personalinformation"]];
    [list addObject:[KeyValueObj newObj:@"通知" name:@"tongzhi"]];
    [list addObject:[KeyValueObj newObj:@"设置" name:@"shezhi"]];
    self.tableView.separatorColor = [UIColor lightGrayColor];
    self.tableView.backgroundColor = [CommonUtil hexStringToColor:@"#0f93b8"];
    [self setExtraCellLineHidden:self.tableView];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(notificationExecute:)
                                                   name:@"LOGIN"
                                                 object:nil];
    [self doSmartWeather];
    
    
}

-(void)doSmartWeather{
    NSString *url = [SmartWeatherService getSmartWeatherUrl:@"forecast3d"];
    [api getSmartWeather:url];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"viewDidAppear");
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)notificationExecute:(NSNotification *)notification {
    //do something when received notification
    //notification.name is @"NOTIFICATION_NAME"
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(list==nil){
        return 0;
    }
    return list.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *spid = @"tablecell";
    UITableViewCell *cell;
    KeyValueObj *item = [list objectAtIndex:indexPath.row];
    if(indexPath.row==0){
        cell = [tableView dequeueReusableCellWithIdentifier:spid];
        if(cell==nil){
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:spid];
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"RightMenuCellUser" owner:nil options:nil];
            cell = [nib objectAtIndex:0];
        }
        UILabel* label = (UILabel*)[cell viewWithTag:12];
        UIImageView* img = (UIImageView*)[cell viewWithTag:11];
        UserInfoModel* user = [[MyApp getInstance]getUserInfo];
        if(user){
            label.text = user.username;
            //[img sd_setImageWithURL:[NSURL URLWithString:user.photo]];
            [img sd_setImageWithURL:[NSURL URLWithString:user.photo] placeholderImage:[UIImage imageNamed:@"placeholder_c"]];
        }
    }
    else{
        cell = [tableView dequeueReusableCellWithIdentifier:spid];
        if(cell==nil){
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"RightMenuCell" owner:nil options:nil];
            cell = [nib objectAtIndex:0];
        }
        UILabel* label = (UILabel*)[cell viewWithTag:22];
        UIImageView* img = (UIImageView*)[cell viewWithTag:21];
        label.text = item.code;
        [img setImage:[UIImage imageNamed:item.name]];
    }
    
    /**
    UIColor *color = [UIConfig getColor:@"#18225e"];//通过RGB来定义自己的颜色
    cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
    cell.selectedBackgroundView.backgroundColor = color;
    [cell.selectedBackgroundView setAlpha:0.3];
     **/
    cell.tag = indexPath.row;
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row==0){
        return 85;
    }
    else
        return 44;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    //[cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    //[self performSegueWithIdentifier:@"gotorestdetail" sender:self];
    if(indexPath.row==0){
        UserInfoModel* user = [[MyApp getInstance]getUserInfo];
        if(user==nil){
            LoginViewController *vc;
            UIStoryboard *cgrvcStory = [UIStoryboard storyboardWithName:@"UserStoryboard"
                                                                 bundle: nil];
            vc = [cgrvcStory instantiateViewControllerWithIdentifier: @"LoginViewController"];
            vc.delegate = self;
            [[SlideNavigationController sharedInstance] pushViewController:vc animated:YES];
        }
        else{
            UserInfoViewController *vc;
            UIStoryboard *cgrvcStory = [UIStoryboard storyboardWithName:@"UserStoryboard"
                                                                 bundle: nil];
            vc = [cgrvcStory instantiateViewControllerWithIdentifier: @"UserInfoViewController"];
            [[SlideNavigationController sharedInstance] pushViewController:vc animated:YES];
        }

        
        
    }
    else if(indexPath.row==1){
        WeatherViewController *vc;
        UIStoryboard *cgrvcStory = [UIStoryboard storyboardWithName:@"MyStoryboard"
                                                             bundle: nil];
        vc = [cgrvcStory instantiateViewControllerWithIdentifier: @"WeatherViewController"];
        [[SlideNavigationController sharedInstance] pushViewController:vc animated:NO];
    }
    else if(indexPath.row==3){
        MyNotifyViewController *vc;
        UIStoryboard *cgrvcStory = [UIStoryboard storyboardWithName:@"MyStoryboard"
                                                             bundle: nil];
        vc = [cgrvcStory instantiateViewControllerWithIdentifier: @"MyNotifyViewController"];
        [[SlideNavigationController sharedInstance] pushViewController:vc animated:NO];
    }
    else if(indexPath.row==4){
        MySetViewController *vc;
        UIStoryboard *cgrvcStory = [UIStoryboard storyboardWithName:@"MyStoryboard"
                                                             bundle: nil];
        vc = [cgrvcStory instantiateViewControllerWithIdentifier: @"MySetViewController"];
        [[SlideNavigationController sharedInstance] pushViewController:vc animated:NO];
    }
    else if(indexPath.row==2){
        UserInfoModel* user = [[MyApp getInstance]getUserInfo];
        if(user==nil){
            LoginViewController *vc;
            UIStoryboard *cgrvcStory = [UIStoryboard storyboardWithName:@"UserStoryboard"
                                                                 bundle: nil];
            vc = [cgrvcStory instantiateViewControllerWithIdentifier: @"LoginViewController"];
            vc.delegate = self;
            [[SlideNavigationController sharedInstance] pushViewController:vc animated:NO];
        }
        else {
            MyGroupViewController*vc;
            vc = [[MyGroupViewController alloc]init];
            [[SlideNavigationController sharedInstance] pushViewController:vc animated:NO];
        }
       
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


#pragma
- (void)httpCallback:(RspResultModel*)rsp requestCode:(NSString*)code{
    DLog(@"callback");
    if([@"0" isEqualToString:rsp.retcode]){
        SWFrontcastDayModel* dayFront = [rsp.f.f1 objectAtIndex:0];
        [list setObject:[KeyValueObj newObj:[NSString stringWithFormat:@"宽甸%@°C/%@°C",dayFront.fc,dayFront.fd] name:@"weather"] atIndexedSubscript:1];
        NSLog(@"宽甸%@°C/%@°C",dayFront.fc,dayFront.fd);
        [self.tableView reloadData];
    }
}

- (void)loginDone{
    DLog(@"callback--");
    [self.tableView reloadData];
}


- (void)setExtraCellLineHidden: (UITableView *)tableView{
    UIView *view =[ [UIView alloc]init];
    view.backgroundColor = [UIColor clearColor];
    [tableView setTableFooterView:view];
    [tableView setTableHeaderView:view];
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
