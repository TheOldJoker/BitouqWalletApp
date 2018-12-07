//
//  BWWalletSendHeadView.m
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/5.
//  Copyright © 2018 Joker. All rights reserved.
//

#import "BWWalletSendHeadView.h"
#import "BWWalletPublickeyInfoView.h"
@interface BWWalletSendHeadView()
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
    self.getAddressTextField.placeholder = @"输入接收地址";
    self.moneyTextField.placeholder = @"输入金额";
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
        _miningTextFiled.keyboardType = UIKeyboardTypeNumberPad;
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
        _moneyTextField.keyboardType = UIKeyboardTypeNumberPad;
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
@end
