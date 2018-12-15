//
//  BWBRTStarsGameGambleView.h
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/14.
//  Copyright © 2018 Joker. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol BWBRTStarsGameGambleViewDelegate <NSObject>

- (void)gameGambleNumberChange;

@end
@interface BWBRTStarsGameGambleView : UIView
@property (nonatomic, weak) id<BWBRTStarsGameGambleViewDelegate> delegate;
@property (nonatomic, copy, readonly) NSString *resNumber;
- (void)initSubViews;
- (void)setNumbersSelected:(BOOL)selected;
@end

NS_ASSUME_NONNULL_END
