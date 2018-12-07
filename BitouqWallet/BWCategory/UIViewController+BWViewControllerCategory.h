//
//  UIViewController+BWViewControllerCategory.h
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/11/27.
//  Copyright © 2018 Joker. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (BWViewControllerCategory)
//弱提示
- (void)showWeakAlertWithString:(NSString *)weakAlert;
//等待提示
- (void)showHUDWithAlert:(NSString *)alertString;
//隱藏HUD
- (void)hiddenHUD;
//連接服務器失敗
- (void)showServerError;
//打印json
- (NSString *)getMyNeedJsonWithDict:(id)response;
- (void)showNetErrorMessageWithStatus:(NSInteger)status errorCode:(NSInteger)errorCode errorMessage:(NSString *)errorMessage;
@end

NS_ASSUME_NONNULL_END
