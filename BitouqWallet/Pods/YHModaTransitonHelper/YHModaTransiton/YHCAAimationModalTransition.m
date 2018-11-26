//
//  YHSystemModalTransition.m
//  customTranstion
//
//  Created by 赵一欢 on 2017/4/11.
//  Copyright © 2017年 zhaoyihuan. All rights reserved.
//

#import "YHCAAimationModalTransition.h"
@interface YHCAAimationModalTransition()<CAAnimationDelegate>
@property (nonatomic , strong) void (^animationCompletion)(BOOL finished);
@end
@implementation YHCAAimationModalTransition
- (void)doWithCAAnimationType:(YHModaCAAnimationType)modaCAAnimationType ToView:(UIView *)toView FromView:(UIView *)fromView present:(BOOL)present completion:(void (^)(BOOL finished))completion
{
    switch (modaCAAnimationType) {
        case YHModaCAAnimationTypeScale:
            present == YES ? [self doScaleAnimationPresentWithToView:toView FromView:fromView completion:completion] : [self doScaleAnimationDismissWithToView:toView FromView:fromView completion:completion];
            break;
        case YHModaCAAnimationTypeCube:
            present == YES ? [self doCubeAnimationPresentWithToView:toView FromView:fromView completion:completion] : [self doScaleAnimationDismissWithToView:toView FromView:fromView completion:completion];
            break;
        default:
            break;
    }
}
#pragma mark 比例动画
- (void)doScaleAnimationPresentWithToView:(UIView *)toView FromView:(UIView *)fromView completion:(void (^)(BOOL finished))completion
{
    CABasicAnimation * anim = [CABasicAnimation animation];
    anim.keyPath = @"transform.scale";
    anim.fromValue = @0;
    anim.toValue = @1;
    anim.duration = 0.1;
    anim.delegate = self;
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    [toView.layer addAnimation:anim forKey:nil];
    self.animationCompletion = completion;
}
- (void)doScaleAnimationDismissWithToView:(UIView *)toView FromView:(UIView *)fromView completion:(void (^)(BOOL finished))completion
{
    CABasicAnimation * anim = [CABasicAnimation animation];
    anim.keyPath = @"transform.scale";
    anim.toValue = @0;
    anim.duration = 0.1;
    anim.delegate = self;
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    [toView.layer addAnimation:anim forKey:nil];
    self.animationCompletion = completion;
}
#pragma mark 立方体动画
- (void)doCubeAnimationPresentWithToView:(UIView *)toView FromView:(UIView *)fromView completion:(void (^)(BOOL finished))completion
{
    
//    CATransition * anim = [CATransition animation];
//    anim.type = @"cube";
//    anim.duration = 3;
//    anim.delegate = self;
//    anim.removedOnCompletion = NO;
//    anim.fillMode = kCAFillModeForwards;
//    [toView.layer addAnimation:anim forKey:nil];
//    
//    self.animationCompletion = completion;
}
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    
    if (self.animationCompletion) {
        self.animationCompletion(flag);
    }
}
@end
