//
//  BWForgetPasswordViewController.h
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/13.
//  Copyright © 2018 Joker. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol BWForgetPasswordViewControllerDelegate <NSObject>

- (void)resetpassword;

@end
@interface BWForgetPasswordViewController : UIViewController
@property (nonatomic, weak) id<BWForgetPasswordViewControllerDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
