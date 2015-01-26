//
//  HostViewController.m
//  ICViewPager
//
//  Created by Ilter Cengiz on 28/08/2013.
//  Copyright (c) 2013 Ilter Cengiz. All rights reserved.
//

#import "HostViewController.h"
#import "ContentViewController.h"
#import "MJTableViewController.h"

@interface HostViewController () <SlideNavigationControllerDelegate,ViewPagerDataSource, ViewPagerDelegate>

@property (nonatomic) NSUInteger numberOfTabs;

@end

@implementation HostViewController{
    CGFloat width;
    NSMutableArray* array;
}
@synthesize newsType;

- (void)viewDidLoad {
    
    [super viewDidLoad];
    NSLog(@"did load");
    self.dataSource = self;
    self.delegate = self;
    
    CGRect rect = [[UIScreen mainScreen] bounds];
    CGSize size = rect.size;
    width = size.width;
    array = newsType.subtypes;
    self.navigationItem.title = newsType.name;
    [[NSNotificationCenter defaultCenter] addObserverForName:@"menuleftgroup" object:nil queue:nil usingBlock:^(NSNotification *note) {
        NewsTypeModel *type = note.userInfo[@"newstype"];
        NSLog(@"Opened %@", type.name);
        newsType = type;
        array = type.subtypes;
        [self setNumberOfTabs:type.subtypes.count];
        self.navigationItem.title = type.name;
        //[self reloadData];
        
        
    }];
    [self performSelector:@selector(loadContent) withObject:nil afterDelay:0.0];
    
}
- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    //
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    [self selectTabAtIndex:0];
}
- (void)loadContent {
    self.numberOfTabs = array.count;
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
    NSLog(@"index-----:%d",index);
    NewsTypeModel *item = [array objectAtIndex:index];
    UILabel *label = [UILabel new];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:13.0];
    label.text = item.name;
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIConfig getColor:title_text_color];
    [label sizeToFit];
    
    return label;
}

- (UIViewController *)viewPager:(ViewPagerController *)viewPager contentViewControllerForTabAtIndex:(NSUInteger)index {
    NSLog(@"index:%d",index);
    NewsTypeModel *item = [array objectAtIndex:index];
    NewsTabViewController *vc;
    UIStoryboard *cgrvcStory = [UIStoryboard storyboardWithName:@"NewsStoryboard"
                                                         bundle: nil];
    vc = [cgrvcStory instantiateViewControllerWithIdentifier: @"NewsTabViewController"];
    item.parentid = newsType.id;
    vc.newsType = item;
    //[self.navigationController pushViewController:vc animated:YES];
    return vc;
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
#pragma mark - SlideNavigationController Methods -
- (BOOL)slideNavigationControllerShouldDisplayLeftMenu
{
    return YES;
}

- (BOOL)slideNavigationControllerShouldDisplayRightMenu
{
    return YES;
}

@end
