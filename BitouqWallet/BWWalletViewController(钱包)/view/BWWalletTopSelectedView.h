//
//  BWWalletTopSelectedView.h
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/4.
//  Copyright © 2018 Joker. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol BWWalletTopSelectedViewDelegate <NSObject>

- (void)topSelectedViewSelectedIndex:(NSInteger)index;

@end
@interface BWWalletTopSelectedView : UIView
@property (nonatomic, assign) NSInteger selectedIndex;
@property (nonatomic, weak) id<BWWalletTopSelectedViewDelegate> delegate;
- (void)initConfig;
@end

NS_ASSUME_NONNULL_END
