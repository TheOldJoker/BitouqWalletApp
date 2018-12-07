//
//  BWCodeScanViewController.h
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/7.
//  Copyright © 2018 Joker. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol BWCodeScanViewControllerDelegate <NSObject>

- (void)scanCodeResString:(NSString *)codeString;

@end
@interface BWCodeScanViewController : UIViewController
@property (nonatomic, weak) id<BWCodeScanViewControllerDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
