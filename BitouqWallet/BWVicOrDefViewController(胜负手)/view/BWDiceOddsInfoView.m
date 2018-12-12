//
//  BWDiceOddsInfoView.m
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/12.
//  Copyright © 2018 Joker. All rights reserved.
//

#import "BWDiceOddsInfoView.h"
@interface BWDiceOddsInfoView()
@end
@implementation BWDiceOddsInfoView
- (void)initSubViews{
    NSArray *titles = @[@"賠率",@"贏取獎金",@"獲勝範圍"];
    float labelW = self.width / 3;
    float labelH = 18.f;
    for (int i = 0; i < titles.count; i++) {
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:(CGRectMake(labelW * i, self.height - labelH - 17, labelW, labelH))];
        [titleLabel configWithTextColor:[UIColor grayColor] font:[UIFont systemFontOfSize:13.f] textAlignment:(NSTextAlignmentCenter) backgroundColor:nil];
        titleLabel.text = titles[i];
        [self addSubview:titleLabel];
    }
    
    self.titleLabel1 = [[UILabel alloc] initWithFrame:(CGRectMake(0, 20, labelW, 24))];
    [self.titleLabel1 configWithTextColor:[UIColor blackColor] font:[UIFont systemFontOfSize:17.f] textAlignment:(NSTextAlignmentCenter) backgroundColor:nil];
    [self addSubview:self.titleLabel1];
    
    self.titleLabel2 = [[UILabel alloc] initWithFrame:(CGRectMake(labelW, 20, labelW, 24))];
    [self.titleLabel2 configWithTextColor:[UIColor blackColor] font:[UIFont systemFontOfSize:17.f] textAlignment:(NSTextAlignmentCenter) backgroundColor:nil];
    [self addSubview:self.titleLabel2];
    
    self.titleLabel3 = [[UILabel alloc] initWithFrame:(CGRectMake(labelW * 2, 20, labelW, 24))];
    [self.titleLabel3 configWithTextColor:[UIColor blackColor] font:[UIFont systemFontOfSize:17.f] textAlignment:(NSTextAlignmentCenter) backgroundColor:nil];
    [self addSubview:self.titleLabel3];
}
@end
