//
//  BWVoteTableViewCell.m
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/11.
//  Copyright © 2018 Joker. All rights reserved.
//

#import "BWVoteTableViewCell.h"
@interface BWVoteTableViewCell()
@property (strong, nonatomic) IBOutlet UILabel *pubkeyLabel;
@property (strong, nonatomic) IBOutlet UILabel *leftLabel;
@property (strong, nonatomic) IBOutlet UILabel *midLabel;
@property (strong, nonatomic) IBOutlet UILabel *rightLabel;

@end
@implementation BWVoteTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setModel:(BWMiningOwnerModel *)model{
    _model = model;
    self.userActionButton.model = model;
    //1.公鑰
    if ([model.pubkey isPubKey]) {
        NSMutableAttributedString *atString = [[NSMutableAttributedString alloc] initWithString:model.pubkey];
        [atString setAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"9014ee"]}
                          range:NSMakeRange(model.pubkey.length - 6, 6)];
        self.pubkeyLabel.attributedText = atString;
    }else{
        self.pubkeyLabel.text = model.pubkey;
    }
    //2.持幣量
    self.leftLabel.text = model.asset;
    //3.生產力
    self.midLabel.text = model.productRadio;
    //4.操作
    if ([model.pubkey isEqualToString:[BWUserManager shareManager].user.miningOwner]) {
        self.rightLabel.text = @"已投票";
        self.rightLabel.textColor = [UIColor colorWithHexString:@"f42850"];
    }else{
        self.rightLabel.text = @"投票";
        self.rightLabel.textColor = [UIColor colorWithHexString:@"410adf"];
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
