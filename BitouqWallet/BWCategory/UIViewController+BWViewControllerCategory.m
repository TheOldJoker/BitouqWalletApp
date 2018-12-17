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
    hud.label.numberOfLines = 0;
    [hud hideAnimated:YES afterDelay:1];
}
- (void)showHUDWithAlert:(NSString *)alertString {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.label.text = alertString;
}
- (void)showServerError{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = @"連接服務器失敗";
    [hud hideAnimated:YES afterDelay:1];
}
- (void)hiddenHUD{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}
- (void)showNetErrorMessageWithStatus:(NSInteger)status errorCode:(NSInteger)errorCode errorMessage:(NSString *)errorMessage{
    if (errorCode == 0) {
        return;
    }
    [self showWeakAlertWithString:errorMessage];
    if (errorCode == 1001) {
        NSLog(@"用戶資產不足");
        return;
    }
    if (errorCode == 5001) {
        NSLog(@"參數格式錯誤");
        return;
    }
    if (status == 0 || status == 500) {
        NSLog(@"服務器異常");
        return;
    }
    if (status == 404) {
        NSLog(@"地址錯誤");
        return;
    }
}
- (NSString *)getMyNeedJsonWithDict:(id)response
{
    if (response == nil) {
        return nil;
    }
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:response options:NSJSONWritingPrettyPrinted error:nil];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}
@end
