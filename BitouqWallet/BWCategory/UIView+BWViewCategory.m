//
//  UIView+BWViewCategory.m
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/5.
//  Copyright © 2018 Joker. All rights reserved.
//

#import "UIView+BWViewCategory.h"

@implementation UIView (BWViewCategory)
- (void)setCornerWithCornerSize:(CornerSize)cornerSize{
    
    CGFloat leftTop = 0,rightTop = 0,rightBottom = 0,leftTBottom = 0,
    width = self.frame.size.width, height = self.frame.size.height;
    
    leftTop = cornerSize.leftTop;
    rightTop = cornerSize.rightTop;
    rightBottom = cornerSize.rightBottom;
    leftTBottom = cornerSize.leftBottom;
    
    /*
     CGFloat minWidthAndHeight = MIN(width, height)/2.f;
     
     leftTop     = MIN(leftTop, minWidthAndHeight);
     rightTop    = MIN(rightTop, minWidthAndHeight);
     rightBottom = MIN(rightBottom, minWidthAndHeight);
     leftTBottom = MIN(leftTBottom, minWidthAndHeight);
     */
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    
    UIBezierPath *maskLayerPath = [UIBezierPath bezierPath];
    
    [maskLayerPath addArcWithCenter:CGPointMake(leftTop, leftTop) radius:leftTop startAngle:M_PI endAngle:M_PI*1.5 clockwise:YES];
    
    [maskLayerPath addArcWithCenter:CGPointMake(width - rightTop, rightTop) radius:rightTop startAngle:1.5*M_PI endAngle:M_PI*2 clockwise:YES];
    
    [maskLayerPath addArcWithCenter:CGPointMake(width - rightBottom, height - rightBottom) radius:rightBottom startAngle:0 endAngle:M_PI*0.5 clockwise:YES];
    
    [maskLayerPath addArcWithCenter:CGPointMake(leftTBottom,height - leftTBottom) radius:leftTBottom startAngle:M_PI*0.5 endAngle:M_PI clockwise:YES];
    
    maskLayer.path = maskLayerPath.CGPath;
    
    self.layer.mask = maskLayer;
}
@end
