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
    return CGRectMake(15, 0, contentRect.size.width - 20, contentRect.size.height);
}
- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    float w = 6;
    float h = 3;
    return CGRectMake(contentRect.size.width - 17, (contentRect.size.height - 3) / 2, w, h);
}
@end
