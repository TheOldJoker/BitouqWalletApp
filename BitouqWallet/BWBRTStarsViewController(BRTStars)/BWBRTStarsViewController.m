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
@interface BWBRTStarsViewController ()<UITableViewDelegate,UITableViewDataSource>
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
    self.title = @"BRStars";
    [self initMenuNav];
    self.customNavTitleLabel.textColor = [UIColor whiteColor];
}
#pragma mark - func
- (void)loadData{
    [self.mainTableView reloadData];
    //获取上次开奖结果
    [self getLastBRTStarsResCompletion:^{
        
    }];
    //获取中奖信息
    [self getNewsCompletion:^{
        
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
        _headView = [[BWBRTStarsHeadView alloc] initWithFrame:(CGRectMake(0, 0, self.view.width, 400))];
        [_headView.bettingRecordButton addTarget:self action:@selector(bettingRecordAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [_headView.theLotteryRecordButton addTarget:self action:@selector(theLotteryRecordAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [_headView.gameButton addTarget:self action:@selector(gameButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _headView;
}
- (BWBWBRTStarsFootView *)footView{
    if (!_footView) {
        _footView = [[BWBWBRTStarsFootView alloc] initWithFrame:(CGRectMake(0, 0, self.view.width, 400))];
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
        [self.view addSubview:_mainTableView];
    }
    return _mainTableView;
}
#pragma mark - buttonAction
#pragma mark 选择游戏类型
- (void)gameButtonAction:(UIButton *)sender{
    
}
#pragma mark 查看开奖记录
- (void)theLotteryRecordAction:(UIButton *)sender{
    
}
#pragma mark 查看投注记录
- (void)bettingRecordAction:(UIButton *)sender{
    
}
#pragma mark - delegate
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
