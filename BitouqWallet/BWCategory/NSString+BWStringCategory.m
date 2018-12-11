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
    return [NSString stringWithFormat:@"%@%@",DOMAINSTRING,self];
}
- (NSArray *)componentsSeparatedByCharset{
    NSMutableString *targetString = [NSMutableString stringWithString:self];
    NSMutableArray *tagArray = [NSMutableArray array];
    NSInteger count = self.length;
    for (int i = 0; i < count; i++) {
        [tagArray addObject:[targetString substringWithRange:(NSMakeRange(0, 1))]];
        targetString = [NSMutableString stringWithFormat:@"%@", [targetString substringFromIndex:1]];
    }
    return tagArray;
}
@end
