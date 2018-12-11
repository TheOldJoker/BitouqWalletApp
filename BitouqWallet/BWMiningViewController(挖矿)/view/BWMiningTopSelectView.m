//
//  BWMiningTopSelectView.m
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/10.
//  Copyright © 2018 Joker. All rights reserved.
//

#import "BWMiningTopSelectView.h"
@interface BWMiningTopSelectView()
@property (nonatomic, strong) UIButton *voteButton;
@property (nonatomic, strong) UIButton *productionButton;
@property (nonatomic, strong) UIView *sliderView;
@property (nonatomic, strong) NSArray *buttons;
@end
@implementation BWMiningTopSelectView
- (void)initConfig{
    self.buttons = @[self.voteButton,self.productionButton];
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
- (UIButton *)voteButton{
    if (!_voteButton) {
        _voteButton = [[UIButton alloc] initWithFrame:(CGRectMake(30, 15, 36, 21))];
        [_voteButton setTitle:@"投票" forState:(UIControlStateNormal)];
        [_voteButton setTitleColor:[UIColor grayColor] forState:(UIControlStateNormal)];
        [_voteButton setTitleColor:[UIColor blackColor] forState:(UIControlStateSelected)];
        _voteButton.titleLabel.font = [UIFont systemFontOfSize:15.f];
        _voteButton.tag = 2000;
        [_voteButton addTarget:self action:@selector(buttonAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [self addSubview:_voteButton];
    }
    return _voteButton;
}
- (UIButton *)productionButton{
    if (!_productionButton) {
        _productionButton = [[UIButton alloc] initWithFrame:(CGRectMake(110, 15, 36, 21))];
        [_productionButton setTitle:@"生產" forState:(UIControlStateNormal)];
        [_productionButton setTitleColor:[UIColor grayColor] forState:(UIControlStateNormal)];
        [_productionButton setTitleColor:[UIColor blackColor] forState:(UIControlStateSelected)];
        _productionButton.titleLabel.font = [UIFont systemFontOfSize:15.f];
        _productionButton.tag = 2001;
        [_productionButton addTarget:self action:@selector(buttonAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [self addSubview:_productionButton];
    }
    return _productionButton;
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
