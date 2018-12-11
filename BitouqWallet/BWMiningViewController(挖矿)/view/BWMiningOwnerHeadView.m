//
//  BWMiningOwnerHeadView.m
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/10.
//  Copyright © 2018 Joker. All rights reserved.
//

#import "BWMiningOwnerHeadView.h"
@interface BWMiningOwnerHeadView()
@property (nonatomic, strong) UIImageView *backgroundImageView;
@property (nonatomic, strong) UILabel *ageTitleLabel;
@property (nonatomic, strong) UILabel *ageContentLabel;
@property (nonatomic, strong) UILabel *probabilityTitleLabel;
@property (nonatomic, strong) UILabel *probabilityContentLabel;
@property (nonatomic, strong) UILabel *productionTitleLabel;
@property (nonatomic, strong) UILabel *productionContentLabel;
@property (nonatomic, strong) UIImageView *showNumbersImageView;
@end
@implementation BWMiningOwnerHeadView
- (void)setValueWithAge:(NSString *)age probability:(NSString *)probability production:(NSString *)production{
    self.ageContentLabel.text = age;
    self.probabilityContentLabel.text = probability;
    self.productionContentLabel.text = production;
}
- (void)baseConfig{
    self.showNumbersImageView.hidden = NO;
}
- (UILabel *)productionContentLabel{
    if (!_productionContentLabel) {
        _productionContentLabel = [[UILabel alloc] initWithFrame:(CGRectMake(22, self.productionTitleLabel.bottom + 7, self.width - 44, 28))];
        [_productionContentLabel configWithTextColor:[UIColor colorWithHexString:@"f6a93b"] font:[UIFont systemFontOfSize:20.f] textAlignment:(NSTextAlignmentLeft) backgroundColor:nil];
        [self.backgroundImageView addSubview:_productionContentLabel];
    }
    return _productionContentLabel;
}
- (UILabel *)productionTitleLabel{
    if (!_productionTitleLabel) {
        _productionTitleLabel = [[UILabel alloc] initWithFrame:(CGRectMake(22, self.probabilityContentLabel.bottom + 9,self.width - 44 , 17))];
        _productionTitleLabel.text = @"生產力";
        [_productionTitleLabel configWithTextColor:[UIColor colorWithHexString:@"c0c0c0"] font:[UIFont systemFontOfSize:12.f] textAlignment:(NSTextAlignmentLeft) backgroundColor:nil];
        [self.backgroundImageView addSubview:_productionTitleLabel];
    }
    return _productionTitleLabel;
}
- (UILabel *)probabilityContentLabel{
    if (!_probabilityContentLabel) {
        _probabilityContentLabel = [[UILabel alloc] initWithFrame:(CGRectMake(22, self.probabilityTitleLabel.bottom + 2, self.width - 44, 17))];
        [_probabilityContentLabel configWithTextColor:[UIColor blackColor] font:[UIFont systemFontOfSize:12.f] textAlignment:(NSTextAlignmentLeft) backgroundColor:nil];
        [self.backgroundImageView addSubview:_probabilityContentLabel];
    }
    return _probabilityContentLabel;
}
- (UILabel *)probabilityTitleLabel{
    if (!_probabilityTitleLabel) {
        _probabilityTitleLabel = [[UILabel alloc] initWithFrame:(CGRectMake(22, self.ageContentLabel.bottom + 11, self.width - 44, 17))];
        _probabilityTitleLabel.text = @"概率指數";
        [_probabilityTitleLabel configWithTextColor:[UIColor colorWithHexString:@"c0c0c0"] font:[UIFont systemFontOfSize:12.f] textAlignment:(NSTextAlignmentLeft) backgroundColor:nil];
        [self.backgroundImageView addSubview:_probabilityTitleLabel];
    }
    return _probabilityTitleLabel;
}
- (UILabel *)ageContentLabel{
    if (!_ageContentLabel) {
        _ageContentLabel = [[UILabel alloc] initWithFrame:(CGRectMake(22, self.ageTitleLabel.bottom + 3, self.width - 44, 17))];
        [_ageContentLabel configWithTextColor:[UIColor blackColor] font:[UIFont systemFontOfSize:12.f] textAlignment:(NSTextAlignmentLeft) backgroundColor:nil];
        [self.backgroundImageView addSubview:_ageContentLabel];
    }
    return _ageContentLabel;
}
- (UILabel *)ageTitleLabel{
    if (!_ageTitleLabel) {
        _ageTitleLabel = [[UILabel alloc] initWithFrame:(CGRectMake(22, 17, self.width - 44, 17))];
        _ageTitleLabel.text = @"節點幣齡（獲得支持）";
        [_ageTitleLabel configWithTextColor:[UIColor colorWithHexString:@"c0c0c0"] font:[UIFont systemFontOfSize:12.f] textAlignment:(NSTextAlignmentLeft) backgroundColor:nil];
        [self.backgroundImageView addSubview:_ageTitleLabel];
    }
    return _ageTitleLabel;
}
- (UIImageView *)showNumbersImageView{
    if (!_showNumbersImageView) {
        _showNumbersImageView = [[UIImageView alloc] initWithFrame:(CGRectMake(self.width - 124 - 22, self.height - 72 - 25, 124, 72))];
        _showNumbersImageView.image = [UIImage imageNamed:@"mining_owner_numbersImage"];
        [self.backgroundImageView addSubview:_showNumbersImageView];
    }
    return _showNumbersImageView;
}
- (UIImageView *)backgroundImageView{
    if (!_backgroundImageView) {
        _backgroundImageView = [[UIImageView alloc] initWithFrame:(CGRectMake(0, 0, self.width, self.height))];
        _backgroundImageView.image = [UIImage imageNamed:@"mining_owner_background"];
        [self addSubview:_backgroundImageView];
    }
    return _backgroundImageView;
}
@end
