//
//  BWWalletPublickeyInfoView.m
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/4.
//  Copyright © 2018 Joker. All rights reserved.
//

#import "BWWalletPublickeyInfoView.h"
@interface BWWalletPublickeyInfoView()
@property (nonatomic, strong) UIImageView *logoView;
@property (nonatomic, strong) UIImageView *backgroundImageView;
@property (nonatomic, strong) UILabel *titleLabel;//BRT-Wallet
@property (nonatomic, strong) UILabel *publickeyLabel;//公鑰
@property (nonatomic, strong) UIButton *duplicateButton;//複製按鈕
@property (nonatomic, strong) UILabel *walletMoneyLabel;//錢包餘額
@end
@implementation BWWalletPublickeyInfoView
- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}
- (void)initSubview{
    self.logoView.hidden = NO;
    self.titleLabel.hidden = NO;
    [self.duplicateButton addTarget:self action:@selector(copyPublickeyAction:) forControlEvents:(UIControlEventTouchUpInside)];
}
- (UILabel *)walletMoneyLabel{
    if (!_walletMoneyLabel) {
        _walletMoneyLabel = [[UILabel alloc] initWithFrame:(CGRectMake(20, self.publickeyLabel.bottom + 17, self.backgroundImageView.width - 40, 28))];
        [_walletMoneyLabel configWithTextColor:[UIColor blackColor] font:[UIFont systemFontOfSize:20.f] textAlignment:(NSTextAlignmentRight) backgroundColor:nil];
        [self.backgroundImageView addSubview:_walletMoneyLabel];
    }
    return _walletMoneyLabel;
}
- (UIButton *)duplicateButton{
    if (!_duplicateButton) {
        _duplicateButton = [[UIButton alloc] initWithFrame:(CGRectMake(self.publickeyLabel.right + 5, 0, 18, 18))];
        _duplicateButton.centerY = self.publickeyLabel.centerY;
        [_duplicateButton setImage:[UIImage imageNamed:@"main_copy"] forState:(UIControlStateNormal)];
        
        [self.backgroundImageView addSubview:_duplicateButton];
    }
    return _duplicateButton;
}
- (UILabel *)publickeyLabel{
    if (!_publickeyLabel) {
        _publickeyLabel = [[UILabel alloc] initWithFrame:(CGRectMake(20, self.titleLabel.bottom + 3, 234, 18))];
        _publickeyLabel.lineBreakMode = NSLineBreakByTruncatingMiddle;
        [_publickeyLabel configWithTextColor:[UIColor grayColor] font:[UIFont systemFontOfSize:13.f] textAlignment:(NSTextAlignmentJustified) backgroundColor:nil];
        [self.backgroundImageView addSubview:_publickeyLabel];
    }
    return _publickeyLabel;
}
- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:(CGRectMake(20, 15, 82, 21))];
        [_titleLabel configWithTextColor:[UIColor blackColor] font:[UIFont systemFontOfSize:15.f] textAlignment:(NSTextAlignmentLeft) backgroundColor:nil];
        _titleLabel.text = @"BRT_Wallet";
        [self.backgroundImageView addSubview:_titleLabel];
    }
    return _titleLabel;
}
- (UIButton *)reloadButton{
    if (!_reloadButton) {
        
        _reloadButton = [[UIButton alloc] initWithFrame:(CGRectMake(self.backgroundImageView.width - 36, 17, 16, 16))];
        [_reloadButton setImage:[UIImage imageNamed:@"main_reload"] forState:(UIControlStateNormal)];
        [self.backgroundImageView addSubview:_reloadButton];
    }
    return _reloadButton;
}
- (UIImageView *)logoView{
    if (!_logoView) {
        _logoView = [[UIImageView alloc] initWithFrame:(CGRectMake(self.backgroundImageView.x - 16, (self.height - 32) / 2, 32, 32))];
        _logoView.image = [UIImage imageNamed:@"wallet_groupR"];
        [self addSubview:_logoView];
    }
    return _logoView;
}
- (UIImageView *)backgroundImageView{
    if (!_backgroundImageView) {
        _backgroundImageView = [[UIImageView alloc] initWithFrame:(CGRectMake(self.width - 335, 0, 335, 126))];
        _backgroundImageView.image = [UIImage imageNamed:@"wallet_public_key_background"];
        _backgroundImageView.userInteractionEnabled = YES;
        [self addSubview:_backgroundImageView];
    }
    return _backgroundImageView;
}
- (void)setPublickey:(NSString *)publickey{
    if (_publickey != publickey) {
        _publickey = publickey;
        self.publickeyLabel.text = publickey;
    }
}
- (void)setMoney:(NSString *)money{
    if (_money != money) {
        _money = money;
        self.walletMoneyLabel.text = money;
    }
}
- (void)copyPublickeyAction:(UIButton *)sender{
    if (stringIsEmpty(self.publickey)) {
        [self.viewController showWeakAlertWithString:@"未獲取公鑰"];
        return;
    }
    UIPasteboard *pab = [UIPasteboard generalPasteboard];
    [pab setString:self.publickey];
    if (pab == nil) {
        [self.viewController showWeakAlertWithString:@"複製失敗"];
    }else
    {
        [self.viewController showWeakAlertWithString:@"已複製公鑰"];
    }
}
@end
