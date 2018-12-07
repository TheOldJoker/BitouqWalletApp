//
//  BWWalletOverviewViewController.m
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/4.
//  Copyright © 2018 Joker. All rights reserved.
//

#import "BWWalletOverviewViewController.h"
#import "BWWalletPublickeyInfoView.h"
#import "BWWalletOverviewActivityView.h"
#import "BWUserAssetRootModel.h"
#import "BWWalletActivityRootModel.h"
@interface BWWalletOverviewViewController ()
@property (nonatomic, strong) UIScrollView *mainScorllView;
@property (nonatomic, strong) BWWalletPublickeyInfoView *publickeyInfoView;
@property (nonatomic, strong) UILabel *activityTitleLabel;
@property (nonatomic, strong) BWWalletOverviewActivityView *activityView1;
@property (nonatomic, strong) BWWalletOverviewActivityView *activityView2;
@property (nonatomic, strong) BWWalletOverviewActivityView *activityView3;
@property (nonatomic, strong) BWWalletOverviewActivityView *activityView4;
@property (nonatomic, strong) BWUserAssetRootModel *userAssetRootModel;
@property (nonatomic, strong) BWWalletActivityRootModel *activityRootModel;
@end

@implementation BWWalletOverviewViewController
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}
- (void)viewDidLoad {
    [super viewDidLoad];
}
#pragma mark - func
#pragma mark 獲取個人數據
- (void)loadDataForUserPublickeyInfoCompletion:(void (^ __nullable)(void))completion{
    [BWDataSource getUserAssetSuccess:^(id  _Nonnull response) {
        self.userAssetRootModel = [BWUserAssetRootModel mj_objectWithKeyValues:response];
        if (self.userAssetRootModel.errorCode == 0) {
            BWUser *user = [BWUserManager shareManager].user;
            user.asset = self.userAssetRootModel.data;
            self.publickeyInfoView.money = [NSString stringWithFormat:@"%@ BRT",user.asset];
        }else{
            [self showNetErrorMessageWithStatus:self.userAssetRootModel.status errorCode:self.userAssetRootModel.errorCode errorMessage:self.userAssetRootModel.errorMsg];
        }
        completion();
    } fail:^(NSError * _Nonnull error) {
        [self showServerError];
        completion();
    }];
}
#pragma mark 獲取活動數據
- (void)loadActivityDataCompletion:(void (^ __nullable)(void))completion{
    [BWDataSource getWalletActivityDataSuccess:^(id  _Nonnull response) {
        self.activityRootModel = [BWWalletActivityRootModel mj_objectWithKeyValues:response];
        if (self.activityRootModel.errorCode == 0) {
            //交易
            self.activityView1.content = self.activityRootModel.data.transferSum;
            //BRTStrar
            self.activityView2.content = self.activityRootModel.data.starSum;
            //勝負手
            self.activityView3.content = self.activityRootModel.data.diceSum;
            //挖礦
            self.activityView4.content = self.activityRootModel.data.miningSum;
        }else{
            [self showNetErrorMessageWithStatus:self.activityRootModel.status errorCode:self.activityRootModel.errorCode errorMessage:self.activityRootModel.errorMsg];
        }
        completion();
    } fail:^(NSError * _Nonnull error) {
        [self showServerError];
        completion();
    }];
}
#pragma mark 初始化賦值
- (void)loadData{
    self.publickeyInfoView.publickey = [BWUserManager shareManager].user.publickey;
    //已經向服務器請求到正確數據
    if (self.userAssetRootModel && self.userAssetRootModel.errorCode == 0) {
        BWUser *user = [BWUserManager shareManager].user;
        user.asset = self.userAssetRootModel.data;
        self.publickeyInfoView.money = [NSString stringWithFormat:@"%@ BRT",user.asset];
    }else{
        //獲取個人信息數據
        [self loadDataForUserPublickeyInfoCompletion:^{
            
        }];
    }
    //獲取活動數據
    if (self.activityRootModel) {
        //交易
        self.activityView1.content = self.activityRootModel.data.transferSum;
        //BRTStrar
        self.activityView2.content = self.activityRootModel.data.starSum;
        //勝負手
        self.activityView3.content = self.activityRootModel.data.diceSum;
        //挖礦
        self.activityView4.content = self.activityRootModel.data.miningSum;
    }else{
        [self showHUDWithAlert:LOADING_STRING];
        [self loadActivityDataCompletion:^{
            [self hiddenHUD];
        }];
    }
}
#pragma mark - lazyload
- (BWWalletOverviewActivityView *)activityView4{
    if (!_activityView4) {
        CGFloat w = (self.mainScorllView.width - 50) / 2;
        CGFloat h = w / 163 * 150;
        _activityView4 = [[BWWalletOverviewActivityView alloc] initWithFrame:(CGRectMake(self.activityView3.right + 10, self.activityView2.bottom + 10, w, h))];
        [_activityView4 initSubView];
        _activityView4.mainColor = [UIColor colorWithHexString:@"f6a93b"];
        _activityView4.title = @"挖礦";
        _activityView4.icon = @"wallet_mining";
        self.mainScorllView.contentSize = CGSizeMake(self.view.width, _activityView4.bottom + 10);
        [self.mainScorllView addSubview:_activityView4];
    }
    return _activityView4;
}
- (BWWalletOverviewActivityView *)activityView3{
    if (!_activityView3) {
        CGFloat w = (self.mainScorllView.width - 50) / 2;
        CGFloat h = w / 163 * 150;
        _activityView3 = [[BWWalletOverviewActivityView alloc] initWithFrame:(CGRectMake(20, self.activityView1.bottom + 10, w, h))];
        [_activityView3 initSubView];
        _activityView3.mainColor = [UIColor colorWithHexString:@"7ed321"];
        _activityView3.title = @"勝負手";
        _activityView3.icon = @"wallet_winninghand";
        [self.mainScorllView addSubview:_activityView3];
    }
    return _activityView3;
}
- (BWWalletOverviewActivityView *)activityView2{
    if (!_activityView2) {
        CGFloat w = (self.mainScorllView.width - 50) / 2;
        CGFloat h = w / 163 * 150;
        _activityView2 = [[BWWalletOverviewActivityView alloc] initWithFrame:(CGRectMake(self.activityView1.right + 10, self.activityTitleLabel.bottom + 24, w, h))];
        [_activityView2 initSubView];
        _activityView2.mainColor = [UIColor colorWithHexString:@"f42850"];
        _activityView2.title = @"BRTStars";
        _activityView2.icon = @"wallet_star";
        [self.mainScorllView addSubview:_activityView2];
    }
    return _activityView2;
}
- (BWWalletOverviewActivityView *)activityView1{
    if (!_activityView1) {
        CGFloat w = (self.mainScorllView.width - 50) / 2;
        CGFloat h = w / 163 * 150;
        _activityView1 = [[BWWalletOverviewActivityView alloc] initWithFrame:(CGRectMake(20, self.activityTitleLabel.bottom + 24, w, h))];
        [_activityView1 initSubView];
        _activityView1.mainColor = [UIColor colorWithHexString:@"4a90e2"];
        _activityView1.title = @"交易";
        _activityView1.icon = @"wallet_deal";
        [self.mainScorllView addSubview:_activityView1];
    }
    return _activityView1;
}
- (UILabel *)activityTitleLabel{
    if (!_activityTitleLabel) {
        _activityTitleLabel = [[UILabel alloc] initWithFrame:(CGRectMake(0, self.publickeyInfoView.bottom + 57, self.mainScorllView.width, 30))];
        [_activityTitleLabel configWithTextColor:[UIColor blackColor] font:[UIFont systemFontOfSize:24.f] textAlignment:(NSTextAlignmentCenter) backgroundColor:nil];
        _activityTitleLabel.text = @"所有活動";
        [self.mainScorllView addSubview:_activityTitleLabel];
    }
    return _activityTitleLabel;
}
- (BWWalletPublickeyInfoView *)publickeyInfoView{
    if (!_publickeyInfoView) {
        _publickeyInfoView = [[BWWalletPublickeyInfoView alloc] initWithFrame:(CGRectMake(0, 30, SCREEN_WIDTH, 126))];
        [_publickeyInfoView initSubview];
        [_publickeyInfoView.reloadButton addTarget:self action:@selector(reloadDataAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [self.mainScorllView addSubview:_publickeyInfoView];
    }
    return _publickeyInfoView;
}
- (UIScrollView *)mainScorllView{
    if (!_mainScorllView) {
        _mainScorllView = [[UIScrollView alloc] initWithFrame:(CGRectMake(0, 0, self.view.width, self.view.height))];
        [self.view addSubview:_mainScorllView];
    }
    return _mainScorllView;
}
#pragma mark - buttonAction
- (void)reloadDataAction:(UIButton *)sender{
    [self showHUDWithAlert:LOADING_STRING];
    [self loadDataForUserPublickeyInfoCompletion:^{
        [self hiddenHUD];
    }];
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
