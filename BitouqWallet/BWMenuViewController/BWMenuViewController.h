//
//  BWMenuViewController.h
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/11/28.
//  Copyright © 2018 Joker. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol BWMenuViewControllerDelegate <NSObject>
- (void)menuSelectedIndex:(NSInteger)selectedIndex;
@end
@interface BWMenuViewController : UIViewController
@property (nonatomic, assign) NSInteger selectedIndex;
@property (nonatomic, weak) id<BWMenuViewControllerDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
