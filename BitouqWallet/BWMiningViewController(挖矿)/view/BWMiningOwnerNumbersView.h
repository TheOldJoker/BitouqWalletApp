//
//  BWMiningOwnerNumbersView.h
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/10.
//  Copyright © 2018 Joker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BWNumberSelectedView.h"
NS_ASSUME_NONNULL_BEGIN
@protocol BWMiningOwnerNumbersViewDelegate <NSObject>
@optional
- (void)numberStatusChange;

@end
@interface BWMiningOwnerNumbersView : UIView
@property (nonatomic, weak) id<BWMiningOwnerNumbersViewDelegate> delegate;
@property (nonatomic, strong) BWNumberSelectedView *greenView;
@property (nonatomic, strong) BWNumberSelectedView *blueView;
@property (nonatomic, strong) BWNumberSelectedView *redView;
@property (nonatomic, strong) BWNumberSelectedView *yellowView;
@property (nonatomic, strong) BWNumberSelectedView *grayView;
- (void)initSubViews;
@end

NS_ASSUME_NONNULL_END
