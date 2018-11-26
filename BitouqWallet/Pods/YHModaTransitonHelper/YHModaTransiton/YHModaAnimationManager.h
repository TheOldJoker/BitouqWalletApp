//
//  YHModaAnimationManager.h
//  customTranstion
//
//  Created by 赵一欢 on 2017/4/5.
//  Copyright © 2017年 zhaoyihuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YHAnimationManager.h"
@interface YHModaAnimationManager : NSObject<UIViewControllerTransitioningDelegate , UIViewControllerAnimatedTransitioning>
- (instancetype)initWithModaAnimationType:(YHModaAnimationType)modaAnimationType showBlackBackgroud:(BOOL)showBlackBackgroud canTapDismiss:(BOOL)canTapDismiss;
@end
