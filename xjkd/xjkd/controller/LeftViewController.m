//
//  LeftViewController.m
//  xjkd
//
//  Created by 聂宗波 on 15-1-7.
//  Copyright (c) 2015年 聂宗波. All rights reserved.
//
#define MJRandomColor [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1]
#import "LeftViewController.h"
#import "LeftMenuViewController.h"
#import "SlideNavigationContorllerAnimatorFade.h"
#import "SlideNavigationContorllerAnimatorSlide.h"
#import "SlideNavigationContorllerAnimatorScale.h"
#import "SlideNavigationContorllerAnimatorScaleAndFade.h"
#import "SlideNavigationContorllerAnimatorSlideAndFade.h"
#import "HostViewController.h"
#import "NewsService.h"
#import "WebWithBottomViewController.h"

@interface LeftViewController (){
    NSMutableArray *newsTypeArray;
}
@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [CommonUtil hexStringToColor:@"#0f93b8"];
    newsTypeArray = [NewsService getNewsType];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (id)initWithCoder:(NSCoder *)aDecoder
{
    self.slideOutAnimationEnabled = YES;
    
    return [super initWithCoder:aDecoder];
}

#pragma mark - collection数据源代理
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [newsTypeArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    /**
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"leftMenuCell" forIndexPath:indexPath];
    cell.backgroundColor = self.fakeColors[indexPath.row];
     UITableViewCellStyleDefault
     **/
    static NSString *spid = @"leftMenuCell";
    NewsTypeModel *type = [newsTypeArray objectAtIndex:indexPath.row];
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:spid forIndexPath:indexPath];
    UILabel *nameLabel = (UILabel*)[cell viewWithTag:2];
    [nameLabel setText:type.name];
    UIButton *btn = (UIButton*)[cell viewWithTag:1];
    [btn setBackgroundImage:[UIImage imageNamed:type.normalImg] forState:UIControlStateNormal];
    
    [btn setBackgroundImage:[UIImage imageNamed:type.selectImg] forState:UIControlStateNormal];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone"
                                                             bundle: nil];
    
    UIViewController *vc ;
    NewsTypeModel *type = [newsTypeArray objectAtIndex:indexPath.row];
    if([@"home" isEqualToString:type.id]){
        vc = [mainStoryboard instantiateViewControllerWithIdentifier: @"HomeViewController"];
    }
    else if([CommonUtil arrayIsNull:type.subtypes]
            &&[@"1" isEqualToString:type.hassub]){//专题
        NewsTypeModel *tempType = [NewsTypeModel new];
        
        NSString* code = type.id;
        tempType.parentid = type.id;
        tempType.id = @"0";
        tempType.name = type.name;
        NSDictionary *userInfo = @{ @"newstype" : tempType };
        [[NSNotificationCenter defaultCenter] postNotificationName:@"menuleftsub" object:nil userInfo:userInfo];
        SubNewsViewController* vc;
        
        UIStoryboard *cgrvcStory = [UIStoryboard storyboardWithName:@"NewsStoryboard"
                                                             bundle: nil];
        vc = [cgrvcStory instantiateViewControllerWithIdentifier: @"SubNewsViewController"];
        vc.newsType = tempType;

        [self selectMenu:vc];
        
        return;

        
    }
    else if([NEWS_SUBTYPE_WORD isEqualToString:type.type]
            ||[NEWS_SUBTYPE_VIDEO isEqualToString:type.type]
            ||[NEWS_SUBTYPE_PIC isEqualToString:type.type]){//一般图文
        if([CommonUtil arrayIsNull:type.subtypes]){
            
        }
        else{
            NSDictionary *userInfo = @{ @"newstype" : type };
            [[NSNotificationCenter defaultCenter] postNotificationName:@"menuleftgroup" object:nil userInfo:userInfo];
            HostViewController* vc = [mainStoryboard instantiateViewControllerWithIdentifier: @"ProfileViewController"];
            vc.newsType = type;
            [[SlideNavigationController sharedInstance] popToRootAndSwitchToViewController:vc
                                                                     withSlideOutAnimation:self.slideOutAnimationEnabled
                                                                             andCompletion:nil];
            return;
        }
        

    }
    else if([NEWS_SUBTYPE_WAP isEqualToString:type.type]){//wap
        WebWithBottomViewController *vc = [[WebWithBottomViewController alloc] init];
        UIStoryboard *cgrvcStory = [UIStoryboard storyboardWithName:@"WebViewStoryboard"
                                                             bundle: nil];
        vc = [cgrvcStory instantiateViewControllerWithIdentifier: @"WebWithBottomViewController"];
        vc.webUrl = type.outurl;
        vc.webType = type.id;
        
        NSDictionary *userInfo = @{ @"url" : type.outurl,@"title" : type.name };
        [[NSNotificationCenter defaultCenter] postNotificationName:@"menuleftweb" object:nil userInfo:userInfo];
        [self selectMenu:vc];
        return;
    }
    else{
        vc = [mainStoryboard instantiateViewControllerWithIdentifier: @"HomeViewController"];
    }
    [self selectMenu:vc];
    /**
    switch (indexPath.row)
    {
        case 0:
            vc = [mainStoryboard instantiateViewControllerWithIdentifier: @"HomeViewController"];
            break;
            
        case 1:
            vc = [mainStoryboard instantiateViewControllerWithIdentifier: @"ProfileViewController"];
            //vc = [[HostViewController alloc] init];
            break;
            
        case 2:
            vc = [mainStoryboard instantiateViewControllerWithIdentifier: @"FriendsViewController"];
            break;
            
        case 3:
            [[SlideNavigationController sharedInstance] popToRootViewControllerAnimated:YES];
            return;
            break;
    }
    **/
    
}

-(void)selectMenu:(UIViewController*) vc{
    [[SlideNavigationController sharedInstance] popToRootAndSwitchToViewController:vc
                                                             withSlideOutAnimation:self.slideOutAnimationEnabled
                                                                     andCompletion:nil];
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
