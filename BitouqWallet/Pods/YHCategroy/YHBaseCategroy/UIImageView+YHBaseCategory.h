//
//  UIImageView+YHBaseCategory.h
//  TempDemo
//
//  Created by 赵一欢 on 2018/6/21.
//  Copyright © 2018年 zhaoyihuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (YHBaseCategory)
    /**
     *  设置拉伸图片
     *
     *  @param image  被拉伸图片
     *  @param insets 拉伸规则
     */
- (void)EdgeImage:(UIImage *)image withUIEdgeInsets:(UIEdgeInsets)insets;

@end
