//
//  BWDiceOddsInfoView.h
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/12.
//  Copyright © 2018 Joker. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BWDiceOddsInfoView : UIView
@property (nonatomic,strong) UILabel *titleLabel1;
@property (nonatomic,strong) UILabel *titleLabel2;
@property (nonatomic,strong) UILabel *titleLabel3;
- (void)initSubViews;
@end

NS_ASSUME_NONNULL_END
