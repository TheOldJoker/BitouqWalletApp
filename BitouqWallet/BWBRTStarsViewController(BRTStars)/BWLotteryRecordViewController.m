//
//  BWLotteryRecordViewController.m
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/14.
//  Copyright © 2018 Joker. All rights reserved.
//

#import "BWLotteryRecordViewController.h"
#import "BWBRTStarsLotteryRecordRootModel.h"
#import "BWBRTRecordView.h"
#import "BWBRTLotteryRecordCell.h"
#import "BWBRTStarsLotteryRecordModel.h"
@interface BWLotteryRecordViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *mainTableView;
@property (nonatomic, strong) BWBRTRecordView *headView;
@property (nonatomic, strong) BWBRTStarsLotteryRecordRootModel *rootModel;
@end

@implementation BWLotteryRecordViewController
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
    [BWDataSource getTheLotteryRecordSuccess:^(id  _Nonnull response) {
        self.rootModel = [BWBRTStarsLotteryRecordRootModel mj_objectWithKeyValues:response];
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
        [_headView initSubviewsWithTitle1:@"期號" title2:@"記賬權" title3:@"記賬結果"];
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
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.rootModel.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BWBRTLotteryRecordCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL"];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"BWBRTLotteryRecordCell" owner:self options:nil].firstObject;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    BWBRTStarsLotteryRecordModel *model = self.rootModel.data[indexPath.row];
    cell.leftLabel.text = [NSString stringWithFormat:@"%07ld",[model.ID integerValue]];
    cell.midLabel.text = [model.miningpubkey substringFromIndex:38];
    if (model.result.length == 5) {
        NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithString:model.result];
        [attString setAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"7ed321"]}
                          range:NSMakeRange(0, 1)];
        [attString setAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"4a90e2"]}
                           range:NSMakeRange(1, 1)];
        [attString setAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"f42850"]}
                           range:NSMakeRange(2, 1)];
        [attString setAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"f6a93b"]}
                           range:NSMakeRange(3, 1)];
        [attString setAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]}
                           range:NSMakeRange(4, 1)];
        cell.rightLabel.attributedText = attString;
    }else{
        cell.rightLabel.text = model.result;
    }
    return cell;
}

@end
