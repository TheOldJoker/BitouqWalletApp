//
//  BWRlueTableViewCell.m
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/7.
//  Copyright © 2018 Joker. All rights reserved.
//

#import "BWRlueTableViewCell.h"
@interface BWRlueTableViewCell()
@property (strong, nonatomic) IBOutlet UILabel *mainTitleLabel;
@property (strong, nonatomic) IBOutlet UILabel *mainContentLabel;
@property (strong, nonatomic) IBOutlet UIImageView *starImageView;

@end
@implementation BWRlueTableViewCell
- (void)setValueWithModel:(BWRlueModel *)model
{
    
    self.mainTitleLabel.text = model.title;
    self.mainContentLabel.text = model.content;
    
    if (model.type > 2) {
        self.starImageView.hidden = YES;
        return;
    }
    self.starImageView.hidden = NO;
    switch (model.type) {
        case 0:
            self.starImageView.image = [UIImage imageNamed:@"rlue_star_half"];
            break;
        case 1:
            self.starImageView.image = [UIImage imageNamed:@"rlue_star2"];
            break;
        case 2:
            self.starImageView.image = [UIImage imageNamed:@"rlue_star3"];
            break;
        default:
            break;
    }
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
