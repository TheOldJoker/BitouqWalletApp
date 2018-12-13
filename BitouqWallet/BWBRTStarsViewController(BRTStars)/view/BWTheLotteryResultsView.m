//
//  BWTheLotteryResultsView.m
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/13.
//  Copyright © 2018 Joker. All rights reserved.
//

#import "BWTheLotteryResultsView.h"
@interface BWTheLotteryResultsView()
@property (nonatomic, strong) UILabel *num1;
@property (nonatomic, strong) UILabel *num2;
@property (nonatomic, strong) UILabel *num3;
@property (nonatomic, strong) UILabel *num4;
@property (nonatomic, strong) UILabel *num5;
@end
@implementation BWTheLotteryResultsView
- (void)setShowNumber:(NSString *)showNumber{
    if (_showNumber != showNumber) {
        _showNumber = showNumber;
        [self setNumbers];
    }
}
- (void)setNumbers{
    NSArray *numbers = [self.showNumber componentsSeparatedByCharset];
    self.num1.text = numbers[0];
    self.num2.text = numbers[1];
    self.num3.text = numbers[2];
    self.num4.text = numbers[3];
    self.num5.text = numbers[4];
}
- (UILabel *)num1{
    if (!_num1) {
        _num1 = [[UILabel alloc] initWithFrame:(CGRectMake(0, 0, 50, 50))];
        _num1.layer.cornerRadius = 25;
        _num1.clipsToBounds = YES;
        [_num1 configWithTextColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:20] textAlignment:(NSTextAlignmentCenter) backgroundColor:[UIColor colorWithHexString:@"7ed321"]];
        [self addSubview:_num1];
    }
    return _num1;
}
- (UILabel *)num2{
    if (!_num2) {
        _num2 = [[UILabel alloc] initWithFrame:(CGRectMake(58, 0, 50, 50))];
        _num2.layer.cornerRadius = 25;
        _num2.clipsToBounds = YES;
        [_num2 configWithTextColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:20] textAlignment:(NSTextAlignmentCenter) backgroundColor:[UIColor colorWithHexString:@"4a90e2"]];
        [self addSubview:_num2];
    }
    return _num2;
}
- (UILabel *)num3{
    if (!_num3) {
        _num3 = [[UILabel alloc] initWithFrame:(CGRectMake(58 * 2, 0, 50, 50))];
        _num3.layer.cornerRadius = 25;
        _num3.clipsToBounds = YES;
        [_num3 configWithTextColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:20] textAlignment:(NSTextAlignmentCenter) backgroundColor:[UIColor colorWithHexString:@"f42850"]];
        [self addSubview:_num3];
    }
    return _num3;
}
- (UILabel *)num4{
    if (!_num4) {
        _num4 = [[UILabel alloc] initWithFrame:(CGRectMake(58 * 3, 0, 50, 50))];
        _num4.layer.cornerRadius = 25;
        _num4.clipsToBounds = YES;
        [_num4 configWithTextColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:20] textAlignment:(NSTextAlignmentCenter) backgroundColor:[UIColor colorWithHexString:@"f6a93b"]];
        [self addSubview:_num4];
    }
    return _num4;
}
- (UILabel *)num5{
    if (!_num5) {
        _num5 = [[UILabel alloc] initWithFrame:(CGRectMake(58 * 4, 0, 50, 50))];
        _num5.layer.cornerRadius = 25;
        _num5.clipsToBounds = YES;
        [_num5 configWithTextColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:20] textAlignment:(NSTextAlignmentCenter) backgroundColor:[UIColor colorWithHexString:@"d8d8d8"]];
        [self addSubview:_num5];
    }
    return _num5;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
