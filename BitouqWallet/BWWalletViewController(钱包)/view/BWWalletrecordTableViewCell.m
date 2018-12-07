//
//  BWWalletrecordTableViewCell.m
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/5.
//  Copyright © 2018 Joker. All rights reserved.
//

#import "BWWalletrecordTableViewCell.h"
@interface BWWalletrecordTableViewCell()
@property (strong, nonatomic) IBOutlet UIImageView *leftImageView;
@property (strong, nonatomic) IBOutlet UILabel *stateTitleLabel;
@property (strong, nonatomic) IBOutlet UILabel *moneyValueLabel;
@property (strong, nonatomic) IBOutlet UILabel *publickeyLabel;

@end
@implementation BWWalletrecordTableViewCell
- (void)setValueWithModel:(BWWalletrecordModel *)model {
    //type == 1發送代幣 type == 2接收代幣
    NSInteger type = 1;
    //入金賬戶與自己想通,則為接收代幣
    if ([model.topubkey isEqualToString:[BWUserManager shareManager].user.publickey]) {
        type = 2;
    }
    self.leftImageView.image = type == 1 ? [UIImage imageNamed:@"wallet_ record_send"] :[UIImage imageNamed:@"wallet_ record_get"];
    self.stateTitleLabel.text = type == 1 ? @"發送代幣" : @"接收代幣";
    self.moneyValueLabel.textColor = type == 1 ? [UIColor colorWithHexString:@"f42850"] : [UIColor colorWithHexString:@"7ed321"];
    self.moneyValueLabel.text = model.amount;
    self.publickeyLabel.text = [model.topubkey isEqualToString:[BWUserManager shareManager].user.publickey] ? model.fromprikey : model.topubkey;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
