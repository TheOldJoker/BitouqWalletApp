//
//  BWDiceBetView.m
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/12.
//  Copyright © 2018 Joker. All rights reserved.
//

#import "BWDiceBetView.h"
@interface BWDiceBetView()<UITextFieldDelegate>
@property (nonatomic, strong) UIImageView *back1;
@property (nonatomic, strong) UIImageView *back2;
@property (nonatomic, strong) UIImageView *icon;
@property (nonatomic, strong) UILabel *alertLabel;
@end
@implementation BWDiceBetView
- (void)initSubViews{
    self.userAssetLabel.text = @"錢包餘額";
    self.betValueTextField.placeholder = @"請輸入";
}
- (UITextField *)betValueTextField{
    if (!_betValueTextField) {
        _betValueTextField = [[UITextField alloc] initWithFrame:(CGRectMake(self.alertLabel.right + 2, 0, 140, 20))];
        _betValueTextField.font = [UIFont systemFontOfSize:13.f];
        _betValueTextField.centerY = self.alertLabel.centerY;
        _betValueTextField.keyboardType = UIKeyboardTypeDecimalPad;
        _betValueTextField.returnKeyType = UIReturnKeyDone;
        _betValueTextField.delegate = self;
        [self.back2 addSubview:_betValueTextField];
    }
    return _betValueTextField;
}
- (UILabel *)alertLabel{
    if (!_alertLabel) {
        _alertLabel = [[UILabel alloc] initWithFrame:(CGRectMake(self.icon.right + 8, 0, 66, 18))];
        _alertLabel.text = @"投注金額 |";
        _alertLabel.centerY = self.icon.centerY;
        [_alertLabel configWithTextColor:[UIColor blackColor] font:[UIFont systemFontOfSize:13.f] textAlignment:(NSTextAlignmentLeft) backgroundColor:nil];
        [self.back2 addSubview:_alertLabel];
    }
    return _alertLabel;
}
- (UIImageView *)icon{
    if (!_icon) {
        _icon = [[UIImageView alloc] initWithFrame:(CGRectMake(20, 23, 15, 15))];
        _icon.image = [UIImage imageNamed:@"dice_pakge"];
        [self.back2 addSubview:_icon];
    }
    return _icon;
}
- (UILabel *)userAssetLabel{
    if (!_userAssetLabel) {
        _userAssetLabel = [[UILabel alloc] initWithFrame:(CGRectMake(18, self.back1.height - 20, self.back1.width - 18 - 20, 14))];
        [_userAssetLabel configWithTextColor:[UIColor blackColor] font:[UIFont systemFontOfSize:10.f] textAlignment:(NSTextAlignmentLeft) backgroundColor:nil];
        [self.back1 addSubview:_userAssetLabel];
    }
    return _userAssetLabel;
}
- (UIImageView *)back1{
    if (!_back1) {
        _back1 = [[UIImageView alloc] initWithFrame:(CGRectMake(11, self.height - 56, 282, 56))];
        _back1.image = [UIImage imageNamed:@"dice_bet_background"];
        [self addSubview:_back1];
    }
    return _back1;
}
- (UIImageView *)back2{
    if (!_back2) {
        _back2 = [[UIImageView alloc] initWithFrame:(CGRectMake(0, 0, self.width, 68))];
        _back2.image = [UIImage imageNamed:@"dice_bet_background2"];
        _back2.userInteractionEnabled = YES;
        [self addSubview:_back2];
    }
    return _back2;
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if (textField == self.betValueTextField) {
        //如果输入的是“.”  判断之前已经有"."或者字符串为空
        if ([string isEqualToString:@"."] && ([textField.text rangeOfString:@"."].location != NSNotFound || [textField.text isEqualToString:@""])) {
            return NO;
        }
        //拼出输入完成的str,判断str的长度大于等于“.”的位置＋4,则返回false,此次插入string失败 （"379132.424",长度10,"."的位置6, 10>=6+4）
        NSMutableString *str = [[NSMutableString alloc] initWithString:textField.text];
        [str insertString:string atIndex:range.location];
        if (str.length >= [str rangeOfString:@"."].location+(2 + [BWUserManager shareManager].user.maxPoint)){
            return NO;
        }
    }
    return YES;
}
@end
