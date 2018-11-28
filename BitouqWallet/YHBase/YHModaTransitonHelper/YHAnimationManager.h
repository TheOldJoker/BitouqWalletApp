//
//  YHAnimationManager.h
//  customTranstion
//
//  Created by 赵一欢 on 2017/4/6.
//  Copyright © 2017年 zhaoyihuan. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger, YHModaAnimationType) {
    YHModaAnimationTypeSpring = 0,
    YHModaAnimationTypeAlpha,
    YHModaAnimationTypeDrawer,
    YHModaAnimationTypePush,
    YHModaAnimationTypePresent,
    YHModaAnimationTypeScale,
    YHModaAnimationTypeCube,
    YHModaAnimationTypeNone
};
@interface YHAnimationManager : NSObject
+ (void)modaViewAnimationWithToView:(UIView *)view FromView:(UIView *)fromView present:(BOOL)present modaAnimationType:(YHModaAnimationType)YHModaAnimationType completion:(void (^)(BOOL finished))completion;
@end
