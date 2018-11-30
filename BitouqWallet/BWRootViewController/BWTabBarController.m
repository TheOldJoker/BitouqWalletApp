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

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
