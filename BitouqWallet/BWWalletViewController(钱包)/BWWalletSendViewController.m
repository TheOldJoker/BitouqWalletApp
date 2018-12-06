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
@interface BWWalletSendViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *mainTableView;
@property (nonatomic, strong) BWWalletSendHeadView *headView;
@property (nonatomic, strong) NSMutableArray *dataSource;
@end

@implementation BWWalletSendViewController
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self loadData];
}
- (void)viewDidLoad {
    [super viewDidLoad];
}
#pragma mark - func
- (void)loadData{
    [self.mainTableView reloadData];
}
#pragma mark - lazyload
- (NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}
- (BWWalletSendHeadView *)headView{
    if (!_headView) {
        _headView = [[BWWalletSendHeadView alloc] initWithFrame:(CGRectMake(0, 0, self.view.width, 0))];
        [_headView.sendButton addTarget:self action:@selector(sendAciton:) forControlEvents:(UIControlEventTouchUpInside)];
        [_headView initSubviews];
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
    NSLog(@"sendAciton");
}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    return self.dataSource.count;
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BWWalletrecordTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL"];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"BWWalletrecordTableViewCell" owner:self options:nil].firstObject;
    }
    [cell setValueWithModel:1];
    return cell;
}
#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
}
@end
