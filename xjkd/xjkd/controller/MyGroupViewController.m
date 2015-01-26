//
//  HostViewController.m
//  ICViewPager
//
//  Created by Ilter Cengiz on 28/08/2013.
//  Copyright (c) 2013 Ilter Cengiz. All rights reserved.
//

#import "MyGroupViewController.h"
#import "ContentViewController.h"
#import "MJTableViewController.h"
#import "KeyValueObj.h"
#import "NodataTableViewController.h"

@interface MyGroupViewController () <ViewPagerDataSource, ViewPagerDelegate>

@property (nonatomic) NSUInteger numberOfTabs;

@end

@implementation MyGroupViewController{
    NSMutableArray* list;
    CGFloat width;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIConfig getColor:app_bg];
    self.dataSource = self;
    self.delegate = self;
    [self initNavBar:@"我的"];
    list = [NSMutableArray arrayWithObject:@"信件"];
    [list addObject:@"评论"];
    [list addObject:@"收藏"];
    CGRect rect = [[UIScreen mainScreen] bounds];
    CGSize size = rect.size;
    width = size.width;
    
}

-(void)initNavBar:(NSString*)title{
    self.navigationItem.title = title;
    UIButton *button  = [[UIButton alloc] initWithFrame:CGRectMake(5, 0, 11, 21)];
    [button setImage:[UIImage imageNamed:@"back_btn_normal"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"back_btn_press"] forState:UIControlStateSelected];
    [button addTarget:self action:@selector(backVC) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem= [[UIBarButtonItem alloc] initWithCustomView:button];
}
- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    [self performSelector:@selector(loadContent) withObject:nil afterDelay:0.0];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)backVC
{
    
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Setters
- (void)setNumberOfTabs:(NSUInteger)numberOfTabs {
    
    // Set numberOfTabs
    _numberOfTabs = numberOfTabs;
    
    // Reload data
    [self reloadData];
    
}

#pragma mark - Helpers
- (void)selectTabWithNumberFive {
    [self selectTabAtIndex:2];
}
- (void)loadContent {
    self.numberOfTabs = 3;
}

#pragma mark - Interface Orientation Changes
- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    
    // Update changes after screen rotates
    [self performSelector:@selector(setNeedsReloadOptions) withObject:nil afterDelay:duration];
}

#pragma mark - ViewPagerDataSource
- (NSUInteger)numberOfTabsForViewPager:(ViewPagerController *)viewPager {
    return self.numberOfTabs;
}
- (UIView *)viewPager:(ViewPagerController *)viewPager viewForTabAtIndex:(NSUInteger)index {
    
    UILabel *label = [UILabel new];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:13.0];
    label.text = [list objectAtIndex:index];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIConfig getColor:title_text_color];
    [label sizeToFit];

    return label;
}

- (UIViewController *)viewPager:(ViewPagerController *)viewPager contentViewControllerForTabAtIndex:(NSUInteger)index {
    
    /**
    ContentViewController *cvc = [self.storyboard instantiateViewControllerWithIdentifier:@"contentViewController"];
    
    cvc.labelString = [NSString stringWithFormat:@"Content View #%i", index];
    **/
    NodataTableViewController *cvc = [[NodataTableViewController alloc] init];
    return cvc;
}

#pragma mark - ViewPagerDelegate
- (CGFloat)viewPager:(ViewPagerController *)viewPager valueForOption:(ViewPagerOption)option withDefault:(CGFloat)value {
    
    switch (option) {
        case ViewPagerOptionStartFromSecondTab:
        return 0.0;
        case ViewPagerOptionCenterCurrentTab:
        return 1.0;
        case ViewPagerOptionTabLocation:
        return 1.0;
        case ViewPagerOptionTabHeight:
        return 40.0;
        case ViewPagerOptionTabOffset:
        return 36.0;
        case ViewPagerOptionTabWidth:
        return self.numberOfTabs>5?width/5:width/self.numberOfTabs;
        case ViewPagerOptionFixFormerTabsPositions:
        return 0.0;
        case ViewPagerOptionFixLatterTabsPositions:
        return 0.0;
        default:
        return value;
    }
}
- (UIColor *)viewPager:(ViewPagerController *)viewPager colorForComponent:(ViewPagerComponent)component withDefault:(UIColor *)color {
    
    switch (component) {
        case ViewPagerIndicator:
        return [[UIConfig getColor:title_text_color] colorWithAlphaComponent:0.64];
        case ViewPagerTabsView:
        return [[UIColor lightGrayColor] colorWithAlphaComponent:0.32];
        case ViewPagerContent:
        return [[UIColor darkGrayColor] colorWithAlphaComponent:0.32];
        default:
        return color;
    }
}

@end
