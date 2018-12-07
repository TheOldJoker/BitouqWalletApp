//
//  BWWalletSendViewController.m
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/4.
//  Copyright © 2018 Joker. All rights reserved.
//

#import "BWWalletSendViewController.h"
#import "BWWalletSendHeadView.h"
#import "BWWalletrecordTableViewCell.h"
#import "BWWalletDefaultservicefeeRootModel.h"
#import "BWUserAssetRootModel.h"
#import "BWWalletrecordRootModel.h"
#import "BWCodeScanViewController.h"
@interface BWWalletSendViewController ()<UITableViewDelegate,UITableViewDataSource,BWWalletSendHeadViewDelegate,BWCodeScanViewControllerDelegate>
@property (nonatomic, strong) UITableView *mainTableView;
@property (nonatomic, strong) BWWalletSendHeadView *headView;
@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, strong) BWWalletSendModel *mainSendModel;
@property (nonatomic, strong) BWUserAssetRootModel *userAssetRootModel;
@property (nonatomic, strong) BWWalletrecordRootModel *recordRootModel;
@end

@implementation BWWalletSendViewController
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}
- (void)viewDidLoad {
    [super viewDidLoad];
}
#pragma mark - func
- (void)loadData{
    [self.mainTableView reloadData];
    [BWDataSource getDefaultservicefeeSuccess:^(id  _Nonnull response) {
        BWWalletDefaultservicefeeRootModel *rootModel = [BWWalletDefaultservicefeeRootModel mj_objectWithKeyValues:response];
        //獲取到默認礦工費
        self.mainSendModel.miningMoney = rootModel.data;
        self.headView.mainModel = self.mainSendModel;
    } fail:^(NSError * _Nonnull error) {
        [self showServerError];
    }];
    
    [BWDataSource getWalletrecordSuccess:^(id  _Nonnull response) {
        self.recordRootModel = [BWWalletrecordRootModel mj_objectWithKeyValues:response];
        if (self.recordRootModel.errorCode == 0) {
            [self.mainTableView reloadData];
        }else{
            [self showNetErrorMessageWithStatus:self.recordRootModel.status errorCode:self.recordRootModel.errorCode errorMessage:self.recordRootModel.errorMsg];
        }
    } fail:^(NSError * _Nonnull error) {
        [self showServerError];
    }];
}
#pragma mark 獲取個人數據
- (void)loadDataForUserPublickeyInfoCompletion:(void (^ __nullable)(void))completion{
    [BWDataSource getUserAssetSuccess:^(id  _Nonnull response) {
        self.userAssetRootModel = [BWUserAssetRootModel mj_objectWithKeyValues:response];
        if (self.userAssetRootModel.errorCode == 0) {
            BWUser *user = [BWUserManager shareManager].user;
            user.asset = self.userAssetRootModel.data;
            self.headView.mainModel = self.mainSendModel;
        }else{
            [self showNetErrorMessageWithStatus:self.userAssetRootModel.status errorCode:self.userAssetRootModel.errorCode errorMessage:self.userAssetRootModel.errorMsg];
        }
        completion();
    } fail:^(NSError * _Nonnull error) {
        [self showServerError];
        completion();
    }];
}
#pragma mark - lazyload
- (BWWalletSendModel *)mainSendModel{
    if (!_mainSendModel) {
        _mainSendModel = [[BWWalletSendModel alloc] init];
    }
    return _mainSendModel;
}
- (NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}
- (BWWalletSendHeadView *)headView{
    if (!_headView) {
        _headView = [[BWWalletSendHeadView alloc] initWithFrame:(CGRectMake(0, 0, self.view.width, 0))];
        [_headView initSubviews];
        [_headView.sendButton addTarget:self action:@selector(sendAciton:) forControlEvents:(UIControlEventTouchUpInside)];
        [_headView.codeButton addTarget:self action:@selector(codeScanAciton:) forControlEvents:(UIControlEventTouchUpInside)];
        _headView.delegate = self;
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
        [self.view addSubview:_mainTableView];
    }
    return _mainTableView;
}
#pragma mark - buttonAction
- (void)sendAciton:(UIButton *)sender{
    [self.view endEditing:YES];
    if (stringIsEmpty(self.headView.getAddressTextField.text)) {
        [self showWeakAlertWithString:@"請輸入接收地址"];
        return;
    }
    if (stringIsEmpty(self.headView.moneyTextField.text)) {
        [self showWeakAlertWithString:@"請輸入接收金額"];
        return;
    }
    self.mainSendModel.getAddress = self.headView.getAddressTextField.text;
    self.mainSendModel.sendMoney = self.headView.moneyTextField.text;
    if (!stringIsEmpty(self.headView.miningTextFiled.text)) {
        self.mainSendModel.miningMoney = self.headView.miningTextFiled.text;
    }
    
    if ([[BWUserManager shareManager].user.asset doubleValue] < [self.mainSendModel.miningMoney doubleValue] + [self.mainSendModel.sendMoney doubleValue]) {
        [self showWeakAlertWithString:@"您的錢包餘額不足"];
        return;
    }
    [self showHUDWithAlert:@"正在發送..."];
    [BWDataSource transferAssetWithModel:self.mainSendModel success:^(id  _Nonnull response) {
        [self hiddenHUD];
        BWCommonRootModel *rootModel = [BWCommonRootModel mj_objectWithKeyValues:response];
        if (rootModel.errorCode == 0) {
            [self showWeakAlertWithString:@"發送成功"];
            //刷新個人信息
            [self loadDataForUserPublickeyInfoCompletion:^{
                //獲取默認曠工費
                [self loadData];
            }];
        }else{
            [self showNetErrorMessageWithStatus:rootModel.status errorCode:rootModel.errorCode errorMessage:rootModel.errorMsg];
        }
    } fail:^(NSError * _Nonnull error) {
        [self hiddenHUD];
        [self showServerError];
    }];
}
- (void)codeScanAciton:(UIButton *)sender{
    BWCodeScanViewController *scanVC = [[BWCodeScanViewController alloc] init];
    scanVC.delegate = self;
    [self presentViewController:scanVC animated:YES completion:nil];
}
#pragma mark - BWCodeScanViewControllerDelegate
- (void)scanCodeResString:(NSString *)codeString{
    self.mainSendModel.getAddress = codeString;
    self.headView.getAddressTextField.text = codeString;
}
#pragma mark - BWWalletSendHeadViewDelegate
- (void)walletSendHeadReloadDataAciton{
    [self showHUDWithAlert:LOADING_STRING];
    //刷新個人信息
    [self loadDataForUserPublickeyInfoCompletion:^{
        [self hiddenHUD];
        //獲取默認曠工費
        [self loadData];
    }];
    
}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.recordRootModel.data.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BWWalletrecordTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL"];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"BWWalletrecordTableViewCell" owner:self options:nil].firstObject;
    }
    BWWalletrecordModel *model = self.recordRootModel.data[indexPath.row];
    [cell setValueWithModel:model];
    return cell;
}
#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
}
@end
