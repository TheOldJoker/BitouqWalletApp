//
//  BWMiningVoteViewController.m
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/10.
//  Copyright © 2018 Joker. All rights reserved.
//

#import "BWMiningVoteViewController.h"
#import "BWMiningVoteHeadView.h"
#import "BWVoteTableViewCell.h"
#import "BWMiningOwnerModel.h"
#import "BWMyMiningAgeRootModel.h"

@interface BWMiningVoteViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) BWMiningVoteHeadView *headView;
@property (nonatomic, strong) UITableView *mainTableView;
@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, strong) BWMiningOwnerModel *myMiningOwner;

@end

@implementation BWMiningVoteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
#pragma mark - func
//向礦主投票
- (void)voteToMiningOwnerWithPubkey:(NSString *)pubkey{
    [self showHUDWithAlert:@"提交投票..."];
    [BWDataSource voteToMiningOwnerWithKey:pubkey success:^(id  _Nonnull response) {
        [self hiddenHUD];
        BWCommonRootModel *rootModel = [BWCommonRootModel mj_objectWithKeyValues:response];
        if (rootModel.errorCode == 0) {
            [self loadData];
        }else{
            [self showNetErrorMessageWithStatus:rootModel.status errorCode:rootModel.errorCode errorMessage:rootModel.errorMsg];
        }
    } fail:^(NSError * _Nonnull error) {
        [self hiddenHUD];
        [self showServerError];
    }];
}
- (void)dealMyDataSource{
    [self.dataSource removeAllObjects];
    NSString *myOwner = [BWUserManager shareManager].user.miningOwner;
    if (stringIsEmpty(myOwner)) {
        [self.dataSource addObjectsFromArray:self.miningOwnerRootModel.data];
        [self.mainTableView reloadData];
        return;
    }
    for (BWMiningOwnerModel *temp in self.miningOwnerRootModel.data) {
        if ([temp.pubkey isEqualToString:myOwner]) {
            self.myMiningOwner = temp;
        }else{
            [self.dataSource addObject:temp];
        }
    }
    [self.dataSource insertObject:self.myMiningOwner atIndex:0];
    [self.mainTableView reloadData];
}
- (void)loadData{
    
    //累計挖礦收益
    [BWDataSource getMyMiningEarningsSuccess:^(id  _Nonnull response) {
        BWCommonRootModel *rootModel = [BWCommonRootModel mj_objectWithKeyValues:response];
        if (rootModel.errorCode == 0) {
            self.headView.groupLabel.text = [NSString stringWithFormat:@"%@ BRT",rootModel.data];
        }else{
            [self showNetErrorMessageWithStatus:rootModel.status errorCode:rootModel.errorCode errorMessage:rootModel.errorMsg];
        }
    } fail:^(NSError * _Nonnull error) {
        [self showServerError];
    }];
    //查詢我的幣齡
    [BWDataSource getMyMiningAgeSuccess:^(id  _Nonnull response) {
        BWMyMiningAgeRootModel *rootModel = [BWMyMiningAgeRootModel mj_objectWithKeyValues:response];
        if (rootModel.errorCode == 0) {
            [BWUserManager shareManager].user.miningAge = rootModel.data.age;
            self.headView.atmLabel.text = rootModel.data.age;
        }else{
            [self showNetErrorMessageWithStatus:rootModel.status errorCode:rootModel.errorCode errorMessage:rootModel.errorMsg];
        }
    } fail:^(NSError * _Nonnull error) {
        [self showServerError];
    }];
    //查詢我的礦主
    [BWDataSource getMyMiningOwnerSuccess:^(id  _Nonnull response) {
    
        BWCommonRootModel *rootModel = [BWCommonRootModel mj_objectWithKeyValues:response];
        if (rootModel.errorCode == 0) {
            if (rootModel.data == nil) {
                rootModel.data = @"";
            }
            [BWUserManager shareManager].user.miningOwner = rootModel.data;
            [self dealMyDataSource];
            if (stringIsEmpty([BWUserManager shareManager].user.miningOwner)) {
                return;
            }
            self.headView.memberLabel.text = [rootModel.data substringWithRange:(NSMakeRange(rootModel.data.length - 6, 6))];
        }else{
            [self showNetErrorMessageWithStatus:rootModel.status errorCode:rootModel.errorCode errorMessage:rootModel.errorMsg];
        }
    } fail:^(NSError * _Nonnull error) {
        [self showServerError];
    }];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if ([self.mainTableView.refreshControl isRefreshing]) {
            [self.mainTableView.refreshControl endRefreshing];
        }
    });
    
}
#pragma mark - lazyload
- (NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}
- (BWMiningVoteHeadView *)headView{
    if (!_headView) {
        _headView = [[NSBundle mainBundle] loadNibNamed:@"BWMiningVoteHeadView" owner:self options:nil].firstObject;
        _headView.frame = CGRectMake(0, 0, self.view.width, 279);
    }
    return _headView;
}
- (UITableView *)mainTableView{
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc] initWithFrame:(CGRectMake(0, 0, self.view.width, self.view.height)) style:(UITableViewStylePlain)];
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        [_mainTableView normalConfig];
        _mainTableView.tableHeaderView = self.headView;
        
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
- (void)userVoteAction:(BWVoteCellButton *)sender{
    if (sender.model == nil) {
        return;
    }
    //無礦主
    if (self.myMiningOwner == nil) {
        [self voteToMiningOwnerWithPubkey:sender.model.pubkey];
        return;
    }
    if ([self.myMiningOwner.pubkey isEqualToString:sender.model.pubkey]) {
        //當前已投票
        //暫無操作
        return;
    }else{
        //當前未投票
        [self voteToMiningOwnerWithPubkey:sender.model.pubkey];
    }
}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BWVoteTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL"];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"BWVoteTableViewCell" owner:self options:nil].firstObject;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.model = self.dataSource[indexPath.row];
    [cell.userActionButton addTarget:self action:@selector(userVoteAction:) forControlEvents:(UIControlEventTouchUpInside)];
    
    return cell;
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
