//
//  YHAnimationManager.m
//  customTranstion
//
//  Created by 赵一欢 on 2017/4/6.
//  Copyright © 2017年 zhaoyihuan. All rights reserved.
//

#import "YHAnimationManager.h"
#import "YHCAAimationModalTransition.h"
@implementation YHAnimationManager
+ (void)modaViewAnimationWithToView:(UIView *)toView FromView:(UIView *)fromView present:(BOOL)present modaAnimationType:(YHModaAnimationType)YHModaAnimationType completion:(void (^)(BOOL finished))completion
{
    switch (YHModaAnimationType) {
            //弹簧
        case YHModaAnimationTypeSpring:
            present == YES ? [self doSpringAnimationPresentWithView:toView completion:completion] : [self doSpringAnimationDismissWithView:toView completion:completion];
            break;
            //透明度
        case YHModaAnimationTypeAlpha:
            present == YES ? [self doAlphaAnimationPresentWithView:toView completion:completion] : [self doAlphaAnimationDismissWithView:toView completion:completion];
            break;
            //底部推出
        case YHModaAnimationTypePresent:
            present == YES ? [self doPresentAnimationPresentWithView:toView completion:completion] : [self doDismissAnimationDismissWithView:toView completion:completion];
            break;
            //伪push
        case YHModaAnimationTypePush:
            present == YES ? [self doPushAnimationPresentWithView:toView completion:completion] : [self doPopAnimationDismissWithView:toView completion:completion];
            break;
            //比例
        case YHModaAnimationTypeScale:
            [self doScaleAnimationPresentWithToView:toView FromView:fromView present:present completion:completion];
            break;
            //立方体
        case YHModaAnimationTypeCube:
            [self doCubeAnimationPresentWithToView:toView FromView:fromView present:present completion:completion];
            break;
            //无效果
        case YHModaAnimationTypeNone:
            present == YES ? [self doNoneAnimationPresentWithView:toView completion:completion] : [self doNoneAnimationDismissWithView:toView completion:completion];
            break;
        default:
            break;
    }
}
#pragma mark 弹簧动画
//Present
+ (void)doSpringAnimationPresentWithView:(UIView *)view completion:(void (^)(BOOL finished))completion
{
    view.transform = CGAffineTransformMakeScale(0, 0);
    view.alpha = 0.0f;
//    view.layer.anchorPoint = CGPointMake(0, 0);
//    view.layer.position = CGPointMake(0, 0);
    //dampingRatio（阻尼比）：0~1（1为平滑）
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0.5 options:(UIViewAnimationOptionTransitionNone) animations:^{
        view.transform = CGAffineTransformMakeScale(1, 1);
        view.alpha = 1.0f;
    } completion:^(BOOL finished) {
        if (completion) {
            completion(finished);
        }
    }];
}
//dismiss
+ (void)doSpringAnimationDismissWithView:(UIView *)view completion:(void (^)(BOOL finished))completion
{
    [UIView animateWithDuration:0.2 delay:0 usingSpringWithDamping:0.99 initialSpringVelocity:0.5 options:(UIViewAnimationOptionTransitionNone) animations:^{
        view.transform = CGAffineTransformMakeScale(0.00001, 0.00001);
        view.alpha = 0.0f;
    } completion:^(BOOL finished) {
        if (completion) {
            completion(finished);
        }
    }];
}
#pragma mark 透明度渐变
//Present
+ (void)doNoneAnimationPresentWithView:(UIView *)view completion:(void (^)(BOOL finished))completion
{
    [UIView animateWithDuration:0.5 animations:^{
    
    } completion:^(BOOL finished) {
        if (completion) {
            completion(finished);
        }
    }];
}
//dismiss
+ (void)doNoneAnimationDismissWithView:(UIView *)view completion:(void (^)(BOOL finished))completion
{
    [UIView animateWithDuration:0.5 animations:^{
        
    } completion:^(BOOL finished) {
        if (completion) {
            completion(finished);
        }
    }];
}
#pragma mark 透明度动画
//Present
+ (void)doAlphaAnimationPresentWithView:(UIView *)view completion:(void (^)(BOOL finished))completion
{
    view.alpha = 0.0f;
    [UIView animateWithDuration:0.2 animations:^{
        view.alpha = 1.0f;
    } completion:^(BOOL finished) {
        if (completion) {
            completion(finished);
        }
    }];
}
//dismiss
+ (void)doAlphaAnimationDismissWithView:(UIView *)view completion:(void (^)(BOOL finished))completion
{
    [UIView animateWithDuration:0.2 animations:^{
        view.alpha = 0.0f;
    } completion:^(BOOL finished) {
        if (completion) {
            completion(finished);
        }
    }];
}
#pragma mark 底部推出
+ (void)doPresentAnimationPresentWithView:(UIView *)view completion:(void (^)(BOOL finished))completion
{
    view.transform = CGAffineTransformMakeTranslation(0, view.bounds.size.height);
    [UIView animateWithDuration:0.2 delay:0 options:(UIViewAnimationOptionCurveEaseInOut) animations:^{
        view.transform = CGAffineTransformMakeTranslation(0, 0);
    } completion:^(BOOL finished) {
        if (completion) {
            completion(finished);
        }
    }];
}
+ (void)doDismissAnimationDismissWithView:(UIView *)view completion:(void (^)(BOOL finished))completion
{
    [UIView animateWithDuration:0.2 delay:0 options:(UIViewAnimationOptionCurveEaseIn) animations:^{
        view.transform = CGAffineTransformMakeTranslation(0, view.bounds.size.height);
    } completion:^(BOOL finished) {
        if (completion) {
            completion(finished);
        }
    }];
}
#pragma mark 位移动画
+ (void)doPushAnimationPresentWithView:(UIView *)view completion:(void (^)(BOOL finished))completion
{
    view.transform = CGAffineTransformMakeTranslation(view.bounds.size.width, 0);
    [UIView animateWithDuration:0.3 delay:0 options:(UIViewAnimationOptionCurveEaseInOut) animations:^{
        view.transform = CGAffineTransformMakeTranslation(0, 0);
    } completion:^(BOOL finished) {
        if (completion) {
            completion(finished);
        }
    }];
}
+ (void)doPopAnimationDismissWithView:(UIView *)view completion:(void (^)(BOOL finished))completion
{
    [UIView animateWithDuration:0.3 delay:0 options:(UIViewAnimationOptionCurveEaseIn) animations:^{
        view.transform = CGAffineTransformMakeTranslation(view.bounds.size.width, 0);
    } completion:^(BOOL finished) {
        if (completion) {
            completion(finished);
        }
    }];
}
#pragma mark 比例动画
+ (void)doScaleAnimationPresentWithToView:(UIView *)toView FromView:(UIView *)fromView present:(BOOL)present completion:(void (^)(BOOL finished))completion
{
    YHCAAimationModalTransition * anim = [[YHCAAimationModalTransition alloc] init];
    [anim doWithCAAnimationType:(YHModaCAAnimationTypeScale) ToView:toView FromView:fromView present:present completion:^(BOOL finished) {
        if (completion) {
            completion(finished);
        }
    }];
}
#pragma mark 立方体动画
+ (void)doCubeAnimationPresentWithToView:(UIView *)toView FromView:(UIView *)fromView present:(BOOL)present completion:(void (^)(BOOL finished))completion
{
    YHCAAimationModalTransition * anim = [[YHCAAimationModalTransition alloc] init];
    [anim doWithCAAnimationType:(YHModaCAAnimationTypeCube) ToView:toView FromView:fromView present:present completion:^(BOOL finished) {
        if (completion) {
            completion(finished);
        }
    }];
}
@end
