//
//  YHSystemModalTransition.h
//  customTranstion
//
//  Created by 赵一欢 on 2017/4/11.
//  Copyright © 2017年 zhaoyihuan. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger, YHModaCAAnimationType) {
    YHModaCAAnimationTypeScale = 0,
    YHModaCAAnimationTypeCube,
    YHModaCAAnimationTypeNone
};
@interface YHCAAimationModalTransition : NSObject
- (void)doWithCAAnimationType:(YHModaCAAnimationType)modaCAAnimationType ToView:(UIView *)toView FromView:(UIView *)fromView present:(BOOL)present completion:(void (^)(BOOL finished))completion;
@end
