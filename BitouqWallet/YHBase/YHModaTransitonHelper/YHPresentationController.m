//
//  YHPresentationController.m
//  customTranstion
//
//  Created by 赵一欢 on 2017/4/5.
//  Copyright © 2017年 zhaoyihuan. All rights reserved.
//

#import "YHPresentationController.h"

@implementation YHPresentationController
//布局
- (void)containerViewWillLayoutSubviews
{
    /*
     1.self.containerView : 容器视图
     2.self.presentedView : 弹出视图
     */
//    self.presentedView.frame = CGRectMake(0, 0, 100, 100);
    
    UIButton * dismissButton = [[UIButton alloc] initWithFrame:[UIScreen mainScreen].bounds];
    if (self.showBlackBackgroud) {
        dismissButton.backgroundColor = [UIColor blackColor];
        dismissButton.alpha = 0.4;
    }
    if (self.canTapDismiss) {
        [dismissButton addTarget:self action:@selector(dismiss) forControlEvents:(UIControlEventTouchUpInside)];
    }
    [self.containerView insertSubview:dismissButton atIndex:0];
}
- (void)dismiss
{
    [self.presentedViewController.view endEditing:YES];
    //模态推出的视图控制器
    [self.presentedViewController dismissViewControllerAnimated:YES completion:nil];
}
@end
