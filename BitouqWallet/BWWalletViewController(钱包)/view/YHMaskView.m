//
//  YHIntroduceView.m
//  镂空引导页
//
//  Created by 赵一欢 on 2017/2/17.
//  Copyright © 2017年 zhaoyihuan. All rights reserved.
//

#import "YHMaskView.h"
@interface YHMaskView()
@property (nonatomic , strong) UIBezierPath * basePath;
@end
@implementation YHMaskView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _basePath = [UIBezierPath bezierPathWithRect:self.bounds];
    }
    return self;
}
- (void)showCirclePathWithCenter:(CGPoint)center andRadius:(float)radius
{
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:0 endAngle:2 * M_PI clockwise:NO];
    [self showCustomCostomCutoutWithNewBezierPath:circlePath];
}
- (void)showRectPathWithFrame:(CGRect)frame andRadius:(float)radius
{
    UIBezierPath * rectPath = [[UIBezierPath bezierPathWithRoundedRect:frame cornerRadius:radius] bezierPathByReversingPath];
    [self showCustomCostomCutoutWithNewBezierPath:rectPath];
}
- (void)showCustomCostomCutoutWithNewBezierPath:(UIBezierPath *)newPath
{
    [_basePath appendPath:newPath];
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = _basePath.CGPath;
    self.layer.mask = shapeLayer;
}
- (UIView*)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    UIView *hitView = [super hitTest:point withEvent:event];
    if(hitView == self){
        //自动将事件传递到上一层
        return nil;
    }
    return hitView;
}
@end
