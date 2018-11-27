//
//  YHModaAnimationManager.m
//  customTranstion
//
//  Created by 赵一欢 on 2017/4/5.
//  Copyright © 2017年 zhaoyihuan. All rights reserved.
//

#import "YHModaAnimationManager.h"
#import "YHPresentationController.h"
typedef NS_ENUM(NSUInteger, YHModaTransitionType) {
    YHModaTransitionTypePresent = 0,
    YHModaTransitionTypeDismiss
};
@interface YHModaAnimationManager()
@property (nonatomic , assign) YHModaTransitionType modaTransitionType;
@property (nonatomic , assign) YHModaAnimationType modaAnimationType;
@property (nonatomic , assign) BOOL showBlackBackgroud;
@property (nonatomic , assign) BOOL canTapDismiss;
@end
@implementation YHModaAnimationManager

- (instancetype)initWithModaAnimationType:(YHModaAnimationType)modaAnimationType showBlackBackgroud:(BOOL)showBlackBackgroud canTapDismiss:(BOOL)canTapDismiss
{
    self = [super init];
    if (self) {
        self.modaAnimationType = modaAnimationType;
        
        self.showBlackBackgroud = showBlackBackgroud;
        self.canTapDismiss = canTapDismiss;
    }
    return self;
}


//用于控制转场容器等操作
- (nullable UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source
{
    YHPresentationController * vc = [[YHPresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
    vc.showBlackBackgroud = self.showBlackBackgroud;
    vc.canTapDismiss = self.canTapDismiss;
    return vc;
}
//Present
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    self.modaTransitionType = YHModaTransitionTypePresent;
    return self;
}
//Dismiss
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    self.modaTransitionType = YHModaTransitionTypeDismiss;
    return self;
}

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5f;
}
//转场过程
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    self.modaTransitionType == YHModaTransitionTypePresent ? [self presentAnimation:transitionContext] : [self dismissAnimation:transitionContext];
}
#pragma mark 动画执行的地方
//dismissAnimation
- (void)dismissAnimation:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIView * toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIView * fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    
    [YHAnimationManager modaViewAnimationWithToView:fromView FromView:toView present:NO modaAnimationType:(self.modaAnimationType) completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}
//presentAnimation
- (void)presentAnimation:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIView * toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIView * fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    [[transitionContext containerView] addSubview:toView];

    //动画管理交给单独的类处理
    [YHAnimationManager modaViewAnimationWithToView:toView FromView:fromView present:YES modaAnimationType:(self.modaAnimationType) completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}
- (void)dealloc
{
    NSLog(@"YHModaAnimationManager--dealloc");
}
@end
