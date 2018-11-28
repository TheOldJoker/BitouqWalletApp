//
//  UIViewController+BWViewControllerCategory.m
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/11/27.
//  Copyright © 2018 Joker. All rights reserved.
//

#import "UIViewController+BWViewControllerCategory.h"
#import "BWTabBarController.h"
@implementation UIViewController (BWViewControllerCategory)
- (void)initMenuNav {
    UIButton * menuButton = [[UIButton alloc] initWithFrame:(CGRectMake(0, 0, 30, 30))];
    [menuButton setImage:[UIImage imageNamed:@"nav_menu"] forState:(UIControlStateNormal)];
    [menuButton sizeToFit];
    [menuButton addTarget:self action:@selector(menuAction) forControlEvents:(UIControlEventTouchUpInside)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:menuButton];
}
- (void)menuAction{
    BWTabBarController *tabBarController = (BWTabBarController *)self.tabBarController;
    [tabBarController showMenu];
}
@end
