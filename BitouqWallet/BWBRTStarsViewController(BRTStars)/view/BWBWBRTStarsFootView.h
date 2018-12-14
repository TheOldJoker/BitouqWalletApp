//
//  BWBWBRTStarsFootView.h
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/13.
//  Copyright © 2018 Joker. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BWBWBRTStarsFootView : UIView
@property (strong, nonatomic) UITextField *betValueTextField;
@property (strong, nonatomic) UITextField *multipleTextField;
@property (strong, nonatomic) UILabel *userAssetLabel;
@property (nonatomic, strong) UIButton *sendButton;
@property (nonatomic, assign) NSInteger gameType;
- (void)initSubViews;
@end

NS_ASSUME_NONNULL_END
