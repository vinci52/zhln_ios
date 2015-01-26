//
//  MySetViewController.m
//  xjkd
//
//  Created by 聂宗波 on 15-1-12.
//  Copyright (c) 2015年 聂宗波. All rights reserved.
//

#import "MySetViewController.h"
#import "HttpApi.h"

@interface MySetViewController ()

@end

@implementation MySetViewController{
    NSMutableArray *list;
    HttpApi* api;
}
@synthesize tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initNavBar:@"设置"];
    list = [NSMutableArray arrayWithObject:[KeyValueObj newObj:@"清理缓存" name:@"clean_up"]];
    [list addObject:[KeyValueObj newObj:@"接收消息通知" name:@"push_notification"]];
    [list addObject:[KeyValueObj newObj:@"意见反馈" name:@"feedback"]];
    [list addObject:[KeyValueObj newObj:@"检测版本" name:@"updates"]];
    [list addObject:[KeyValueObj newObj:@"关于我们" name:@"set_logo"]];
    api = [HttpApi new];
    api.delegate = self;
    self.automaticallyAdjustsScrollViewInsets = NO;;
    [self setExtraCellLineHidden:self.tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    KeyValueObj *item = [list objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:spid];
    if(cell==nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:spid];
    }
    cell.tag = indexPath.row;
    UILabel* label = (UILabel*)[cell viewWithTag:12];
    UIImageView* img = (UIImageView*)[cell viewWithTag:11];
    UISwitch* sw = (UISwitch*)[cell viewWithTag:13];
    cell.tag = indexPath.row;
    
    label.text = item.code;
    [img setImage:[UIImage imageNamed:item.name]];
    if(indexPath.row==1){
        [sw setHidden:false];
    }
    else{
        [sw setHidden:true];
    }
    
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    //[cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    //[self performSegueWithIdentifier:@"gotorestdetail" sender:self];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if(indexPath.row==0){
        [self.view makeToast:@"设置成功"];
    }
    else if(indexPath.row==1){
        //[self.view makeToast:@"设置成功"];
    }
    else if(indexPath.row==2){
        //[self.view makeToast:@"设置成功"];
        FeedBackViewController *vc;
        UIStoryboard *cgrvcStory = [UIStoryboard storyboardWithName:@"MyStoryboard"
                                                             bundle: nil];
        vc = [cgrvcStory instantiateViewControllerWithIdentifier: @"FeedBackViewController"];
        [self.navigationController pushViewController:vc animated:YES];
    }else if(indexPath.row==3){
        [self.view makeToast:@"当前是最新版本，无需更新"];
    }
    else if(indexPath.row==4){
        //[self.view makeToast:@"设置成功"];
        AboutViewController *vc;
        UIStoryboard *cgrvcStory = [UIStoryboard storyboardWithName:@"MyStoryboard"
                                                             bundle: nil];
        vc = [cgrvcStory instantiateViewControllerWithIdentifier: @"AboutViewController"];
        [self.navigationController pushViewController:vc animated:YES];

    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60.0f;
}

- (void)setExtraCellLineHidden: (UITableView *)tableView{
    UIView *view =[ [UIView alloc]init];
    view.backgroundColor = [UIColor clearColor];
    [tableView setTableFooterView:view];
    [tableView setTableHeaderView:view];
}


#pragma
- (void)httpCallback:(RspResultModel*)rsp requestCode:(NSString*)code{
    DLog(@"callback");
    if([@"0" isEqualToString:rsp.retcode]){
        
    }
}

- (void)loginDone{
    DLog(@"callback--");
    [self.tableView reloadData];
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
