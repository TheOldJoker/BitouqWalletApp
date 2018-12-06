//
//  UIView+BWViewCategory.h
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/5.
//  Copyright © 2018 Joker. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef struct CornerSize {
    CGFloat leftTop;
    CGFloat rightTop;
    CGFloat rightBottom;
    CGFloat leftBottom;
} CornerSize;

UIKIT_STATIC_INLINE CornerSize
MyCornerSizeMake(CGFloat leftTop, CGFloat rightTop, CGFloat rightBottom, CGFloat leftBottom)
{
    CornerSize size;
    
    size.leftTop = leftTop;
    size.rightTop = rightTop;
    size.leftBottom = leftBottom;
    size.rightBottom = rightBottom;
    
    return size;
}
@interface UIView (BWViewCategory)
- (void)setCornerWithCornerSize:(CornerSize)cornerSize;
@end

NS_ASSUME_NONNULL_END
