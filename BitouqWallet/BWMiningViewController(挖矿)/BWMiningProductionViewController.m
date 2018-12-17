//
//  BWMiningProductionViewController.m
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/10.
//  Copyright © 2018 Joker. All rights reserved.
//

#import "BWMiningProductionViewController.h"
#import "BWMiningOwnerHeadView.h"
#import "BWMiningOwnerNumbersView.h"
#import "BWMiningErrorView.h"
#import "BWMiningOwnerModel.h"
#import "BWMyMiningInfoRootModel.h"
@interface BWMiningProductionViewController ()
@property (nonatomic, strong) UIScrollView *mainScorllView;
@property (nonatomic, strong) BWMiningOwnerModel *miningOwner;
@property (nonatomic, strong) BWMiningOwnerHeadView *miningOwnerHeadView;
@property (nonatomic, strong) BWMiningOwnerNumbersView *numberView;
@property (nonatomic, strong) BWMiningErrorView *errorView;
@property (nonatomic, strong) BWMyMiningInfoRootModel *miningInfoRootModel;
@property (nonatomic, strong) UIButton *sendButton;
@end

@implementation BWMiningProductionViewController
- (void)viewDidLoad {
    [super viewDidLoad];
}
#pragma mark - func
#pragma mark 獲取數據
- (void)loadData{
    //判斷身份
    [self JudgeMyIdentity];
    if (self.miningOwner == nil) {
        [self initSubviews];
        return;
    }
    
    if (self.miningInfoRootModel != nil) {
        [self.mainScorllView.refreshControl beginRefreshing];
    }
    [self getMiningInfoCompletion:^{
        if ([self.mainScorllView.refreshControl isRefreshing]) {
            [self.mainScorllView.refreshControl endRefreshing];
        }
        [self initSubviews];
    }];
}
#pragma mark 獲取礦主挖礦信息
- (void)getMiningInfoCompletion:(void (^ __nullable)(void))completion{
    [BWDataSource getMyMiningInfoSuccess:^(id  _Nonnull response) {
        
        self.miningInfoRootModel = [BWMyMiningInfoRootModel mj_objectWithKeyValues:response];
        if (self.miningInfoRootModel.errorCode == 0) {
            if (self.miningInfoRootModel.data == nil) {
                 completion();
                return;
            }
            NSString *resDegree = [NSString stringWithFormat:@"%.2f%%", [self.miningInfoRootModel.data.degree doubleValue] / 1000];
            [BWUserManager shareManager].user.degree = resDegree;
        }else{
            
            [self showNetErrorMessageWithStatus:self.miningInfoRootModel.status errorCode:self.miningInfoRootModel.errorCode errorMessage:self.miningInfoRootModel.errorMsg];
        }
        completion();
    } fail:^(NSError * _Nonnull error) {
        [self showServerError];
        completion();
    }];
}
#pragma mark 判斷是否為礦主
- (void)JudgeMyIdentity{
    self.miningOwner = nil;
    for (BWMiningOwnerModel *temp in self.miningOwnerRootModel.data) {
        if ([temp.pubkey isEqualToString:[BWUserManager shareManager].user.publickey]) {
            self.miningOwner = temp;
            [BWUserManager shareManager].user.productRadio = temp.productRadio;
            return;
        }
    }
}
#pragma mark 加載頁面
- (void)initSubviews{
    if (self.miningOwner) {
        
        //是礦主
        //1.節點幣齡
        BWUser *user = [BWUserManager shareManager].user;
        double supprot = [self.miningOwner.coinage doubleValue] - [user.miningAge doubleValue];
        NSString *resAge = [NSString stringWithFormat:@"%@(%.4f)",self.miningOwner.coinage,supprot];
        //2.概率指數
        NSString *probability = user.degree;
        //3.生產力
        NSString *prud = [NSString stringWithFormat:@"%.f",[user.productRadio doubleValue]];
        [self.miningOwnerHeadView setValueWithAge:resAge probability:probability production:prud];
        if (self.miningInfoRootModel.data) {
            [self.numberView.greenView setTargetNumberSelectedWithString:self.miningInfoRootModel.data.num1];
            [self.numberView.blueView setTargetNumberSelectedWithString:self.miningInfoRootModel.data.num2];
            [self.numberView.redView setTargetNumberSelectedWithString:self.miningInfoRootModel.data.num3];
            [self.numberView.yellowView setTargetNumberSelectedWithString:self.miningInfoRootModel.data.num4];
            [self.numberView.grayView setTargetNumberSelectedWithString:self.miningInfoRootModel.data.num5];
        }else{
            [self.numberView.greenView setNumbersSelected:YES];
            [self.numberView.blueView setNumbersSelected:YES];
            [self.numberView.redView setNumbersSelected:YES];
            [self.numberView.yellowView setNumbersSelected:YES];
            [self.numberView.grayView setNumbersSelected:YES];
        }
        [self.sendButton addTarget:self action:@selector(sendAciton:) forControlEvents:(UIControlEventTouchUpInside)];
    }else{
        //非礦主
        self.errorView.hidden = NO;
    }
}
#pragma mark - lazyload
- (UIScrollView *)mainScorllView{
    if (!_mainScorllView) {
        _mainScorllView = [[UIScrollView alloc] initWithFrame:(CGRectMake(0, 0, self.view.width, self.view.height))];
        _mainScorllView.showsVerticalScrollIndicator = NO;
        _mainScorllView.showsHorizontalScrollIndicator = NO;
        
        UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
        refreshControl.tintColor = [UIColor colorWithHexString:@"4d09d5"];
        //        refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"下拉刷新"];
        [refreshControl addTarget:self action:@selector(loadData) forControlEvents:UIControlEventValueChanged];
        _mainScorllView.refreshControl = refreshControl;
        
        [self.view addSubview:_mainScorllView];
    }
    return _mainScorllView;
}
- (BWMiningErrorView *)errorView{
    if (!_errorView) {
        _errorView = [[NSBundle mainBundle] loadNibNamed:@"BWMiningErrorView" owner:self options:nil].firstObject;
        _errorView.frame = CGRectMake(0, 0, self.view.width, self.view.height);
        [self.mainScorllView addSubview:_errorView];
    }
    return _errorView;
}
- (UIButton *)sendButton{
    if (!_sendButton) {
        _sendButton = [[UIButton alloc] initWithFrame:(CGRectMake(self.view.width - 160, self.numberView.bottom + 25, 160, 50))];
        [_sendButton setTitle:@"   提交挖礦信息" forState:(UIControlStateNormal)];
        [_sendButton setBackgroundImage:[UIImage imageNamed:@"wallet_send"] forState:(UIControlStateNormal)];
        [_sendButton setImage:[UIImage imageNamed:@"main_button_logo"] forState:(UIControlStateNormal)];
        [_sendButton setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        _sendButton.titleLabel.font = [UIFont systemFontOfSize:14.f];
        [self.mainScorllView addSubview:_sendButton];
    }
    return _sendButton;
}
- (BWMiningOwnerHeadView *)miningOwnerHeadView{
    if (!_miningOwnerHeadView) {
        float w = self.view.width - 16;
        float h = w / 339 * 176;
        _miningOwnerHeadView = [[BWMiningOwnerHeadView alloc] initWithFrame:(CGRectMake(8, 23, w, h))];
        [_miningOwnerHeadView baseConfig];
        [self.mainScorllView addSubview:_miningOwnerHeadView];
    }
    return _miningOwnerHeadView;
}
- (BWMiningOwnerNumbersView *)numberView{
    if (!_numberView) {
        _numberView = [[BWMiningOwnerNumbersView alloc] initWithFrame:(CGRectMake(0, self.miningOwnerHeadView.bottom + 43, 304, 165))];
        [_numberView initSubViews];
        _numberView.centerX = self.view.width / 2;
        [self.mainScorllView addSubview:_numberView];
    }
    return _numberView;
}
#pragma mark - buttonAction
- (void)sendAciton:(UIButton *)sender{
    [self showHUDWithAlert:LOADING_STRING];
    [BWDataSource miningProductionWithNum1:self.numberView.greenView.resNumber num2:self.numberView.blueView.resNumber num3:self.numberView.redView.resNumber num4:self.numberView.yellowView.resNumber num5:self.numberView.grayView.resNumber success:^(id  _Nonnull response) {
        [self hiddenHUD];
        BWCommonRootModel *model = [BWCommonRootModel mj_objectWithKeyValues:response];
        if (model.errorCode == 0) {
            [self showWeakAlertWithString:@"挖礦信息已更新"];
            [self loadData];
        }else{
            [self showNetErrorMessageWithStatus:model.status errorCode:model.errorCode errorMessage:model.errorMsg];
        }
    } fail:^(NSError * _Nonnull error) {
        [self hiddenHUD];
        [self showServerError];
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
