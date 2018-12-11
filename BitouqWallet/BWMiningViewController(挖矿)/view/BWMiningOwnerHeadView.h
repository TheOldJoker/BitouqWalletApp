//
//  BWMiningOwnerHeadView.h
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/10.
//  Copyright © 2018 Joker. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BWMiningOwnerHeadView : UIView
- (void)baseConfig;
- (void)setValueWithAge:(NSString *)age probability:(NSString *)probability production:(NSString *)production;
@end

NS_ASSUME_NONNULL_END
