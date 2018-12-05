//
//  UIViewController+BWViewControllerCategory.m
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/11/27.
//  Copyright © 2018 Joker. All rights reserved.
//

#import "UIViewController+BWViewControllerCategory.h"

#import "MBProgressHUD.h"
@implementation UIViewController (BWViewControllerCategory)
- (void)showWeakAlertWithString:(NSString *)weakAlert{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = weakAlert;
    [hud hideAnimated:YES afterDelay:1];
}
- (void)showHUDWithAlert:(NSString *)alertString {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.label.text = alertString;
}
- (void)hiddenHUD{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

@end
