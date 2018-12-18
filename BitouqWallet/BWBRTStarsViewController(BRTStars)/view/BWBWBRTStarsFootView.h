//
//  BWBWBRTStarsFootView.h
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/13.
//  Copyright © 2018 Joker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BWGameArithmeticModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface BWBWBRTStarsFootView : UIView
@property (strong, nonatomic) UITextField *betValueTextField;
@property (strong, nonatomic) UITextField *multipleTextField;
@property (strong, nonatomic) UILabel *userAssetLabel;
@property (nonatomic, strong) UIButton *sendButton;
@property (nonatomic, assign) NSInteger gameType;
@property (nonatomic, strong) NSDictionary *gameOdds;//游戏赔率
@property (nonatomic, strong) BWGameArithmeticModel *gameArithmetic;
@property (nonatomic, strong) UIButton *winNButton;//期望中奖注数
- (void)initSubViews;
- (void)setStakesValue:(NSString *)stakes total:(NSString *)total bonus:(NSString *)bonus;
@end

NS_ASSUME_NONNULL_END
