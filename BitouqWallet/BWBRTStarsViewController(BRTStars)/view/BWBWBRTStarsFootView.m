//
//  BWBWBRTStarsFootView.m
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/13.
//  Copyright © 2018 Joker. All rights reserved.
//

#import "BWBWBRTStarsFootView.h"
@interface BWBWBRTStarsFootView()<UITextFieldDelegate>
@property (nonatomic, strong) UIImageView *topBackImageView;
@property (nonatomic, strong) UIView *bottomBackView;
//投注
@property (nonatomic, strong) UIImageView *back1;
@property (nonatomic, strong) UIImageView *back2;
@property (nonatomic, strong) UILabel *alertLabel;

@property (nonatomic, strong) UILabel *stakesNumberLabel;
@property (nonatomic, strong) UILabel *bonusLabel;

@end
@implementation BWBWBRTStarsFootView
- (void)initSubViews{
    self.bottomBackView.hidden = NO;
    self.topBackImageView.image = [UIImage imageNamed:@"brtstar_footer_back"];
    self.userAssetLabel.text = @"錢包餘額";
    self.betValueTextField.placeholder = @"請輸入";
    self.multipleTextField.placeholder = @"请输入投注倍数";
    self.multipleTextField.text = @"1";
    self.sendButton.userInteractionEnabled = YES;
    [self reloadData];
}
- (void)setStakesValue:(NSString *)stakes total:(NSString *)total bonus:(NSString *)bonus{
    self.stakesNumberLabel.text = [NSString stringWithFormat:@"已選擇 %@ 注，共 %@ BRT",stakes,total];
    self.bonusLabel.text = [NSString stringWithFormat:@"期望獎金：%@ BRT",bonus];
}
- (void)reloadData{
    [self setStakesValue:@"0" total:@"0" bonus:@"0"];
    if (self.gameArithmetic == nil) {
        return;
    }
    if (self.gameOdds == nil) {
        return;
    }
    //投注数量
    NSString *stakesString = [self.gameArithmetic getBetWithGameType:self.gameType];
    //注数 * 单注金额 * 投注倍数
    NSInteger stakes = [[self.gameArithmetic getBetWithGameType:self.gameType] integerValue];
    double singleBet = stringIsEmpty(self.betValueTextField.text) ? 0 : [self.betValueTextField.text doubleValue];
    NSString *totalString = [NSString stringWithFormat:@"%.4lf",stakes * singleBet * [self.multipleTextField.text integerValue]];
    //期望奖金 = 赔率*投注倍数*单注金额*理论中奖次数n
    //赔率
    double gameOdds = [[self.gameOdds valueForKey:[NSString stringWithFormat:@"%ld",self.gameType]] doubleValue];
    //理论中奖n
    NSInteger n = [self.gameArithmetic getWinNWithGameType:self.gameType];
    NSString *bonusString = [NSString stringWithFormat:@"%.4lf",gameOdds * [self.multipleTextField.text integerValue] * singleBet * n];
    [self setStakesValue:stakesString total:totalString bonus:bonusString];
}

