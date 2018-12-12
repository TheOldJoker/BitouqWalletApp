//
//  BWMiningViewController.m
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/11/27.
//  Copyright © 2018 Joker. All rights reserved.
//

#import "BWMiningViewController.h"
#import "BWMiningTopSelectView.h"
#import "BWMiningVoteViewController.h"
#import "BWMiningProductionViewController.h"

@interface BWMiningViewController ()<BWMiningTopSelectViewDelegate,UIScrollViewDelegate>
@property (nonatomic, strong) BWMiningTopSelectView *topSelectedView;
@property (nonatomic, strong) UIScrollView *mainScrollView;
@property (nonatomic, strong) BWMiningVoteViewController *voteViewController;
@property (nonatomic, strong) BWMiningProductionViewController *productionViewController;
@property (nonatomic, strong)BWMiningOwnerRootModel *miningOwnerRootModel;

@end

@implementation BWMiningViewController
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    //獲取礦主信息
    [self loadMiningOwnerCompletion:^{
        [self loadData];
    }];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"挖礦";
    [self initMenuNav];
    [self initChildViewController];
}
#pragma mark - func
-(void)initChildViewController{
    [self addChildViewController:self.voteViewController];
    [self addChildViewController:self.productionViewController];
}
#pragma mark 獲取所有礦主信息
- (void)loadMiningOwnerCompletion:(void (^ __nullable)(void))completion{
    [BWDataSource getAllTheMineOwnerSuccess:^(id  _Nonnull response) {
        
        self.miningOwnerRootModel = [BWMiningOwnerRootModel mj_objectWithKeyValues:response];
        if (self.miningOwnerRootModel.errorCode == 0) {
            
        }
        completion();
    } fail:^(NSError * _Nonnull error) {
        completion();
    }];
}
- (void)loadData{
    self.voteViewController.miningOwnerRootModel = self.miningOwnerRootModel;
    self.productionViewController.miningOwnerRootModel = self.miningOwnerRootModel;
    //获取投票頁面數據
    if (self.topSelectedView.selectedIndex == 0) {
        [self.voteViewController loadData];
        return;
    }
    //获取生產頁面數據数据
    [self.productionViewController loadData];
}

#pragma mark - lazyload
- (BWMiningTopSelectView *)topSelectedView{
    if (!_topSelectedView) {
        _topSelectedView = [[BWMiningTopSelectView alloc] initWithFrame:(CGRectMake(0, self.customNavTitleLabel.bottom + 15, SCREEN_WIDTH, 50))];
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
        _mainScrollView.contentSize = CGSizeMake(SCREEN_WIDTH * 2, _mainScrollView.height);
        _mainScrollView.backgroundColor = [UIColor whiteColor];
        //        _mainScrollView.userInteractionEnabled = NO;
        _mainScrollView.delegate = self;
        _mainScrollView.pagingEnabled = YES;
        [self.view addSubview:_mainScrollView];
    }
    return _mainScrollView;
}
- (BWMiningVoteViewController *)voteViewController{
    if (!_voteViewController) {
        _voteViewController = [[BWMiningVoteViewController alloc] init];
        _voteViewController.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, self.mainScrollView.height);
        [self.mainScrollView addSubview:_voteViewController.view];
    }
    return _voteViewController;
}
- (BWMiningProductionViewController *)productionViewController{
    if (!_productionViewController) {
        _productionViewController = [[BWMiningProductionViewController alloc] init];
        _productionViewController.view.frame = CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, self.mainScrollView.height);
        [self.mainScrollView addSubview:_productionViewController.view];
    }
    return _productionViewController;
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
