//
//  BWWalletTopSelectedView.m
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/4.
//  Copyright © 2018 Joker. All rights reserved.
//

#import "BWWalletTopSelectedView.h"
@interface BWWalletTopSelectedView()
@property (nonatomic, strong) UIButton *overviewButton;
@property (nonatomic, strong) UIButton *sendButton;
@property (nonatomic, strong) UIButton *getButton;
@property (nonatomic, strong) UIView *sliderView;
@property (nonatomic, strong) NSArray *buttons;
@end
@implementation BWWalletTopSelectedView
- (void)initConfig{
    self.buttons = @[self.overviewButton,self.sendButton,self.getButton];
    self.selectedIndex = 0;
}
- (UIView *)sliderView{
    if (!_sliderView) {
        _sliderView = [[UIView alloc] initWithFrame:(CGRectMake(0, 48, 36, 2))];
        _sliderView.backgroundColor = [UIColor colorWithHexString:@"#410adf"];
        [self addSubview:_sliderView];
    }
    return _sliderView;
}
- (UIButton *)overviewButton{
    if (!_overviewButton) {
        _overviewButton = [[UIButton alloc] initWithFrame:(CGRectMake(30, 15, 36, 21))];
        [_overviewButton setTitle:@"概覽" forState:(UIControlStateNormal)];
        [_overviewButton setTitleColor:[UIColor grayColor] forState:(UIControlStateNormal)];
        [_overviewButton setTitleColor:[UIColor blackColor] forState:(UIControlStateSelected)];
        _overviewButton.titleLabel.font = [UIFont systemFontOfSize:15.f];
        _overviewButton.tag = 2000;
        [_overviewButton addTarget:self action:@selector(buttonAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [self addSubview:_overviewButton];
    }
    return _overviewButton;
}
- (UIButton *)sendButton{
    if (!_sendButton) {
        _sendButton = [[UIButton alloc] initWithFrame:(CGRectMake(110, 15, 36, 21))];
        [_sendButton setTitle:@"發送" forState:(UIControlStateNormal)];
        [_sendButton setTitleColor:[UIColor grayColor] forState:(UIControlStateNormal)];
        [_sendButton setTitleColor:[UIColor blackColor] forState:(UIControlStateSelected)];
        _sendButton.titleLabel.font = [UIFont systemFontOfSize:15.f];
        _sendButton.tag = 2001;
        [_sendButton addTarget:self action:@selector(buttonAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [self addSubview:_sendButton];
    }
    return _sendButton;
}
- (UIButton *)getButton{
    if (!_getButton) {
        _getButton = [[UIButton alloc] initWithFrame:(CGRectMake(190, 15, 36, 21))];
        [_getButton setTitle:@"接收" forState:(UIControlStateNormal)];
        [_getButton setTitleColor:[UIColor grayColor] forState:(UIControlStateNormal)];
        [_getButton setTitleColor:[UIColor blackColor] forState:(UIControlStateSelected)];
        _getButton.titleLabel.font = [UIFont systemFontOfSize:15.f];
        _getButton.tag = 2002;
        [_getButton addTarget:self action:@selector(buttonAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [self addSubview:_getButton];
    }
    return _getButton;
}
- (void)buttonAction:(UIButton *)sender{
    NSInteger index = sender.tag - 2000;
    self.selectedIndex = index;
    if ([self.delegate respondsToSelector:@selector(topSelectedViewSelectedIndex:)]) {
        [self.delegate topSelectedViewSelectedIndex:index];
    }
}
- (void)setSelectedIndex:(NSInteger)selectedIndex{
    _selectedIndex = selectedIndex;
    for (UIButton *temp in self.buttons) {
        temp.selected = NO;
    }
    UIButton *selectedButton = self.buttons[selectedIndex];
    selectedButton.selected = YES;
    [UIView animateWithDuration:0.2 animations:^{
        self.sliderView.x = selectedButton.x;
    }];
}
@end
