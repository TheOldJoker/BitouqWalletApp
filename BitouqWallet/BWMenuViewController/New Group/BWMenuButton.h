//
//  BWMenuButton.h
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/11/28.
//  Copyright © 2018 Joker. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BWMenuButton : UIButton
@property (nonatomic, copy) NSString *customTitle;
@property (nonatomic, assign) BOOL isSelected;
@end

NS_ASSUME_NONNULL_END
