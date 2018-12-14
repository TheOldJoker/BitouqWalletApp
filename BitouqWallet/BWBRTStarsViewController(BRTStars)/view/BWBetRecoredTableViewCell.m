//
//  BWBetRecoredTableViewCell.m
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/14.
//  Copyright © 2018 Joker. All rights reserved.
//

#import "BWBetRecoredTableViewCell.h"
@interface BWBetRecoredTableViewCell()
@property (strong, nonatomic) IBOutlet UILabel *leftLabel1;
@property (strong, nonatomic) IBOutlet UILabel *leftLabel2;
@property (strong, nonatomic) IBOutlet UILabel *midLable1;
@property (strong, nonatomic) IBOutlet UILabel *rightLabel;
@end
@implementation BWBetRecoredTableViewCell
- (void)setModel:(BWBRTStarsBetRecordModel *)model{
    
    //期号
    self.leftLabel1.text = [NSString stringWithFormat:@"%07ld",[model.term integerValue]];
    //开奖结果
    if (stringIsEmpty(model.result)) {
        self.rightLabel.text = @"未開獎";
    }else{
        if (model.win) {
            self.rightLabel.text = model.amount;
        }else{
            self.rightLabel.text = @"未中獎";
        }
    }
    //1~5星
//    self.midLable1.text = [NSString stringWithFormat:@"綠%@",model.num1];
//    self.midLabel2.text = [NSString stringWithFormat:@"藍%@",model.num2];
//    self.midLabel3.text = [NSString stringWithFormat:@"紅%@",model.num3];
//    self.midLabel4.text = [NSString stringWithFormat:@"黃%@",model.num4];
//    self.midLabel5.text = [NSString stringWithFormat:@"灰%@",model.num5];
//    self.midLabel2.hidden = NO;
//    self.midLabel3.hidden = NO;
//    self.midLabel4.hidden = NO;
//    self.midLabel5.hidden = NO;
    
    NSMutableString *selectedNumers = [NSMutableString string];
    if (!stringIsEmpty(model.num1)) {
        [selectedNumers appendFormat:@"綠%@\n",model.num1];
    }
    if (!stringIsEmpty(model.num2)) {
        [selectedNumers appendFormat:@"藍%@\n",model.num2];
    }
    if (!stringIsEmpty(model.num3)) {
        [selectedNumers appendFormat:@"紅%@\n",model.num3];
    }
    if (!stringIsEmpty(model.num4)) {
        [selectedNumers appendFormat:@"黃%@\n",model.num4];
    }
    if (!stringIsEmpty(model.num5)) {
        [selectedNumers appendFormat:@"灰%@\n",model.num5];
    }
    self.midLable1.text = selectedNumers;
    //游戏类型
    switch ([model.type integerValue]) {
            //1星竞猜
        case 1:
        {
            self.leftLabel2.text = @"1星竞猜";
        }
            break;
            //2星竞猜
        case 2:
        {
            self.leftLabel2.text = @"2星竞猜";
        }
            break;
            //3星竞猜
        case 3:
        {
            self.leftLabel2.text = @"3星竞猜";
        }
            break;
            //4星竞猜
        case 4:
        {
            self.leftLabel2.text = @"4星竞猜";
        }
            break;
            //5星竞猜
        case 5:
        {
            self.leftLabel2.text = @"5星竞猜";
        }
            break;
            //前置3星任选
        case 6:
        {
            self.leftLabel2.text = @"前置3星任选";
            self.midLable1.text = model.num1;
        }
            break;
            //前置3星双杀
        case 7:
        {
            self.leftLabel2.text = @"前置3星双杀";
            self.midLable1.text = model.num1;
        }
            break;
            //前置3星豹子
        case 8:
        {
            self.leftLabel2.text = @"前置3星豹子";
            self.midLable1.text = model.num1;
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
