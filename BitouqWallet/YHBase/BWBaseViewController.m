//
//  BWBaseViewController.m
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/4.
//  Copyright © 2018 Joker. All rights reserved.
//

#import "BWBaseViewController.h"
#import "BWTabBarController.h"
@interface BWBaseViewController ()

@end

@implementation BWBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
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
    
    self.customNavTitleLabel = [[UILabel alloc] initWithFrame:(CGRectMake(0, y, 180, 30))];
    self.customNavTitleLabel.text = self.title;
    [self.customNavTitleLabel configWithTextColor:[UIColor blackColor] font:[UIFont systemFontOfSize:18.f] textAlignment:(NSTextAlignmentCenter) backgroundColor:nil];
    self.customNavTitleLabel.centerX = SCREEN_WIDTH / 2;
    [self.view addSubview:self.customNavTitleLabel];
}
- (void)menuAction{
    BWTabBarController *tabBarController = (BWTabBarController *)self.tabBarController;
    [tabBarController showMenu];
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
