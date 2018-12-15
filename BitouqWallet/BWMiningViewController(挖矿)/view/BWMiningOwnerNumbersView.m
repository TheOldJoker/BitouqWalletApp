//
//  BWMiningOwnerNumbersView.m
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/10.
//  Copyright © 2018 Joker. All rights reserved.
//

#import "BWMiningOwnerNumbersView.h"
@interface BWMiningOwnerNumbersView()<BWNumberSelectedViewDelegate>

@end
@implementation BWMiningOwnerNumbersView
- (void)initSubViews{
    [self.greenView initSubViews];
    [self.blueView initSubViews];
    [self.redView initSubViews];
    [self.yellowView initSubViews];
    [self.grayView initSubViews];
}
- (BWNumberSelectedView *)grayView{
    if (!_grayView) {
        _grayView = [[BWNumberSelectedView alloc] initWithFrame:(CGRectMake(0, self.yellowView.bottom + 10, self.width, 25))];
        _grayView.mainColor = [UIColor colorWithHexString:@"d8d8d8"];
        _grayView.delegate = self;
        [self addSubview:_grayView];
    }
    return _grayView;
}
- (BWNumberSelectedView *)yellowView{
    if (!_yellowView) {
        _yellowView = [[BWNumberSelectedView alloc] initWithFrame:(CGRectMake(0, self.redView.bottom + 10, self.width, 25))];
        _yellowView.mainColor = [UIColor colorWithHexString:@"f6a93b"];
        _yellowView.delegate = self;
        [self addSubview:_yellowView];
    }
    return _yellowView;
}
- (BWNumberSelectedView *)redView{
    if (!_redView) {
        _redView = [[BWNumberSelectedView alloc] initWithFrame:(CGRectMake(0, self.blueView.bottom + 10, self.width, 25))];
        _redView.mainColor = [UIColor colorWithHexString:@"f42850"];
        _redView.delegate = self;
        [self addSubview:_redView];
    }
    return _redView;
}
- (BWNumberSelectedView *)blueView{
    if (!_blueView) {
        _blueView = [[BWNumberSelectedView alloc] initWithFrame:(CGRectMake(0, self.greenView.bottom + 10, self.width, 25))];
        _blueView.mainColor = [UIColor colorWithHexString:@"4a90e2"];
        _blueView.delegate = self;
        [self addSubview:_blueView];
    }
    return _blueView;
}
- (BWNumberSelectedView *)greenView{
    if (!_greenView) {
        _greenView = [[BWNumberSelectedView alloc] initWithFrame:(CGRectMake(0, 0, self.width, 25))];
        _greenView.mainColor = [UIColor colorWithHexString:@"7ed321"];
        _greenView.delegate = self;
        [self addSubview:_greenView];
    }
    return _greenView;
}

- (void)statusChange{
    if ([self.delegate respondsToSelector:@selector(numberStatusChange)]) {
        [self.delegate numberStatusChange];
    }
}
@end
