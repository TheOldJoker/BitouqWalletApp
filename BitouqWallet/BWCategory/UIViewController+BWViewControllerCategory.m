//
//  UIViewController+BWViewControllerCategory.m
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/11/27.
//  Copyright © 2018 Joker. All rights reserved.
//

#import "UIViewController+BWViewControllerCategory.h"

@implementation UIViewController (BWViewControllerCategory)
- (void)initNav {
    double y = isIphoneX ? 88 - 30 : 64 - 30;
    UIView *more = [[UIView alloc] initWithFrame:(CGRectMake(15, y, 30, 30))];
    more.backgroundColor = [UIColor redColor];
    [self.view addSubview:more];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:(CGRectMake(0, y, 100, 30))];
    titleLabel.centerX = SCREEN_WIDTH / 2;
    titleLabel.text = self.title;
    [titleLabel configWithTextColor:[UIColor blackColor] font:[UIFont systemFontOfSize:17.f] textAlignment:(NSTextAlignmentCenter) backgroundColor:nil];
    [self.view addSubview:titleLabel];
}
@end
