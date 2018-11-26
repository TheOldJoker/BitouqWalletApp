//
//  UIColor+YHBaseCategory.h
//  TempDemo
//
//  Created by 赵一欢 on 2018/6/21.
//  Copyright © 2018年 zhaoyihuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (YHBaseCategory)
    /**
     *  通过16进制颜色码创建Color
     *
     *  @param hexString 16进制颜色码
     *
     *  @return UIColor
     */
+ (UIColor *)colorWithHexString:(NSString *)hexString;
    /**
     *  获取color的RGB值
     *
     *  @return RGB描述
     */
- (NSString *)getRGBValue;
@end
