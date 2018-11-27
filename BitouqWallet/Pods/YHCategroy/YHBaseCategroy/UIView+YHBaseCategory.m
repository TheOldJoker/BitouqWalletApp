//
//  UIView+YHBaseCategory.m
//  TempDemo
//
//  Created by 赵一欢 on 2018/6/21.
//  Copyright © 2018年 zhaoyihuan. All rights reserved.
//

#import "UIView+YHBaseCategory.h"

@implementation UIView (YHBaseCategory)
- (void)setLeft:(CGFloat)left
{
    [self setX:left];
}
- (CGFloat)left
{
    return self.frame.origin.x;
}
- (void)setRight:(CGFloat)right
{
    CGRect frame = self.frame;
    frame.origin.x = right - self.bounds.size.width;
    self.frame = frame;
}
- (CGFloat)right
{
    return self.frame.origin.x + self.bounds.size.width;
}
- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}
- (CGFloat)centerX
{
    return self.center.x;
}
- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}
- (CGFloat)centerY
{
    return self.center.y;
}
- (CGFloat)top
{
    return self.frame.origin.y;
}
- (void)setTop:(CGFloat)top
{
    [self setY:top];
}
- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}
    
- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}
- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}
    
- (CGFloat)x
{
    return self.frame.origin.x;
}
    
- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}
    
- (CGFloat)y
{
    return self.frame.origin.y;
}
    
- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}
    
- (CGFloat)width
{
    return self.frame.size.width;
}
    
- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}
    
- (CGFloat)height
{
    return self.frame.size.height;
}
    
- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}
    
- (CGSize)size
{
    return self.frame.size;
}
- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}
    
- (CGPoint)origin
{
    return self.frame.origin;
}
- (NSString *)frameDescription
{
    return [NSString stringWithFormat:@"(%lf,%lf,%lf,%lf)",self.frame.origin.x,self.frame.origin.y,self.frame.size.width,self.frame.size.height];
}
    //获取当前view所在控制器
- (UIViewController *)viewController{
    UIViewController *viewController = nil;
    UIResponder *next = self.nextResponder;
    while (next)
    {
        if ([next isKindOfClass:[UIViewController class]])
        {
            viewController = (UIViewController *)next;
            break;
        }
        next = next.nextResponder;
    }
    return viewController;
}
- (void)setCornerRadius:(float)cornerRadius borderWidth:(float)borderWidth borderColor:(UIColor *)borderColor{
    self.layer.cornerRadius = cornerRadius;
    if (borderColor) {
        self.layer.borderWidth = borderWidth;
        self.layer.borderColor = borderColor.CGColor;
    }
    self.clipsToBounds = YES;
}
@end
