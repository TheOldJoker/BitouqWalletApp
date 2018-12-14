//
//  BWGamePickerViewController.h
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/14.
//  Copyright © 2018 Joker. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol BWGamePickerViewControllerDelegate <NSObject>
- (void)changeGameType:(NSInteger)type;
@end
@interface BWGamePickerViewController : UIViewController
@property (nonatomic, weak) id<BWGamePickerViewControllerDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
