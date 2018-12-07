//
//  BWTabBarController.m
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/11/27.
//  Copyright © 2018 Joker. All rights reserved.
//

#import "BWTabBarController.h"
#import "BWMenuViewController.h"
#import "BWWalletViewController.h"
@interface BWTabBarController ()<BWMenuViewControllerDelegate>

@end

@implementation BWTabBarController
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    //1.判斷登錄狀態
    [self JudgeLoginState];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //登陆成功之后将所有页面数据刷新
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshAllController) name:LOGIN_SUCCESS_NOTE object:nil];
}
- (void)JudgeLoginState {
    BWUser *user = [BWUserManager shareManager].user;
    //1.如果user存在,切privatekey存在則為登錄狀態
    if (user != nil && !stringIsEmpty(user.privatekey)) {
        [self refreshAllController];
        return;
    }
    [self showLogin];
}
- (void)refreshAllController{
    UINavigationController *walletNav = self.viewControllers[0];
    BWWalletViewController *walletViewController = walletNav.viewControllers.firstObject;
    [walletViewController loadData];
}
- (void)showMenu {
    BWMenuViewController *menuVC = [[BWMenuViewController alloc] init];
    menuVC.selectedIndex = self.selectedIndex;
    menuVC.delegate = self;
    [self customPresentVC:menuVC animation:(YHModaAnimationTypeDrawer) showBlackBackgroud:NO canTapDismiss:NO];
}
- (void)menuSelectedIndex:(NSInteger)selectedIndex
{
    self.selectedIndex = selectedIndex;
}
- (void)showLogin{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Login" bundle:nil];
    UINavigationController * vc = [storyBoard instantiateViewControllerWithIdentifier:@"begin"];
    vc.hidesBottomBarWhenPushed = YES;
    [self presentViewController:vc animated:YES completion:nil];
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
