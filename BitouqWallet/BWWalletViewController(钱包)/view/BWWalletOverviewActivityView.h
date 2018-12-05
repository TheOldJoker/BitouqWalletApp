//
//  BWWalletOverviewActivityView.h
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/5.
//  Copyright © 2018 Joker. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BWWalletOverviewActivityView : UIView
@property (nonatomic, strong) UIColor *mainColor;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *icon;
- (void)initSubView;
@end

NS_ASSUME_NONNULL_END
