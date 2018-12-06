//
//  BWDataSource.h
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/6.
//  Copyright © 2018 Joker. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BWDataSource : NSObject
+ (void)getKeySuccess:(void (^)(id response))success fail:(void (^)(NSError * error))failure;
@end

NS_ASSUME_NONNULL_END
