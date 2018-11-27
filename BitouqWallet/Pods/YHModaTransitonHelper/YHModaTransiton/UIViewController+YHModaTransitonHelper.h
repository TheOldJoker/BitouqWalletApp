//
//  UIViewController+YHModaTransitonHelper.h
//  Demo
//
//  Created by 赵一欢 on 2018/6/21.
//  Copyright © 2018年 Joker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YHModaAnimationManager.h"
@interface UIViewController (YHModaTransitonHelper)
- (void)customPresentVC:(UIViewController *)vc animation:(YHModaAnimationType)animation showBlackBackgroud:(BOOL)showBlackBackgroud canTapDismiss:(BOOL)canTapDismiss;
@end
