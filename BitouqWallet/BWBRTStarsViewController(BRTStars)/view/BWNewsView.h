//
//  BWNewsView.h
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/13.
//  Copyright © 2018 Joker. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BWNewsView : UIView
@property (nonatomic, strong) NSArray *showContent;
- (void)initSubViews;
@end

NS_ASSUME_NONNULL_END
