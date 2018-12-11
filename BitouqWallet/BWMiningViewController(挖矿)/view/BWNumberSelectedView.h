//
//  BWNumberSelectedView.h
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/10.
//  Copyright © 2018 Joker. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BWNumberSelectedView : UIView
@property (nonatomic, strong) UIColor *mainColor;
@property (nonatomic, copy, readonly) NSString *resNumber;
- (void)initSubViews;
- (void)setNumbersSelected:(BOOL)selected;
- (void)setTargetNumberSelectedWithString:(NSString *)numberString;
@end

NS_ASSUME_NONNULL_END
