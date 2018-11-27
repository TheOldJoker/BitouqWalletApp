//
//  UIViewController+YHModaTransitonHelper.m
//  Demo
//
//  Created by 赵一欢 on 2018/6/21.
//  Copyright © 2018年 Joker. All rights reserved.
//

#import "UIViewController+YHModaTransitonHelper.h"
#if TARGET_IPHONE_SIMULATOR
#import <objc/runtime.h>
#else
#import <objc/runtime.h>
#import <objc/message.h>
#endif
@interface UIViewController (YHAssociated)
    @property (nonatomic, strong) YHModaAnimationManager * modaAnimationManager;
    @end
@implementation UIViewController (YHAssociated)
- (void)setModaAnimationManager:(YHModaAnimationManager *)modaManager
{
    objc_setAssociatedObject(self, @selector(modaAnimationManager), modaManager, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (YHModaAnimationManager *)modaAnimationManager
{
    return objc_getAssociatedObject(self, @selector(modaAnimationManager));
}
@end
@implementation UIViewController (YHModaTransitonHelper)
- (void)customPresentVC:(UIViewController *)vc animation:(YHModaAnimationType)animation showBlackBackgroud:(BOOL)showBlackBackgroud canTapDismiss:(BOOL)canTapDismiss
    {
        self.modaAnimationManager = [[YHModaAnimationManager alloc] initWithModaAnimationType:animation showBlackBackgroud:showBlackBackgroud canTapDismiss:canTapDismiss];
        vc.transitioningDelegate = self.modaAnimationManager;
        vc.modalPresentationStyle = UIModalPresentationCustom;
        [self presentViewController:vc animated:YES completion:nil];
    }
@end
