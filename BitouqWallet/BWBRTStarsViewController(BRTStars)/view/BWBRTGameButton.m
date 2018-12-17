//
//  BWBRTGameButton.m
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/17.
//  Copyright © 2018 Joker. All rights reserved.
//

#import "BWBRTGameButton.h"

@implementation BWBRTGameButton

- (CGRect)titleRectForContentRect:(CGRect)contentRect{
    return CGRectMake(10, 0, contentRect.size.width - 20, contentRect.size.height);
}
- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    float w = 12;
    float h = 6;
    return CGRectMake(contentRect.size.width - 17, (contentRect.size.height - 6) / 2, w, h);
}
@end
