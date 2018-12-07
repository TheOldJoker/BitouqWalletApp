//
//  YHIntroduceView.h
//  镂空引导页
//
//  Created by 赵一欢 on 2017/2/17.
//  Copyright © 2017年 zhaoyihuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YHMaskView : UIView

//原理是：奇数部分遮盖 偶数部分镂空


- (void)showCirclePathWithCenter:(CGPoint)center andRadius:(float)radius;

/**
 镂空的部分的frame 镂空的圆角

 @param frame 镂空部分的frame
 @param radius 镂空部分的圆角
 */
- (void)showRectPathWithFrame:(CGRect)frame andRadius:(float)radius;
- (void)showCustomCostomCutoutWithNewBezierPath:(UIBezierPath *)newPath;
@end
