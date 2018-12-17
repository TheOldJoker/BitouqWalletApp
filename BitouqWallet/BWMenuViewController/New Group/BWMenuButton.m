//
//  BWMenuButton.m
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/11/28.
//  Copyright © 2018 Joker. All rights reserved.
//

#import "BWMenuButton.h"
@interface BWMenuButton()
@property (nonatomic, strong) UIView *selectedView;
@property (nonatomic, strong) UILabel *customTitleLabel;
@end
@implementation BWMenuButton
- (UIView *)selectedView{
    if (!_selectedView) {
        _selectedView = [[UIView alloc] initWithFrame:(CGRectMake(0, 26, 44, 2))];
        _selectedView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_selectedView];
    }
    return _selectedView;
}
- (UILabel *)customTitleLabel{
    if (!_customTitleLabel) {
        _customTitleLabel = [[UILabel alloc] initWithFrame:(CGRectMake(60, 15, 120, 24))];
        [_customTitleLabel configWithTextColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:20.f] textAlignment:(NSTextAlignmentLeft) backgroundColor:nil];
        [self addSubview:_customTitleLabel];
    }
    return _customTitleLabel;
}
- (void)setIsSelected:(BOOL)isSelected{
    _isSelected = isSelected;
    if (isSelected) {
        self.selectedView.hidden = NO;
        self.customTitleLabel.textColor = [UIColor whiteColor];
        return;
    }
    self.selectedView.hidden = YES;
    self.customTitleLabel.textColor = RGBA(255, 255, 255, 0.6);
}
- (void)setCustomTitle:(NSString *)customTitle{
    _customTitle = customTitle;
    self.customTitleLabel.text = customTitle;
}
@end
