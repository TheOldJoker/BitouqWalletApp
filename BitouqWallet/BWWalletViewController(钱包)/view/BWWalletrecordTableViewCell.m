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
- (void)setValueWithModel:(NSInteger)model {
    self.leftImageView.image = model == 1 ? [UIImage imageNamed:@"wallet_ record_send"] :[UIImage imageNamed:@"wallet_ record_get"];
    self.stateTitleLabel.text = model == 1 ? @"發送代幣" : @"接收代幣";
    self.moneyValueLabel.textColor = model == 1 ? [UIColor colorWithHexString:@"f42850"] : [UIColor colorWithHexString:@"7ed321"];
    self.moneyValueLabel.text = @"1231212131231";
    self.publickeyLabel.text = @"8JWRqEGK84GxbF7jpn5TZoEnefjuzxDA39iBRrVYge2D";
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
