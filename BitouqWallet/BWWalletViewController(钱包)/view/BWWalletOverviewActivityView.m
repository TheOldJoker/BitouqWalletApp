//
//  BWWalletOverviewActivityView.m
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/5.
//  Copyright © 2018 Joker. All rights reserved.
//

#import "BWWalletOverviewActivityView.h"
@interface BWWalletOverviewActivityView()
@property (nonatomic, strong) UIImageView *mainBackgroundImageView;
@property (nonatomic, strong) UIView *pointView;
@property (nonatomic, strong) UILabel *titleLable;
@property (nonatomic, strong) UIImageView *logoView;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UIView *bottomView;
@end
@implementation BWWalletOverviewActivityView
- (void)initSubView{
    self.mainBackgroundImageView.image = [UIImage imageNamed:@"wallet_overview_background"];
}
- (UILabel *)contentLabel{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] initWithFrame:(CGRectMake(20, self.bottomView.bottom - 40, self.bottomView.width, 30))];
        [_contentLabel configWithTextColor:[UIColor blackColor] font:[UIFont systemFontOfSize:20] textAlignment:(NSTextAlignmentLeft) backgroundColor:nil];
        [self.mainBackgroundImageView addSubview:_contentLabel];
    }
    return _contentLabel;
}
- (UIView *)bottomView{
    if (!_bottomView) {
        _bottomView = [[UIView alloc] initWithFrame:(CGRectMake(20, self.height - 24, self.width - 40, 4))];
        [_bottomView setCornerRadius:2 borderWidth:1 borderColor:nil];
        [self.mainBackgroundImageView addSubview:_bottomView];
    }
    return _bottomView;
}
- (UILabel *)titleLable{
    if (!_titleLable) {
        _titleLable = [[UILabel alloc] initWithFrame:(CGRectMake(self.pointView.right + 8, 0, 100, 20))];
        [_titleLable configWithTextColor:[UIColor grayColor] font:[UIFont systemFontOfSize:12.f] textAlignment:(NSTextAlignmentLeft) backgroundColor:nil];
        _titleLable.centerY = self.pointView.centerY;
        [self.mainBackgroundImageView addSubview:_titleLable];
    }
    return _titleLable;
}
- (UIView *)pointView{
    if (!_pointView) {
        _pointView = [[UIView alloc] initWithFrame:(CGRectMake(20, 28, 4, 4))];
        [_pointView setCornerRadius:2 borderWidth:1 borderColor:nil];
        [self.mainBackgroundImageView addSubview:_pointView];
    }
    return _pointView;
}
- (UIImageView *)logoView{
    if (!_logoView) {
        _logoView = [[UIImageView alloc] initWithFrame:(CGRectMake(self.width - 45 - 17, 15, 45, 45))];
        [self.mainBackgroundImageView addSubview:_logoView];
    }
    return _logoView;
}
- (UIImageView *)mainBackgroundImageView{
    if (!_mainBackgroundImageView) {
        _mainBackgroundImageView = [[UIImageView alloc] initWithFrame:(CGRectMake(0, 0, self.width, self.height))];
//        _mainBackgroundImageView.contentMode = UIViewContentModeScaleAspectFit;
        _mainBackgroundImageView.layer.shadowColor = [UIColor colorWithHexString:@"DCDCDC"].CGColor;
        _mainBackgroundImageView.layer.shadowOffset = CGSizeMake(2.0, 2.0);
        _mainBackgroundImageView.layer.shadowOpacity = YES;
        [self addSubview:_mainBackgroundImageView];
    }
    return _mainBackgroundImageView;
}
- (void)setIcon:(NSString *)icon{
    _icon = icon;
    self.logoView.image = [UIImage imageNamed:icon];
}
- (void)setMainColor:(UIColor *)mainColor{
    _mainColor = mainColor;
    self.pointView.backgroundColor = mainColor;
    self.bottomView.backgroundColor = mainColor;
}
- (void)setTitle:(NSString *)title{
    _title = title;
    self.titleLable.text = title;
    [self.titleLable reSetWidth];
}
- (void)setContent:(NSString *)content{
    _content = content;
    self.contentLabel.text = content;
}
@end
