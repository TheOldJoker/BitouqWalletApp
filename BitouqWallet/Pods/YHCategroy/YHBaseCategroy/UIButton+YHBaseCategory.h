//
//  UIButton+YHBaseCategory.h
//  TempDemo
//
//  Created by 赵一欢 on 2018/6/21.
//  Copyright © 2018年 zhaoyihuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (YHBaseCategory)
//设置button的额外增加的范围,四个方向增加的相同
- (void)setEnlargeEdge:(CGFloat)size;
//分别设置button的四个方向要增大的范围
- (void)setEnlargeEdgeWithTop:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom left:(CGFloat)left;
@end
