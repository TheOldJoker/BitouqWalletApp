//
//  UIImageView+YHBaseCategory.m
//  TempDemo
//
//  Created by 赵一欢 on 2018/6/21.
//  Copyright © 2018年 zhaoyihuan. All rights reserved.
//

#import "UIImageView+YHBaseCategory.h"

@implementation UIImageView (YHBaseCategory)
- (void)EdgeImage:(UIImage *)image withUIEdgeInsets:(UIEdgeInsets)insets
    {
        image = [image resizableImageWithCapInsets:insets resizingMode:(UIImageResizingModeStretch)];
        [self setImage:image];
    }
@end
