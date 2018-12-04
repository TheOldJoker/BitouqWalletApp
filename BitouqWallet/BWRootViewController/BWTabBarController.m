//
//  BWTabBarController.m
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/11/27.
//  Copyright © 2018 Joker. All rights reserved.
//

#import "BWTabBarController.h"
#import "BWMenuViewController.h"
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
}
- (void)JudgeLoginState {
    BWUser *user = [BWUserManager shareManager].user;
    //1.如果user存在,切privatekey存在則為登錄狀態
    if (user != nil && !stringIsEmpty(user.privatekey)) {
        return;
    }
    [self showLogin];
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
