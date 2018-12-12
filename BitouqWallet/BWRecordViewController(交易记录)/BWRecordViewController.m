//
//  BWRecordViewController.m
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/11/27.
//  Copyright © 2018 Joker. All rights reserved.
//

#import "BWRecordViewController.h"
#import "BWRecordTableViewCell.h"
#import "BWRecordRootModel.h"
@interface BWRecordViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *mainTableView;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *tableViewTopValue;
@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, strong) BWRecordRootModel *mainRootModel;
@end

@implementation BWRecordViewController
- (void)viewWillDisappear:(BOOL)animated{
    [super  viewWillDisappear:animated];
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    }
}
- (void)viewDidAppear:(BOOL)animated{
    [self loadData];
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"交易記錄";
    [self initMenuNav];
    [self.mainTableView normalConfig];
    self.tableViewTopValue.constant = self.customNavTitleLabel.bottom + 5;
}
- (void)loadData{
    [self showHUDWithAlert:LOADING_STRING];
    [BWDataSource getRecordeSuccess:^(id  _Nonnull response) {
        [self hiddenHUD];
        self.mainRootModel = [BWRecordRootModel mj_objectWithKeyValues:response];
        if (self.mainRootModel.errorCode == 0) {
            [self.mainTableView reloadData];
        }else{
            [self showNetErrorMessageWithStatus:self.mainRootModel.status errorCode:self.mainRootModel.errorCode errorMessage:self.mainRootModel.errorMsg];
        }
    } fail:^(NSError * _Nonnull error) {
        [self hiddenHUD];
        [self showServerError];
    }];
}
- (NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.mainRootModel.data.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BWRecordTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL"];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"BWRecordTableViewCell" owner:self options:nil].firstObject;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    BWRecordModel *model = self.mainRootModel.data[indexPath.row];
    [cell setValueWithModel:model];
    cell.backgroundColor = indexPath.row % 2 == 0 ? [UIColor whiteColor] : [UIColor colorWithHexString:@"eff0f1"];
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
