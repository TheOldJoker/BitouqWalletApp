//
//  BWWalletViewController.m
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/11/27.
//  Copyright © 2018 Joker. All rights reserved.
//

#import "BWWalletViewController.h"
#import "BWWalletTopSelectedView.h"
#import "BWWalletOverviewViewController.h"
#import "BWWalletSendViewController.h"
#import "BWWalletGetViewController.h"
@interface BWWalletViewController ()<UIScrollViewDelegate,BWWalletTopSelectedViewDelegate>
@property (nonatomic, strong) BWWalletTopSelectedView *topSelectedView;
@property (nonatomic, strong) UIScrollView *mainScrollView;
@property (nonatomic, strong) BWWalletOverviewViewController *overviewViewController;
@property (nonatomic, strong) BWWalletSendViewController *sendViewController;
@property (nonatomic, strong) BWWalletGetViewController *getViewController;
@end

@implementation BWWalletViewController
- (void)viewWillAppear:(BOOL)animated{
    [self initDataSource];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"錢包";
    [self initMenuNav];
    [self initChildViewController];
}
#pragma mark - func
-(void)initChildViewController{
    [self addChildViewController:self.overviewViewController];
    [self addChildViewController:self.sendViewController];
    [self addChildViewController:self.getViewController];
}
//首次加载数据
- (void)initDataSource{
    //如果用户未登录z,不请求
    if (stringIsEmpty([BWUserManager shareManager].user.privatekey)) {
        return;
    }
    [self.overviewViewController loadData];
    [self.sendViewController loadData];
    [self.getViewController loadData];
}
- (void)loadData{
    //如果用户未登录z,不请求
    if (stringIsEmpty([BWUserManager shareManager].user.privatekey)) {
        return;
    }
    switch (self.topSelectedView.selectedIndex) {
        case 0:
        {
                [self.overviewViewController loadData];
        }
            break;
        case 1:
        {
            [self.sendViewController loadData];
        }
            break;
        case 2:
        {
            [self.getViewController loadData];
        }
            break;
        default:
            break;
    }
}
#pragma mark - lazyload
- (BWWalletTopSelectedView *)topSelectedView{
    if (!_topSelectedView) {
        _topSelectedView = [[BWWalletTopSelectedView alloc] initWithFrame:(CGRectMake(0, self.customNavTitleLabel.bottom + 15, SCREEN_WIDTH, 50))];
        [_topSelectedView initConfig];
        _topSelectedView.delegate = self;
        [self.view addSubview:_topSelectedView];
    }
    return _topSelectedView;
}
- (UIScrollView *)mainScrollView{
    if (!_mainScrollView) {
        _mainScrollView = [[UIScrollView alloc] initWithFrame:(CGRectMake(0, self.topSelectedView.bottom, SCREEN_WIDTH, SCREEN_HEIGHT - self.topSelectedView.bottom))];
        _mainScrollView.showsVerticalScrollIndicator = NO;
        _mainScrollView.showsHorizontalScrollIndicator = NO;
        _mainScrollView.contentSize = CGSizeMake(SCREEN_WIDTH * 3, _mainScrollView.height);
        _mainScrollView.backgroundColor = [UIColor whiteColor];
//        _mainScrollView.userInteractionEnabled = NO;
        _mainScrollView.delegate = self;
        _mainScrollView.pagingEnabled = YES;
        [self.view addSubview:_mainScrollView];
    }
    return _mainScrollView;
}
- (BWWalletOverviewViewController *)overviewViewController{
    if (!_overviewViewController) {
        _overviewViewController = [[BWWalletOverviewViewController alloc] init];
        _overviewViewController.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, self.mainScrollView.height);
        [self.mainScrollView addSubview:_overviewViewController.view];
    }
    return _overviewViewController;
}
- (BWWalletSendViewController *)sendViewController{
    if (!_sendViewController) {
        _sendViewController = [[BWWalletSendViewController alloc] init];
        _sendViewController.view.frame = CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, self.mainScrollView.height);
        [self.mainScrollView addSubview:_sendViewController.view];
    }
    return _sendViewController;
}
- (BWWalletGetViewController *)getViewController{
    if (!_getViewController) {
        _getViewController = [[BWWalletGetViewController alloc] init];
        _getViewController.view.frame = CGRectMake(SCREEN_WIDTH * 2, 0, SCREEN_WIDTH, self.mainScrollView.height);
        [self.mainScrollView addSubview:_getViewController.view];
    }
    return _getViewController;
}
#pragma mark - buttonAction
#pragma mark - BWWalletTopSelectedViewDelegate
- (void)topSelectedViewSelectedIndex:(NSInteger)index{
    [self.mainScrollView setContentOffset:(CGPointMake(SCREEN_WIDTH * index, 0)) animated:YES];
    [self loadData];
}
#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    self.topSelectedView.selectedIndex = scrollView.contentOffset.x / scrollView.width;
    [self loadData];
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
