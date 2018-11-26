//
//  UIColor+YHBaseCategory.m
//  TempDemo
//
//  Created by 赵一欢 on 2018/6/21.
//  Copyright © 2018年 zhaoyihuan. All rights reserved.
//

#import "UIColor+YHBaseCategory.h"

@implementation UIColor (YHBaseCategory)
+ (UIColor *)colorWithHexString:(NSString *)hexString
    {
        NSString *cString = [[hexString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
        
        // String should be 6 or 8 characters
        if ([cString length] < 6) {
            return [UIColor clearColor];
        }
        
        // strip 0X if it appears
        if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
        if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
        if ([cString length] != 6)
        {
            return [UIColor clearColor];
        }
        
        
        // Separate into r, g, b substrings
        NSRange range;
        range.location = 0;
        range.length = 2;
        
        //r
        NSString *rString = [cString substringWithRange:range];
        
        //g
        range.location = 2;
        NSString *gString = [cString substringWithRange:range];
        
        //b
        range.location = 4;
        NSString *bString = [cString substringWithRange:range];
        
        // Scan values
        unsigned int r, g, b;
        [[NSScanner scannerWithString:rString] scanHexInt:&r];
        [[NSScanner scannerWithString:gString] scanHexInt:&g];
        [[NSScanner scannerWithString:bString] scanHexInt:&b];
        
        return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
    }
- (NSString *)getRGBValue
    {
        const CGFloat *components = CGColorGetComponents(self.CGColor);
        return [NSString stringWithFormat:@"RGB(%.f,%.f,%.f)",components[0] * 255 , components[1] * 255 , components[2] * 255];
    }
@end
