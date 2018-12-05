//
//  BWWalletPublickeyInfoView.h
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/4.
//  Copyright © 2018 Joker. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BWWalletPublickeyInfoView : UIView
@property (nonatomic, strong) UIButton *reloadButton;//刷新按鈕
@property (nonatomic, copy) NSString *publickey;//公鑰
@property (nonatomic, copy) NSString *money;//餘額
- (void)initSubview;
@end

NS_ASSUME_NONNULL_END
