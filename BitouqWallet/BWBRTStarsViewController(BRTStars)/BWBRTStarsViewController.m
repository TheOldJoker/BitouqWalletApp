//
//  BWBRTStarsViewController.m
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/11/27.
//  Copyright © 2018 Joker. All rights reserved.
//

#import "BWBRTStarsViewController.h"
#import "BWBRTStarsTableViewCell.h"
#import "BWBRTStarsHeadView.h"
#import "BWBWBRTStarsFootView.h"
#import "BWBRTStarsLastResRootModel.h"
#import "BWBRTStarsNewsRootModel.h"
#import "BWLotteryRecordViewController.h"
#import "BWBetRecordViewController.h"
#import "BWGamePickerViewController.h"
#import "BWUserAssetRootModel.h"
@interface BWBRTStarsViewController ()<UITableViewDelegate,UITableViewDataSource,BWGamePickerViewControllerDelegate,BWBRTStarsHeadViewDelegate>
@property (nonatomic, strong) UITableView *mainTableView;
@property (nonatomic, strong) BWBRTStarsHeadView *headView;
@property (nonatomic, strong) BWBWBRTStarsFootView *footView;
@property (nonatomic, strong) BWBRTStarsLastResRootModel *lastResRootModel;
@end

@implementation BWBRTStarsViewController
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self loadData];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.mainTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    self.title = @"BRTStars";
    [self initMenuNav];
    self.customNavTitleLabel.textColor = [UIColor whiteColor];
}
#pragma mark - func
- (void)loadData{
    [self.mainTableView reloadData];
    if (self.lastResRootModel) {
        [self.mainTableView.refreshControl beginRefreshing];
    }
    //获取上次开奖结果
    [self getLastBRTStarsResCompletion:^{
        //获取中奖信息
        [self getNewsCompletion:^{
            if ([self.mainTableView.refreshControl isRefreshing]) {
                [self.mainTableView.refreshControl endRefreshing];
            }
            if ([self.lastResRootModel.data.countdown integerValue] < 0) {
                [self showWeakAlertWithString:@"正在開獎,請下拉刷新頁面"];
            }
            //获取游戏赔率
            [self getGameOddsCompletion:^{
                
            }];
        }];
    }];
    //獲取賬戶餘額
    [self loadMyAsset];
}
#pragma mark 獲取遊戲賠率
- (void)getGameOddsCompletion:(void (^ __nullable)(void))completion{
    [BWDataSource getTheGameOddsSuccess:^(id  _Nonnull response) {
        BWCommonRootModel *root = [BWCommonRootModel mj_objectWithKeyValues:response];
        if (root.errorCode == 0) {
            self.footView.gameOdds = response[@"data"];
        }else{
            [self showNetErrorMessageWithStatus:root.status errorCode:root.errorCode errorMessage:root.errorMsg];
        }
    } fail:^(NSError * _Nonnull error) {
        [self showServerError];
    }];
}
#pragma mark 獲取餘額
- (void)loadMyAsset{
    [BWDataSource getUserAssetSuccess:^(id  _Nonnull response) {
        BWUserAssetRootModel *userAssetRootModel = [BWUserAssetRootModel mj_objectWithKeyValues:response];
        if (userAssetRootModel.errorCode == 0) {
            BWUser *user = [BWUserManager shareManager].user;
            user.asset = userAssetRootModel.data;
            self.footView.userAssetLabel.text = [NSString stringWithFormat:@"錢包餘額 %@ BRT",user.asset];
        }else{
            
            [self showNetErrorMessageWithStatus:userAssetRootModel.status errorCode:userAssetRootModel.errorCode errorMessage:userAssetRootModel.errorMsg];
        }
    } fail:^(NSError * _Nonnull error) {
        [self showServerError];
    }];
}
- (void)getNewsCompletion:(void (^ __nullable)(void))completion{
    [BWDataSource getBRTStarsNewsSuccess:^(id  _Nonnull response) {
        BWBRTStarsNewsRootModel *root = [BWBRTStarsNewsRootModel mj_objectWithKeyValues:response];
        if (root.errorCode == 0) {
            self.headView.news = root.data;
        }else{
            [self showNetErrorMessageWithStatus:root.status errorCode:root.errorCode errorMessage:root.errorMsg];
        }
        completion();
    } fail:^(NSError * _Nonnull error) {
        [self showServerError];
        completion();
    }];
}
- (void)getLastBRTStarsResCompletion:(void (^ __nullable)(void))completion{
    [BWDataSource getLastBRTStarsResSuccess:^(id  _Nonnull response) {
        
        self.lastResRootModel = [BWBRTStarsLastResRootModel mj_objectWithKeyValues:response];
        if (self.lastResRootModel.errorCode == 0) {
            [self.mainTableView reloadData];
            self.headView.theLotteryResults = self.lastResRootModel.data.result;
            self.headView.countdown = self.lastResRootModel.data.countdown;
            NSInteger version = [self.lastResRootModel.data.ID integerValue];
            self.headView.version = [NSString stringWithFormat:@"NO.%07ld",version + 1];
        }else{
            [self showNetErrorMessageWithStatus:self.lastResRootModel.status errorCode:self.lastResRootModel.errorCode errorMessage:self.lastResRootModel.errorMsg];
        }
        completion();
    } fail:^(NSError * _Nonnull error) {
        [self showServerError];
        completion();
    }];
}
#pragma mark - lazyload
- (BWBRTStarsHeadView *)headView{
    if (!_headView) {
        _headView = [[BWBRTStarsHeadView alloc] initWithFrame:(CGRectMake(0, 0, self.view.width, 0))];
        [_headView initSubviews];
        _headView.gameType = 1;
        [_headView.bettingRecordButton addTarget:self action:@selector(bettingRecordAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [_headView.theLotteryRecordButton addTarget:self action:@selector(theLotteryRecordAction:) forControlEvents:(UIControlEventTouchUpInside)];
        _headView.delegate = self;
        [_headView.gameButton addTarget:self action:@selector(gameButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _headView;
}
- (BWBWBRTStarsFootView *)footView{
    if (!_footView) {
        _footView = [[BWBWBRTStarsFootView alloc] initWithFrame:(CGRectMake(0, 0, self.view.width, 462))];
        _footView.gameType = 1;
        [_footView initSubViews];
        [_footView.winNButton addTarget:self action:@selector(winNAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [_footView.sendButton addTarget:self action:@selector(guessAction:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _footView;
}
- (UITableView *)mainTableView{
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc] initWithFrame:(CGRectMake(0, self.customNavTitleLabel.bottom, self.view.width, self.view.height - self.customNavTitleLabel.bottom)) style:(UITableViewStylePlain)];
        [_mainTableView normalConfig];
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        _mainTableView.tableHeaderView = self.headView;
        _mainTableView.tableFooterView = self.footView;
        _mainTableView.backgroundColor = [UIColor clearColor];
        
        UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
        refreshControl.tintColor = [UIColor colorWithHexString:@"4d09d5"];
//        refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"下拉刷新"];
        [refreshControl addTarget:self action:@selector(loadData) forControlEvents:UIControlEventValueChanged];
        self.mainTableView.refreshControl = refreshControl;
        [self.view addSubview:_mainTableView];
    }
    return _mainTableView;
}
#pragma mark - buttonAction
- (void)winNAction:(UIButton *)sender{
    [self showWeakAlertWithString:[NSString stringWithFormat:@"最大中獎%ld次,此次投注可能多次中獎,此獎金為最大期望獎金",sender.tag - 9000]];
}
- (void)guessAction:(UIButton *)sender{
    if (stringIsEmpty(self.footView.betValueTextField.text)) {
        [self showWeakAlertWithString:@"請輸入單注金額"];
        return;
    }
    NSString *num1 = @"";
    if (self.headView.gameType > 5) {
        num1 = self.headView.gameStarsView2.resNumber;
        if (stringIsEmpty(self.headView.gameStarsView2.resNumber)) {
            [self showWeakAlertWithString:@"競猜信息不全"];
            return;
        }
    }else{
        if (stringIsEmpty(self.headView.gameStarsView1.greenView.resNumber) && stringIsEmpty(self.headView.gameStarsView1.blueView.resNumber)&& stringIsEmpty(self.headView.gameStarsView1.redView.resNumber)&& stringIsEmpty(self.headView.gameStarsView1.yellowView.resNumber)&& stringIsEmpty(self.headView.gameStarsView1.grayView.resNumber)) {
            [self showWeakAlertWithString:@"競猜信息不全"];
            return;
        }
        num1 = self.headView.gameStarsView1.greenView.resNumber;
    }
    NSInteger version = [self.lastResRootModel.data.ID integerValue];
    NSString *term = [NSString stringWithFormat:@"%ld",version + 1];
    [BWDataSource gameBetWithOnebase:self.footView.betValueTextField.text term:term multiple:self.footView.multipleTextField.text num1:num1 num2:self.headView.gameStarsView1.blueView.resNumber num3:self.headView.gameStarsView1.redView.resNumber num4:self.headView.gameStarsView1.yellowView.resNumber num5:self.headView.gameStarsView1.grayView.resNumber type:self.headView.gameType success:^(id  _Nonnull response) {
        [self hiddenHUD];
        BWCommonRootModel *root = [BWCommonRootModel mj_objectWithKeyValues:response];
        if (root.errorCode == 0) {
            [self showWeakAlertWithString:@"參加競猜成功"];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self loadData];
            });
        }else{
            [self showNetErrorMessageWithStatus:root.status errorCode:root.errorCode errorMessage:root.errorMsg];
        }
    } fail:^(NSError * _Nonnull error) {
        [self hiddenHUD];
        [self showServerError];
    }];
}
#pragma mark 选择游戏类型
- (void)gameButtonAction:(UIButton *)sender{
    BWGamePickerViewController *vc = [[BWGamePickerViewController alloc] init];
    vc.view.frame = CGRectMake(0, self.view.height - 244, SCREEN_WIDTH, 244);
    vc.delegate = self;
    [self customPresentVC:vc animation:(YHModaAnimationTypePresent) showBlackBackgroud:YES canTapDismiss:YES];
}
#pragma mark 查看开奖记录
- (void)theLotteryRecordAction:(UIButton *)sender{
    BWLotteryRecordViewController *vc = [[BWLotteryRecordViewController alloc] init];
    vc.view.frame = CGRectMake(0, 280, SCREEN_WIDTH,SCREEN_HEIGHT - 280);
    [self customPresentVC:vc animation:(YHModaAnimationTypePresent) showBlackBackgroud:NO canTapDismiss:YES];
}
#pragma mark 查看投注记录
- (void)bettingRecordAction:(UIButton *)sender{
    BWBetRecordViewController *vc = [[BWBetRecordViewController alloc] init];
    
    vc.view.frame = CGRectMake(0, 280, SCREEN_WIDTH,SCREEN_HEIGHT - 280);
    
    [self customPresentVC:vc animation:(YHModaAnimationTypePresent) showBlackBackgroud:NO canTapDismiss:YES];
}
#pragma mark - delegate
#pragma mark BWBRTStarsHeadViewDelegate
- (void)timeOver{
    [self loadData];
}
- (void)userPressNumbers{
    //@"前置3星任選",@"前置3星雙殺",@"前置3星豹子"
    if (self.headView.gameType > 5) {
        BWGameArithmeticModel *gameArithmetic = [[BWGameArithmeticModel alloc] init];
        gameArithmetic.specialNum = self.headView.gameStarsView2.resNumber;
        self.footView.gameArithmetic = gameArithmetic;
        return;
    }
    //@"1星競猜",@"2星競猜",@"3星競猜",@"4星競猜",@"5星競猜"
    BWGameArithmeticModel *gameArithmetic = [[BWGameArithmeticModel alloc] init];
    gameArithmetic.num1 = self.headView.gameStarsView1.greenView.resNumber;
    gameArithmetic.num2 = self.headView.gameStarsView1.blueView.resNumber;
    gameArithmetic.num3 = self.headView.gameStarsView1.redView.resNumber;
    gameArithmetic.num4 = self.headView.gameStarsView1.yellowView.resNumber;
    gameArithmetic.num5 = self.headView.gameStarsView1.grayView.resNumber;
    self.footView.gameArithmetic = gameArithmetic;
}
#pragma mark - BWGamePickerViewControllerDelegate
- (void)changeGameType:(NSInteger)type{
    self.headView.gameType = type;
    self.footView.gameType = type;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.mainTableView reloadData];
    });
}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 0;
}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BWBRTStarsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL"];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"BWBRTStarsTableViewCell" owner:self options:nil].firstObject;
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSInteger version = [self.lastResRootModel.data.ID integerValue];
    cell.mainLabel.text = [NSString stringWithFormat:@"NO.%07ld",version + 1];
    return cell;
}
@end
