//
//  BWCodeHelper.h
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/7.
//  Copyright © 2018 Joker. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BWCodeHelper : NSObject
+ (UIImage *)createCodeImageWithString:(NSString *)codeString;
@end

NS_ASSUME_NONNULL_END
