//
//  BWVicOrDefViewController.m
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/11/27.
//  Copyright © 2018 Joker. All rights reserved.
//

#import "BWVicOrDefViewController.h"
#import "BWDicelastWinerRootModel.h"
#import "BWDiceLastWinerView.h"
#import "BWDiceBetView.h"
#import "BWDiceOddsInfoView.h"
#import "BWUserAssetRootModel.h"
@interface BWVicOrDefViewController ()
@property (nonatomic, strong) BWDicelastWinerRootModel *diceRootModel;
@property (strong, nonatomic) UIScrollView *mainScorllView;
@property (nonatomic, strong) BWDiceLastWinerView *lastWinerView;
@property (nonatomic, strong) BWDiceBetView *diceBetView;
@property (nonatomic, strong) BWDiceOddsInfoView *oddsInfoView;
@property (nonatomic, strong) UISlider *mainSlider;
@property (nonatomic, strong) UIButton *diceButton;
@property (nonatomic, strong) NSArray *probabilityArray;
@property (nonatomic, strong) NSDictionary *probabilityDict;
@end

@implementation BWVicOrDefViewController
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self loadData];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"勝負手";
    [self initMenuNav];
    [self initSubViews];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}
- (void)keyboardWillHide:(NSNotification*)notification{
    [self setSelectedValue:self.mainSlider.value];
}
#pragma mark - func
- (void)initSubViews{
    self.mainScorllView.contentSize = CGSizeMake(self.mainScorllView.width, self.diceButton.bottom + 20);
    BWUser *user = [BWUserManager shareManager].user;
    if (!stringIsEmpty(user.asset)) {
        self.diceBetView.userAssetLabel.text = [NSString stringWithFormat:@"錢包餘額 %@ BRT",user.asset];
    }
}
- (void)setSelectedValue:(NSInteger)selectedValue{
    NSString * oddString = (NSString *)[self.probabilityDict valueForKey:[NSString stringWithFormat:@"%ld",selectedValue]];
    double odd = [oddString doubleValue];
    self.oddsInfoView.titleLabel1.text = [NSString stringWithFormat:@"%.2f",odd];
    self.oddsInfoView.titleLabel3.text = [NSString stringWithFormat:@"≤%ld",(long)selectedValue];
    
    if (stringIsEmpty(self.diceBetView.betValueTextField.text)) {
        self.oddsInfoView.titleLabel2.text = @"0";
    }else{
         self.oddsInfoView.titleLabel2.text = [NSString stringWithFormat:@"%.2f",odd * [self.diceBetView.betValueTextField.text floatValue]];
    }
}
- (void)loadData{
    //获取上一次中奖结果
    [self loadLastDiceInfoCompletion:^{
        [self loadOddsCompletion:^{
            //上次选择结果
            if (!stringIsEmpty(self.diceRootModel.data.guess)) {
                [self setSelectedValue:[self.diceRootModel.data.guess integerValue]];
                [self.mainSlider setValue:[self.diceRootModel.data.guess floatValue]];
            }
        }];
    }];
    //獲取賬戶餘額
    [self loadMyAsset];
}
#pragma mark 獲取餘額
- (void)loadMyAsset{
    [BWDataSource getUserAssetSuccess:^(id  _Nonnull response) {
        BWUserAssetRootModel *userAssetRootModel = [BWUserAssetRootModel mj_objectWithKeyValues:response];
        if (userAssetRootModel.errorCode == 0) {
            BWUser *user = [BWUserManager shareManager].user;
            user.asset = userAssetRootModel.data;
            self.diceBetView.userAssetLabel.text = [NSString stringWithFormat:@"錢包餘額 %@ BRT",user.asset];
        }else{
            [self showNetErrorMessageWithStatus:userAssetRootModel.status errorCode:userAssetRootModel.errorCode errorMessage:userAssetRootModel.errorMsg];
        }
    } fail:^(NSError * _Nonnull error) {
        [self showServerError];
    }];
}
#pragma mark 获取赔率
- (void)loadOddsCompletion:(void (^ __nullable)(void))completion{
    if (self.probabilityArray.count != 0) {
        completion();
        return;
    }
    [BWDataSource getDiceOddsSuccess:^(id  _Nonnull response) {
        BWCommonRootModel *root = [BWCommonRootModel mj_objectWithKeyValues:response];
        if (root.errorCode == 0) {
            NSDictionary *dict = response[@"data"];
            self.probabilityArray = [dict allValues];
            self.probabilityDict = dict;
            
        }else{
            [self showNetErrorMessageWithStatus:root.status errorCode:root.errorCode errorMessage:root.errorMsg];
        }
        completion();
    } fail:^(NSError * _Nonnull error) {
        [self showServerError];
        completion();
    }];
}
#pragma mark 获取上一次中奖结果
- (void)loadLastDiceInfoCompletion:(void (^ __nullable)(void))completion{
    [BWDataSource getLastDiceWinerSuccess:^(id  _Nonnull response) {
        self.diceRootModel = [BWDicelastWinerRootModel mj_objectWithKeyValues:response];
        if (self.diceRootModel.errorCode == 0) {
            //中奖结果
            self.lastWinerView.mainContentLabel.text = self.diceRootModel.data.result;
        }else{
            [self showNetErrorMessageWithStatus:self.diceRootModel.status errorCode:self.diceRootModel.errorCode errorMessage:self.diceRootModel.errorMsg];
        }
        completion();
    } fail:^(NSError * _Nonnull error) {
        [self showServerError];
        completion();
    }];
}
//提交投注
- (void)commitDiceCompletion:(void (^ __nullable)(void))completion{
    [BWDataSource betWithGuessNumber:[NSString stringWithFormat:@"%d",(int)self.mainSlider.value] money:self.diceBetView.betValueTextField.text success:^(id  _Nonnull response) {
        self.diceRootModel = [BWDicelastWinerRootModel mj_objectWithKeyValues:response];
        if (self.diceRootModel.errorCode == 0) {
            //中奖结果
            self.lastWinerView.mainContentLabel.text = self.diceRootModel.data.result;
        }else{
            [self showNetErrorMessageWithStatus:self.diceRootModel.status errorCode:self.diceRootModel.errorCode errorMessage:self.diceRootModel.errorMsg];
        }
        completion();
    } fail:^(NSError * _Nonnull error) {
        [self showServerError];
        completion();
    }];
}
#pragma mark - lazyload
- (UIScrollView *)mainScorllView{
    if (!_mainScorllView) {
        _mainScorllView = [[UIScrollView alloc] initWithFrame:(CGRectMake(0, self.customNavTitleLabel.bottom + 20, self.view.width, self.view.height - self.customNavTitleLabel.bottom - 20))];
        _mainScorllView.showsVerticalScrollIndicator = NO;
        _mainScorllView.showsHorizontalScrollIndicator = NO;
        [self.view addSubview:_mainScorllView];
    }
    return _mainScorllView;
}
- (BWDiceLastWinerView *)lastWinerView{
    if (!_lastWinerView) {
        _lastWinerView = [[NSBundle mainBundle] loadNibNamed:@"BWDiceLastWinerView" owner:self options:nil].firstObject;
        float w = self.mainScorllView.width == 320 ? 310 : 375;
        _lastWinerView.frame = CGRectMake(0, 0, w, w / 375 * 416);
        [self.mainScorllView addSubview:_lastWinerView];
    }
    return _lastWinerView;
}
- (BWDiceBetView *)diceBetView{
    if (!_diceBetView) {
        _diceBetView = [[BWDiceBetView alloc] initWithFrame:CGRectMake(self.mainScorllView.width - 293, self.lastWinerView.bottom - 60, 293, 76)];
        [_diceBetView initSubViews];
        [self.mainScorllView addSubview:_diceBetView];
    }
    return _diceBetView;
}
- (BWDiceOddsInfoView *)oddsInfoView{
    if (!_oddsInfoView) {
        _oddsInfoView = [[BWDiceOddsInfoView alloc] initWithFrame:(CGRectMake(0, self.diceBetView.bottom + 15, self.mainScorllView.width, 80))];
        _oddsInfoView.backgroundColor = [UIColor colorWithHexString:@"eff0f1"];
        [_oddsInfoView initSubViews];
        [self.mainScorllView addSubview:_oddsInfoView];
    }
    return _oddsInfoView;
}
- (UISlider *)mainSlider{
    if (!_mainSlider) {
        _mainSlider = [[UISlider alloc] initWithFrame:(CGRectMake(24, self.oddsInfoView.bottom + 17, self.mainScorllView.width - 48, 30))];
        _mainSlider.minimumValue = 1;
        _mainSlider.maximumValue = 99;
        _mainSlider.continuous = YES;
        _mainSlider.minimumTrackTintColor = [UIColor colorWithHexString:@"eff0f1"];
        _mainSlider.maximumTrackTintColor = [UIColor colorWithHexString:@"eff0f1"];
        [_mainSlider setThumbImage:[UIImage imageNamed:@"dice_background"] forState:(UIControlStateNormal)];
        [_mainSlider addTarget:self action:@selector(sliderAction:) forControlEvents:(UIControlEventValueChanged)];
        [self.mainScorllView addSubview:_mainSlider];
    }
    return _mainSlider;
}
- (UIButton *)diceButton{
    if (!_diceButton) {
        _diceButton = [[UIButton alloc] initWithFrame:(CGRectMake((self.mainScorllView.width - 80) / 2, self.mainSlider.bottom + 17, 80, 80))];
        [_diceButton setBackgroundImage:[UIImage imageNamed:@"dice_button"] forState:(UIControlStateNormal)];
        [_diceButton setImage:[UIImage imageNamed:@"dice_dice"] forState:(UIControlStateNormal)];
        [_diceButton addTarget:self action:@selector(diceButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [self.mainScorllView addSubview:_diceButton];
    }
    return _diceButton;
}
#pragma mark - buttonAction
#pragma mark 投票
- (void)diceButtonAction:(UIButton *)sender{
    [self showHUDWithAlert:@"正在提交..."];
    [self commitDiceCompletion:^{
        [self hiddenHUD];
        self.diceBetView.betValueTextField.text = nil;
        //上次选择结果
        if (!stringIsEmpty(self.diceRootModel.data.guess)) {
            [self setSelectedValue:[self.diceRootModel.data.guess integerValue]];
            [self.mainSlider setValue:[self.diceRootModel.data.guess floatValue]];
        }
        //獲取賬戶餘額
        [self loadMyAsset];
    }];
}
- (void)sliderAction:(UISlider *)sender{
    NSInteger discreteValue = roundl([sender value]);
    [sender setValue:(float)discreteValue];
    [self setSelectedValue:discreteValue];
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
