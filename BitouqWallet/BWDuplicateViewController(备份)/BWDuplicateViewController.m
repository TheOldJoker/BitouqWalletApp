//
//  BWDuplicateViewController.m
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/11/27.
//  Copyright © 2018 Joker. All rights reserved.
//

#import "BWDuplicateViewController.h"
#import "BWGesturesPasswordViewcontroller.h"
#import "BWForgetPasswordViewController.h"
#import "BWTabBarController.h"
@interface BWDuplicateViewController ()<BWGesturesPasswordViewcontrollerDelegate,BWForgetPasswordViewControllerDelegate>
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *titleLabelTopValue;

@end

@implementation BWDuplicateViewController
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"";
    double y = 34;
    if (is_iPhoneX) {
        y += 44;
    }
    UIButton *menuButton = [[UIButton alloc] initWithFrame:(CGRectMake(20, y, 30, 30))];
    [menuButton setImage:[UIImage imageNamed:@"nac_back_gray"] forState:(UIControlStateNormal)];
    [menuButton addTarget:self action:@selector(menuAction) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:menuButton];
    self.titleLabelTopValue.constant = menuButton.bottom + 20;
}
- (void)menuAction{
    BWTabBarController *tabBarController = (BWTabBarController *)self.tabBarController;
    [tabBarController showMenu];
}
- (void)viewDidLayoutSubviews{
    self.view.width = SCREEN_WIDTH;
    self.view.height = SCREEN_HEIGHT;
    
}
- (IBAction)duplicateAction:(UIButton *)sender {
    BWGesturesPasswordViewcontroller *gestureVC = [[BWGesturesPasswordViewcontroller alloc] init];
    gestureVC.gesturesPasswordType = BWGesturesPasswordTypeVerify;
    gestureVC.delegate = self;
    [self customPresentVC:gestureVC animation:(YHModaAnimationTypeAlpha) showBlackBackgroud:NO canTapDismiss:NO];
}
#pragma mark - BWGesturesPasswordViewcontrollerDelegate
- (void)verifyPasswordSuccess{
    BWUser *user = [BWUserManager shareManager].user;
    if (stringIsEmpty(user.privatekey)) {
        [self showWeakAlertWithString:@"未獲取私钥"];
        return;
    }
    UIPasteboard *pab = [UIPasteboard generalPasteboard];
    [pab setString:user.privatekey];
    if (pab == nil) {
        [self showWeakAlertWithString:@"複製失敗"];
    }else
    {
        [self showWeakAlertWithString:@"已複製"];
    }
}
//忘记密码
- (void)forgetThePassword{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        BWForgetPasswordViewController *vc = [[BWForgetPasswordViewController alloc] init];
        vc.delegate = self;
        [self customPresentVC:vc animation:(YHModaAnimationTypeAlpha) showBlackBackgroud:NO canTapDismiss:NO];
    });
}
#pragma mark -BWForgetPasswordViewControllerDelegate
- (void)resetpassword{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        BWGesturesPasswordViewcontroller *vc = [[BWGesturesPasswordViewcontroller alloc] init];
        vc.gesturesPasswordType = BWGesturesPasswordTypeCreate;
        [self customPresentVC:vc animation:(YHModaAnimationTypeAlpha) showBlackBackgroud:NO canTapDismiss:NO];
    });
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
