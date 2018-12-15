//
//  BWNumberSelectedView.h
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/10.
//  Copyright © 2018 Joker. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol BWNumberSelectedViewDelegate <NSObject>
@optional
- (void)statusChange;

@end
@interface BWNumberSelectedView : UIView
@property (nonatomic, weak) id<BWNumberSelectedViewDelegate> delegate;
@property (nonatomic, strong) UIColor *mainColor;
@property (nonatomic, copy, readonly) NSString *resNumber;
- (void)initSubViews;
- (void)setNumbersSelected:(BOOL)selected;
- (void)setTargetNumberSelectedWithString:(NSString *)numberString;
@end

NS_ASSUME_NONNULL_END
