//
//  NSString+BWStringCategory.m
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/6.
//  Copyright © 2018 Joker. All rights reserved.
//

#import "NSString+BWStringCategory.h"

@implementation NSString (BWStringCategory)
- (NSString *)getSeverUrl
{
    return [NSString stringWithFormat:@"%@%@",domain,self];
}
@end
