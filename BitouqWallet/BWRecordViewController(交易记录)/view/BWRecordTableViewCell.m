//
//  BWRecordTableViewCell.m
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/10.
//  Copyright © 2018 Joker. All rights reserved.
//

#import "BWRecordTableViewCell.h"
@interface BWRecordTableViewCell()
@property (strong, nonatomic) IBOutlet UILabel *leftTopLabel;
@property (strong, nonatomic) IBOutlet UILabel *rightTopLabel;
@property (strong, nonatomic) IBOutlet UILabel *bottomContentLabel;

@end
@implementation BWRecordTableViewCell
- (void)setValueWithModel:(BWRecordModel *)model{
    self.leftTopLabel.text = [model.createtime getTime];
    switch (model.type) {
            //轉賬
        case 1001:
        {
            //出金
            if ([model.frompubkey isEqualToString:[BWUserManager shareManager].user.publickey]) {
                self.rightTopLabel.text = [NSString stringWithFormat:@"- %@ BRT",model.amount];
                self.rightTopLabel.textColor = [UIColor colorWithHexString:@"f42850"];
                self.bottomContentLabel.text = [NSString stringWithFormat:@"發送 %@",model.topubkey];
            }else{
                self.rightTopLabel.text = [NSString stringWithFormat:@"+ %@ BRT",model.amount];
                self.rightTopLabel.textColor = [UIColor colorWithHexString:@"7ed321"];
                self.bottomContentLabel.text = [NSString stringWithFormat:@"接受 %@",model.frompubkey];
            }
        }
            break;
            //矿工费支出
        case 1002:
        {
            self.rightTopLabel.text = [NSString stringWithFormat:@"- %@ BRT",model.amount];
            self.rightTopLabel.textColor = [UIColor colorWithHexString:@"f42850"];
            self.bottomContentLabel.text = @"矿工费支出";
        }
            break;
            //投注 胜负手
        case 2001:
        {
            self.rightTopLabel.text = [NSString stringWithFormat:@"- %@ BRT",model.amount];
            self.rightTopLabel.textColor = [UIColor colorWithHexString:@"f42850"];
            self.bottomContentLabel.text = @"投注 胜负手";
        }
            break;
            //获胜 胜负手
        case 2002:
        {
            self.rightTopLabel.text = [NSString stringWithFormat:@"+ %@ BRT",model.amount];
            self.rightTopLabel.textColor = [UIColor colorWithHexString:@"7ed321"];
            self.bottomContentLabel.text = @"获胜 胜负手";
        }
            break;
            //投注 BRTStars1星竞猜
        case 3001:
        {
            self.rightTopLabel.text = [NSString stringWithFormat:@"- %@ BRT",model.amount];
            self.rightTopLabel.textColor = [UIColor colorWithHexString:@"f42850"];
            self.bottomContentLabel.text = @"投注 BRTStars1星竞猜";
        }
            break;
            //投注 BRTStars2星竞猜
        case 3002:
        {
            self.rightTopLabel.text = [NSString stringWithFormat:@"- %@ BRT",model.amount];
            self.rightTopLabel.textColor = [UIColor colorWithHexString:@"f42850"];
            self.bottomContentLabel.text = @"投注 BRTStars2星竞猜";
        }
            break;
            //投注 BRTStars3星竞猜
        case 3003:
        {
            self.rightTopLabel.text = [NSString stringWithFormat:@"- %@ BRT",model.amount];
            self.rightTopLabel.textColor = [UIColor colorWithHexString:@"f42850"];
            self.bottomContentLabel.text = @"投注 BRTStars3星竞猜";
        }
            break;
            //投注 BRTStars4星竞猜
        case 3004:
        {
            self.rightTopLabel.text = [NSString stringWithFormat:@"- %@ BRT",model.amount];
            self.rightTopLabel.textColor = [UIColor colorWithHexString:@"f42850"];
            self.bottomContentLabel.text = @"投注 BRTStars4星竞猜";
        }
            break;
            //投注 BRTStars5星竞猜
        case 3005:
        {
            self.rightTopLabel.text = [NSString stringWithFormat:@"- %@ BRT",model.amount];
            self.rightTopLabel.textColor = [UIColor colorWithHexString:@"f42850"];
            self.bottomContentLabel.text = @"投注 BRTStars5星竞猜";
        }
            break;
            //投注 BRTStars前置3星任选
        case 3006:
        {
            self.rightTopLabel.text = [NSString stringWithFormat:@"- %@ BRT",model.amount];
            self.rightTopLabel.textColor = [UIColor colorWithHexString:@"f42850"];
            self.bottomContentLabel.text = @"投注 BRTStars前置3星任选";
        }
            break;
            //投注 BRTStars前置3星双杀
        case 3007:
        {
            self.rightTopLabel.text = [NSString stringWithFormat:@"- %@ BRT",model.amount];
            self.rightTopLabel.textColor = [UIColor colorWithHexString:@"f42850"];
            self.bottomContentLabel.text = @"投注 BRTStars前置3星双杀";
        }
            break;
            //投注 BRTStars前置3星豹子
        case 3008:
        {
            self.rightTopLabel.text = [NSString stringWithFormat:@"- %@ BRT",model.amount];
            self.rightTopLabel.textColor = [UIColor colorWithHexString:@"f42850"];
            self.bottomContentLabel.text = @"投注 BRTStars前置3星豹子";
        }
            break;
            //获胜 BRTStars1星竞猜
        case 3011:
        {
            self.rightTopLabel.text = [NSString stringWithFormat:@"+ %@ BRT",model.amount];
            self.rightTopLabel.textColor = [UIColor colorWithHexString:@"7ed321"];
            self.bottomContentLabel.text = @"获胜 BRTStars1星竞猜";
        }
            break;
            //获胜 BRTStars2星竞猜
        case 3012:
        {
            self.rightTopLabel.text = [NSString stringWithFormat:@"+ %@ BRT",model.amount];
            self.rightTopLabel.textColor = [UIColor colorWithHexString:@"7ed321"];
            self.bottomContentLabel.text = @"获胜 BRTStars2星竞猜";
        }
            break;
            //获胜 BRTStars3星竞猜
        case 3013:
        {
            self.rightTopLabel.text = [NSString stringWithFormat:@"+ %@ BRT",model.amount];
            self.rightTopLabel.textColor = [UIColor colorWithHexString:@"7ed321"];
            self.bottomContentLabel.text = @"获胜 BRTStars3星竞猜";
        }
            break;
            //获胜 BRTStars4星竞猜
        case 3014:
        {
            self.rightTopLabel.text = [NSString stringWithFormat:@"+ %@ BRT",model.amount];
            self.rightTopLabel.textColor = [UIColor colorWithHexString:@"7ed321"];
            self.bottomContentLabel.text = @"获胜 BRTStars4星竞猜";
        }
            break;
            //获胜 BRTStars5星竞猜
        case 3015:
        {
            self.rightTopLabel.text = [NSString stringWithFormat:@"+ %@ BRT",model.amount];
            self.rightTopLabel.textColor = [UIColor colorWithHexString:@"7ed321"];
            self.bottomContentLabel.text = @"获胜 BRTStars5星竞猜";
        }
            break;
            //获胜 BRTStars前置3星任选
        case 3016:
        {
            self.rightTopLabel.text = [NSString stringWithFormat:@"+ %@ BRT",model.amount];
            self.rightTopLabel.textColor = [UIColor colorWithHexString:@"7ed321"];
            self.bottomContentLabel.text = @"获胜 BRTStars前置3星任选";
        }
            break;
            //获胜 BRTStars前置3星双杀
        case 3017:
        {
            self.rightTopLabel.text = [NSString stringWithFormat:@"+ %@ BRT",model.amount];
            self.rightTopLabel.textColor = [UIColor colorWithHexString:@"7ed321"];
            self.bottomContentLabel.text = @"获胜 BRTStars前置3星双杀";
        }
            break;
            //获胜 BRTStars前置3星豹子
        case 3018:
        {
            self.rightTopLabel.text = [NSString stringWithFormat:@"+ %@ BRT",model.amount];
            self.rightTopLabel.textColor = [UIColor colorWithHexString:@"7ed321"];
            self.bottomContentLabel.text = @"获胜 BRTStars前置3星豹子";
        }
            break;
            //挖矿+入金公钥
        case 3020:
        {
            self.rightTopLabel.text = [NSString stringWithFormat:@"+ %@ BRT",model.amount];
            self.rightTopLabel.textColor = [UIColor colorWithHexString:@"7ed321"];
            self.bottomContentLabel.text = [NSString stringWithFormat:@"挖礦 %@",model.topubkey];;
        }
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
