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
    [self.navigationController.navigationBar setHidden:YES];
    double y = 34;
    if (is_iPhoneX) {
        y += 44;
    }
    UIButton *menuButton = [[UIButton alloc] initWithFrame:(CGRectMake(20, y, 30, 30))];
    [menuButton setImage:[UIImage imageNamed:@"nav_menu"] forState:(UIControlStateNormal)];
    [menuButton addTarget:self action:@selector(menuAction) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:menuButton];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:(CGRectMake(0, y, 180, 30))];
    titleLabel.text = self.title;
    [titleLabel configWithTextColor:[UIColor blackColor] font:[UIFont systemFontOfSize:18.f] textAlignment:(NSTextAlignmentCenter) backgroundColor:nil];
    titleLabel.centerX = SCREEN_WIDTH / 2;
    [self.view addSubview:titleLabel];
}
- (void)menuAction{
    BWTabBarController *tabBarController = (BWTabBarController *)self.tabBarController;
    [tabBarController showMenu];
}
@end
