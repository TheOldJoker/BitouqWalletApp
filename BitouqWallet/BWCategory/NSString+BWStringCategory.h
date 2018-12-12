//
//  NSString+BWStringCategory.h
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/6.
//  Copyright © 2018 Joker. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (BWStringCategory)
- (NSString *)getSeverUrl;
- (NSArray *)componentsSeparatedByCharset;
- (NSString *)getTime;
@end

NS_ASSUME_NONNULL_END
