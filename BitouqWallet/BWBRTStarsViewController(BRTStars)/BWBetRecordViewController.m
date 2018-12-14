//
//  BWBetRecordViewController.m
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/14.
//  Copyright © 2018 Joker. All rights reserved.
//

#import "BWBetRecordViewController.h"
#import "BWBRTRecordView.h"
#import "BWBRTStarsBetRecordModel.h"
#import "BWBRTStarsBetRecordRootModel.h"
#import "BWBetRecoredTableViewCell.h"

@interface BWBetRecordViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *mainTableView;
@property (nonatomic, strong) BWBRTRecordView *headView;
@property (nonatomic, strong) BWBRTStarsBetRecordRootModel *rootModel;
@end

@implementation BWBetRecordViewController
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self loadData];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}
#pragma mark - func
- (void)loadData{
    [BWDataSource getBettingRecordSuccess:^(id  _Nonnull response) {
        self.rootModel = [BWBRTStarsBetRecordRootModel mj_objectWithKeyValues:response];
        if (self.rootModel.errorCode == 0) {
            [self.mainTableView reloadData];
        }else{
            [self showNetErrorMessageWithStatus:self.rootModel.status errorCode:self.rootModel.errorCode errorMessage:self.rootModel.errorMsg];
        }
    } fail:^(NSError * _Nonnull error) {
        [self showServerError];
    }];
}
#pragma mark - lazyload
- (BWBRTRecordView *)headView{
    if (!_headView) {
        _headView = [[BWBRTRecordView alloc] initWithFrame:(CGRectMake(0, 0, self.view.width, 35))];
        [_headView initSubviewsWithTitle1:@"期號" title2:@"投注內容" title3:@"中獎金額"];
        [self.view addSubview:_headView];
    }
    return _headView;
}
- (UITableView *)mainTableView{
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc] initWithFrame:(CGRectMake(0, self.headView.bottom, self.view.width, self.view.height - self.headView.height)) style:(UITableViewStylePlain)];
        _mainTableView.delegate =self;
        _mainTableView.dataSource = self;
        [_mainTableView normalConfig];
        [self.view addSubview:_mainTableView];
    }
    return _mainTableView;
}
#pragma mark - buttonAction
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    float height = 75;
    BWBRTStarsBetRecordModel *model = self.rootModel.data[indexPath.row];
    if ([model.type integerValue] >= 1 && [model.type integerValue] <= 5) {
        NSInteger number = 0;
        if (!stringIsEmpty(model.num1)) {
            number += 1;
        }
        if (!stringIsEmpty(model.num2)) {
            number += 1;
        }
        if (!stringIsEmpty(model.num3)) {
            number += 1;
        }
        if (!stringIsEmpty(model.num4)) {
            number += 1;
        }
        if (!stringIsEmpty(model.num5)) {
            number += 1;
        }
        if (number == 4) {
            return height + 20;
        }
        if (number == 5) {
            return height + 30;
        }
    }
    return height;
}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.rootModel.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BWBetRecoredTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL"];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"BWBetRecoredTableViewCell" owner:self options:nil].firstObject;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    BWBRTStarsBetRecordModel *model = self.rootModel.data[indexPath.row];
    cell.model = model;
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
