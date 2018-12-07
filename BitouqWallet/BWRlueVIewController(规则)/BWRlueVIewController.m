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


@end

@implementation BWRlueVIewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"規則";
    [self initMenuNav];
    self.mainTabTopValue.constant = self.customNavTitleLabel.bottom + 5;
}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BWRlueTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL"];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"BWRlueTableViewCell" owner:self options:nil].firstObject;
    }
    return cell;
}
@end
