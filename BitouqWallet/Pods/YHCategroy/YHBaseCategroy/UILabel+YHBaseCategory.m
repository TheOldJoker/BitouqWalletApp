//
//  UILabel+YHBaseCategory.m
//  TempDemo
//
//  Created by 赵一欢 on 2018/6/21.
//  Copyright © 2018年 zhaoyihuan. All rights reserved.
//

#import "UILabel+YHBaseCategory.h"

@implementation UILabel (YHBaseCategory)
- (void)configWithTextColor:(UIColor *)textColor font:(UIFont *)font textAlignment:(NSTextAlignment)textAlignment backgroundColor:(UIColor *)backgroundColor{
    if (textColor) {
        self.textColor = textColor;
    }
    if (font) {
        self.font = font;
    }
    if (backgroundColor) {
        self.backgroundColor = backgroundColor;
    }
    self.textAlignment = textAlignment;
}
- (void)reSetWidth{
    NSDictionary * attribute = @{NSFontAttributeName:self.font};
    CGSize retSize = [self.text boundingRectWithSize:CGSizeMake(MAXFLOAT, self.bounds.size.height) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    CGRect frame = self.frame;
    frame.size.width = retSize.width;
    self.frame = frame;
}
- (void)reSetHeight{
    NSDictionary * attribute = @{NSFontAttributeName:self.font};
    CGSize retSize = [self.text boundingRectWithSize:CGSizeMake(self.bounds.size.width, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    CGRect frame = self.frame;
    frame.size.height = retSize.height;
    self.frame = frame;
}
@end
