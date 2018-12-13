//
//  BWBRTStarsTableViewCell.m
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/13.
//  Copyright © 2018 Joker. All rights reserved.
//

#import "BWBRTStarsTableViewCell.h"

@implementation BWBRTStarsTableViewCell

- (void)setFrame:(CGRect)frame{
    self.mainLabel.width = SCREEN_WIDTH;
    [super setFrame:frame];
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
