//
//  BWBaseViewController.h
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/4.
//  Copyright © 2018 Joker. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BWBaseViewController : UIViewController
@property (nonatomic, strong) UILabel *customNavTitleLabel;
- (void)initMenuNav;
@end

NS_ASSUME_NONNULL_END
