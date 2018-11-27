//
//  UILabel+YHBaseCategory.h
//  TempDemo
//
//  Created by 赵一欢 on 2018/6/21.
//  Copyright © 2018年 zhaoyihuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (YHBaseCategory)
- (void)configWithTextColor:(UIColor *)textColor font:(UIFont *)font textAlignment:(NSTextAlignment)textAlignment backgroundColor:(UIColor *)backgroundColor;
    /**
     *在设置好text,font,frame之后精确重置宽度
     */
- (void)reSetWidth;
    /**
     *在设置好text,font,frame之后精确重置高度
     */
- (void)reSetHeight;
@end