- (UIButton *)sendButton{
    if (!_sendButton) {
        _sendButton = [[UIButton alloc] initWithFrame:(CGRectMake(self.width - 160, 213, 160, 50))];
        [_sendButton setTitle:@"競猜" forState:(UIControlStateNormal)];
        [_sendButton setBackgroundImage:[UIImage imageNamed:@"wallet_send"] forState:(UIControlStateNormal)];
        [_sendButton setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        _sendButton.titleLabel.font = [UIFont systemFontOfSize:13.f];
        [self.bottomBackView addSubview:_sendButton];
    }
    return _sendButton;
}
- (UIView *)bottomBackView{
    if (!_bottomBackView) {
        _bottomBackView = [[UIView alloc] initWithFrame:(CGRectMake(0, 49, self.width, 413))];
        _bottomBackView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_bottomBackView];
    }
    return _bottomBackView;
}
- (UIImageView *)topBackImageView{
    if (!_topBackImageView) {
        _topBackImageView = [[UIImageView alloc] initWithFrame:(CGRectMake(0, 0, self.width, 98))];
        _topBackImageView.userInteractionEnabled = YES;
        
        UIImageView *icon = [[UIImageView alloc] initWithFrame:(CGRectMake(_topBackImageView.width - 77, 0, 50, 50))];
        icon.image = [UIImage imageNamed:@"brtstar_logo"];
        icon.centerY = _topBackImageView.height / 2;
        [_topBackImageView addSubview:icon];
        
        self.stakesNumberLabel = [[UILabel alloc] initWithFrame:(CGRectMake(30, 20, _topBackImageView.width - 60, 20))];
        [self.stakesNumberLabel configWithTextColor:[UIColor blackColor] font:[UIFont systemFontOfSize:15.f] textAlignment:(NSTextAlignmentLeft) backgroundColor:nil];
        [_topBackImageView addSubview:self.stakesNumberLabel];
        
        self.bonusLabel = [[UILabel alloc] initWithFrame:(CGRectMake(30, self.stakesNumberLabel.bottom + 15, _topBackImageView.width - 60, 20))];
        [self.bonusLabel configWithTextColor:[UIColor blackColor] font:[UIFont systemFontOfSize:15.f] textAlignment:(NSTextAlignmentLeft) backgroundColor:nil];
        [_topBackImageView addSubview:self.bonusLabel];
        
        [self addSubview:_topBackImageView];
    }
    return _topBackImageView;
}
- (UITextField *)multipleTextField{
    if (!_multipleTextField) {
        UIImageView *back = [[UIImageView alloc] initWithFrame:(CGRectMake(self.width - 181, self.back2.bottom + 12, 282, 56))];
        back.image = [UIImage imageNamed:@"dice_bet_background2"];
        back.userInteractionEnabled = YES;
        [self addSubview:back];
        
        UILabel * alertLabel =[[UILabel alloc] initWithFrame:(CGRectMake(24, 15, 66, 18))];
        alertLabel.text = @"投注倍數 |";
        [alertLabel configWithTextColor:[UIColor blackColor] font:[UIFont systemFontOfSize:13.f] textAlignment:(NSTextAlignmentLeft) backgroundColor:nil];
        [back addSubview:alertLabel];
        
        _multipleTextField = [[UITextField alloc] initWithFrame:(CGRectMake(alertLabel.right + 2, 0, 140, 20))];
        _multipleTextField.font = [UIFont systemFontOfSize:13.f];
        _multipleTextField.centerY = alertLabel.centerY;
        _multipleTextField.keyboardType = UIKeyboardTypeNumberPad;
        _multipleTextField.returnKeyType = UIReturnKeyDone;
        _multipleTextField.delegate = self;
        [back addSubview:_multipleTextField];
    }
    return _multipleTextField;
}
- (UITextField *)betValueTextField{
    if (!_betValueTextField) {
        _betValueTextField = [[UITextField alloc] initWithFrame:(CGRectMake(self.alertLabel.right + 2, 0, 140, 20))];
        _betValueTextField.font = [UIFont systemFontOfSize:13.f];
        _betValueTextField.centerY = self.alertLabel.centerY;
        _betValueTextField.keyboardType = UIKeyboardTypeNumberPad;
        _betValueTextField.returnKeyType = UIReturnKeyDone;
        _betValueTextField.delegate = self;
        [self.back2 addSubview:_betValueTextField];
    }
    return _betValueTextField;
}
- (UILabel *)alertLabel{
    if (!_alertLabel) {
        _alertLabel = [[UILabel alloc] initWithFrame:(CGRectMake(24, 22, 66, 18))];
        _alertLabel.text = @"單注金額 |";
        [_alertLabel configWithTextColor:[UIColor blackColor] font:[UIFont systemFontOfSize:13.f] textAlignment:(NSTextAlignmentLeft) backgroundColor:nil];
        [self.back2 addSubview:_alertLabel];
    }
    return _alertLabel;
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
        _back1 = [[UIImageView alloc] initWithFrame:(CGRectMake(self.width - 282, self.topBackImageView.bottom + 35, 282, 56))];
        _back1.image = [UIImage imageNamed:@"dice_bet_background"];
        [self addSubview:_back1];
    }
    return _back1;
}
- (UIImageView *)back2{
    if (!_back2) {
        _back2 = [[UIImageView alloc] initWithFrame:(CGRectMake(self.width - 295, self.topBackImageView.bottom + 15, 295, 68))];
        _back2.image = [UIImage imageNamed:@"dice_bet_background2"];
        _back2.userInteractionEnabled = YES;
        [self addSubview:_back2];
    }
    return _back2;
}
- (void)textFieldDidEndEditing:(UITextField *)textField;{
    if (textField == self.multipleTextField) {
        if (stringIsEmpty(self.multipleTextField.text)) {
            self.multipleTextField.text = @"1";
        }
    }
    [self reloadData];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    if (textField == self.multipleTextField) {
        if (stringIsEmpty(self.multipleTextField.text)) {
            self.multipleTextField.text = @"1";
        }
    }
    return YES;
}
- (void)setGameType:(NSInteger)gameType{
    _gameType = gameType;
    [self setStakesValue:@"0" total:@"0" bonus:@"0"];
}
- (void)setGameOdds:(NSDictionary *)gameOdds{
    _gameOdds = gameOdds;
    [self reloadData];
}
- (void)setGameArithmetic:(BWGameArithmeticModel *)gameArithmetic{
    if (_gameArithmetic == gameArithmetic) {
        return;
    }
    _gameArithmetic = gameArithmetic;
    [self reloadData];
}
@end
