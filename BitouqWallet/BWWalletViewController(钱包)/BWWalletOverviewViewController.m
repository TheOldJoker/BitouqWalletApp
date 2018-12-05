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
@interface BWWalletOverviewViewController ()
@property (nonatomic, strong) UIScrollView *mainScorllView;
@property (nonatomic, strong) BWWalletPublickeyInfoView *publickeyInfoView;
@property (nonatomic, strong) UILabel *activityTitleLabel;
@property (nonatomic, strong) BWWalletOverviewActivityView *activityView1;
@property (nonatomic, strong) BWWalletOverviewActivityView *activityView2;
@property (nonatomic, strong) BWWalletOverviewActivityView *activityView3;
@property (nonatomic, strong) BWWalletOverviewActivityView *activityView4;
@end

@implementation BWWalletOverviewViewController
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self loadData];
}
- (void)viewDidLoad {
    [super viewDidLoad];
}
#pragma mark - func
- (void)loadData{
    self.publickeyInfoView.publickey = @"8JWRqEGK84GxbF7jpn5TZoEnefjuzxDA39iBRrVYge2D";
    self.publickeyInfoView.money = @"197860123.213 BRT";
    
    self.activityView1.content = @"+ 1010230";
    self.activityView2.content = @"+ 1010230";
    self.activityView3.content = @"- 10";
    self.activityView4.content = @"0";
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
    NSLog(@"reloadDataAction");
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
