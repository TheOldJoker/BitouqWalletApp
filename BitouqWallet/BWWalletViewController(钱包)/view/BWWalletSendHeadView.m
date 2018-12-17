//
//  BWWalletSendHeadView.m
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/5.
//  Copyright © 2018 Joker. All rights reserved.
//

#import "BWWalletSendHeadView.h"
#import "BWWalletPublickeyInfoView.h"
@interface BWWalletSendHeadView()<UITextFieldDelegate>
@property (nonatomic, strong) BWWalletPublickeyInfoView *publickeyInfoView;
@property (nonatomic, strong) UILabel *bottomLabel;
@end
@implementation BWWalletSendHeadView
- (void)setMainModel:(BWWalletSendModel *)mainModel{
    _mainModel = mainModel;
    BWUser *user = [BWUserManager shareManager].user;
    self.publickeyInfoView.publickey = user.publickey;
    self.publickeyInfoView.money = [NSString stringWithFormat:@"%@ BRT",user.asset];
    self.miningTextFiled.placeholder = [NSString stringWithFormat:@"礦工費 %@",mainModel.miningMoney];
}
- (void)initSubviews{
    [self.publickeyInfoView initSubview];
    self.getAddressTextField.placeholder = @"輸入接收地址";
    self.moneyTextField.placeholder = @"輸入金額";
    self.miningTextFiled.placeholder = @"";
    self.height = self.bottomLabel.bottom + 17;
}
- (UILabel *)bottomLabel{
    if (!_bottomLabel) {
        _bottomLabel = [[UILabel alloc] initWithFrame:(CGRectMake(20, self.publickeyInfoView.bottom + 266, self.width - 40, 21))];
        [_bottomLabel configWithTextColor:[UIColor blackColor] font:[UIFont systemFontOfSize:15.f] textAlignment:(NSTextAlignmentLeft) backgroundColor:nil];
        _bottomLabel.text = @"最近記錄";
        [self addSubview:_bottomLabel];
    }
    return _bottomLabel;
}
- (UIButton *)sendButton{
    if (!_sendButton) {
        _sendButton = [[UIButton alloc] initWithFrame:(CGRectMake(self.width - 160, self.publickeyInfoView.bottom + 189, 160, 50))];
        [_sendButton setTitle:@"發送" forState:(UIControlStateNormal)];
        [_sendButton setBackgroundImage:[UIImage imageNamed:@"wallet_send"] forState:(UIControlStateNormal)];
        
        [_sendButton setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        
        _sendButton.titleLabel.font = [UIFont systemFontOfSize:13.f];
        [self addSubview:_sendButton];
    }
    return _sendButton;
}
- (UITextField *)miningTextFiled{
    if (!_miningTextFiled) {
        UIView *backgroundView = [[UIView alloc] initWithFrame:(CGRectMake(215, self.publickeyInfoView.bottom + 130, self.width - 215, 50))];
        backgroundView.backgroundColor = [UIColor colorWithHexString:@"eff0f1"];
        [backgroundView setCornerWithCornerSize:(MyCornerSizeMake(5, 0, 0, 5))];
        [self addSubview:backgroundView];
        _miningTextFiled = [[UITextField alloc] initWithFrame:(CGRectMake(20, 16, backgroundView.width - 20, 18))];
        _miningTextFiled.font = [UIFont systemFontOfSize:13.f];
        _miningTextFiled.keyboardType = UIKeyboardTypeDecimalPad;
        _miningTextFiled.delegate = self;
        [backgroundView addSubview:_miningTextFiled];
    }
    return _miningTextFiled;
}
- (UITextField *)moneyTextField{
    if (!_moneyTextField) {
        UIView *backgroundView = [[UIView alloc] initWithFrame:(CGRectMake(40, self.publickeyInfoView.bottom + 69, self.width - 40, 50))];
        backgroundView.backgroundColor = [UIColor colorWithHexString:@"eff0f1"];
        [backgroundView setCornerWithCornerSize:(MyCornerSizeMake(5, 0, 0, 5))];
        [self addSubview:backgroundView];
        _moneyTextField = [[UITextField alloc] initWithFrame:(CGRectMake(20, 16, self.width - 60, 18))];
        _moneyTextField.font = [UIFont systemFontOfSize:13.f];
        _moneyTextField.keyboardType = UIKeyboardTypeDecimalPad;
        _moneyTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _moneyTextField.delegate = self;
        [backgroundView addSubview:_moneyTextField];
    }
    return _moneyTextField;
}
- (UITextField *)getAddressTextField{
    if (!_getAddressTextField) {
        UIView *backgroundView = [[UIView alloc] initWithFrame:(CGRectMake(40, self.publickeyInfoView.bottom + 10, self.width - 40, 50))];
        backgroundView.backgroundColor = [UIColor colorWithHexString:@"eff0f1"];
        [backgroundView setCornerWithCornerSize:(MyCornerSizeMake(5, 0, 0, 5))];
        [self addSubview:backgroundView];
        _getAddressTextField = [[UITextField alloc] initWithFrame:(CGRectMake(20, 16, self.width - 100, 18))];
        _getAddressTextField.font = [UIFont systemFontOfSize:13.f];
        _getAddressTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        [backgroundView addSubview:_getAddressTextField];
        
        self.codeButton = [[UIButton alloc] initWithFrame:(CGRectMake(backgroundView.width - 36, 15, 20, 20))];
        [self.codeButton setImage:[UIImage imageNamed:@"wallet_code"] forState:(UIControlStateNormal)];
        [backgroundView addSubview:self.codeButton];
    }
    return _getAddressTextField;
}
- (BWWalletPublickeyInfoView *)publickeyInfoView{
    if (!_publickeyInfoView) {
        _publickeyInfoView = [[BWWalletPublickeyInfoView alloc] initWithFrame:(CGRectMake(0, 30, self.width, 126))];
//        [_publickeyInfoView initSubview];
        [_publickeyInfoView.reloadButton addTarget:self action:@selector(reloadDataAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [self addSubview:_publickeyInfoView];
    }
    return _publickeyInfoView;
}
- (void)reloadDataAction:(UIButton *)sender{
    if ([self.delegate respondsToSelector:@selector(walletSendHeadReloadDataAciton)]) {
        [self.delegate walletSendHeadReloadDataAciton];
    }
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if (textField == self.moneyTextField || textField == self.miningTextFiled) {
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
