//
//  UserInfoViewController.m
//  xjkd
//
//  Created by 聂宗波 on 15-1-11.
//  Copyright (c) 2015年 聂宗波. All rights reserved.
//

#import "UserInfoViewController.h"
#import "UIImageView+WebCache.h"
#import "UserModifyViewController.h"
#import "UserModifyPwdViewController.h"

@interface UserInfoViewController (){
    UserInfoModel *user;
}

@end

@implementation UserInfoViewController
@synthesize btnModifyInfo;
@synthesize btnModifyPwd;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self refreshUI];
    // Do any additional setup after loading the view.
    [self setItemSelector:btnModifyInfo bgColor:[UIConfig getColor:app_bg]];
    [self setItemSelector:btnModifyPwd bgColor:[UIConfig getColor:app_bg]];
    [self initNavBar:@"用户信息"];

    [self.btnLoginOut addTarget:self action:@selector(loginOutOnclick) forControlEvents:UIControlEventTouchUpInside];
    [self.btnModifyInfo addTarget:self action:@selector(modifyOnclick) forControlEvents:UIControlEventTouchUpInside];
    [self.btnModifyPwd addTarget:self action:@selector(modifyPwdOnclick) forControlEvents:UIControlEventTouchUpInside];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(notificationExecute:)
                                                 name:@"LOGIN"
                                               object:nil];
    
   
}

-(void)refreshUI{
    user = [[MyApp getInstance]getUserInfo];
    if(user){
        self.tfName.text = user.username;
        self.tfPhone.text = [NSString stringWithFormat:@"绑定手机:%@",user.phone];
        [self.ivLogo sd_setImageWithURL:[NSURL URLWithString:user.photo] placeholderImage:[UIImage imageNamed:@"placeholder_c"]];
    }
}

- (void)notificationExecute:(NSNotification *)notification {
    //do something when received notification
    //notification.name is @"NOTIFICATION_NAME"
    [self refreshUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loginOutOnclick{
    [[MyApp getInstance]setUserInfo:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"LOGIN"
                                                        object:nil];
     [self.navigationController popToRootViewControllerAnimated:true];
}

-(void)modifyPwdOnclick{
    UserModifyPwdViewController *vc;
    UIStoryboard *cgrvcStory = [UIStoryboard storyboardWithName:@"UserStoryboard"
                                                         bundle: nil];
    vc = [cgrvcStory instantiateViewControllerWithIdentifier: @"UserModifyPwdViewController"];
    
    [self.navigationController pushViewController:vc animated:YES];

}

-(void)modifyOnclick{
    UserModifyViewController *vc;
    UIStoryboard *cgrvcStory = [UIStoryboard storyboardWithName:@"UserStoryboard"
                                                         bundle: nil];
    vc = [cgrvcStory instantiateViewControllerWithIdentifier: @"UserModifyViewController"];
    
    [self.navigationController pushViewController:vc animated:YES];
    
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
