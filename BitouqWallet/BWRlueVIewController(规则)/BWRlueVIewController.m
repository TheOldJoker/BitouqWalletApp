//
//  BWRlueVIewController.m
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/11/27.
//  Copyright © 2018 Joker. All rights reserved.
//

#import "BWRlueVIewController.h"
#import "BWRlueTableViewCell.h"
@interface BWRlueVIewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *mainTabTopValue;
@property (strong, nonatomic) IBOutlet UITableView *mainTableView;
@property (nonatomic, strong) NSMutableArray *dataSource;


@end

@implementation BWRlueVIewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"規則";
    [self initMenuNav];
    [self.mainTableView normalConfig];
    self.mainTabTopValue.constant = self.customNavTitleLabel.bottom + 5;
    [self loadData];
}
- (void)loadData{
    NSArray *titles = @[@"前置3星任選",@"前置3星雙殺",@"前置3星豹子",@"1星競猜",@"2星競猜",@"3星競猜",@"4星競猜",@"5星競猜"];
    NSArray *contents = @[
                          @"對5個位置中的前3位選擇一組數字進行競猜。中獎條件為無重複數字，如789，不考慮數字位順序，所選數字中包含開獎結果即可獲勝。",
                          @"對5個位置中的前3位選擇一組數字進行競猜。中獎條件為有2位數字相同，如778，不考慮數字位順序，所選數字中包含開獎結果即可獲勝。",
                          @"對5個位置中的前3位選擇一組數字進行競猜。中獎條件為3位數字全部相同，如777，所選數字中包含開獎結果即可獲勝。",
                          @"任意選擇5個位置中的1個位置進行投注，該位置上的數字與開獎結果一致，即可獲勝。期望獎金為理論最大化獎金，當同時選擇多個位置時，可能觸發重複中獎。",
                          @"任意選擇5個位置中的2個位置進行投注，該位置上的數字與開獎結果一致，即可獲勝。期望獎金為理論最大化獎金，當同時選擇多個位置時，可能觸發重複中獎。",
                          @"任意選擇5個位置中的3個位置進行投注，該位置上的數字與開獎結果一致，即可獲勝。期望獎金為理論最大化獎金，當同時選擇多個位置時，可能觸發重複中獎。",
                          @"任意選擇5個位置中的4個位置進行投注，該位置上的數字與開獎結果一致，即可獲勝。期望獎金為理論最大化獎金，當同時選擇多個位置時，可能觸發重複中獎。",
                          @"對5個位置進行全體競猜，所有位置上的數字與開獎結果均一致，即可以獲得期望獎金。"
                          ];
    for (int i = 0; i < titles.count; i++) {
        BWRlueModel *temp = [[BWRlueModel alloc] init];
        temp.title = titles[i];
        temp.content = contents[i];
        temp.type = i;
        [self.dataSource addObject:temp];
    }
    [self.mainTableView reloadData];
}
- (NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BWRlueTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL"];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"BWRlueTableViewCell" owner:self options:nil].firstObject;
    }
    BWRlueModel *model = self.dataSource[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell setValueWithModel:model];
    return cell;
}
@end
