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
//獲取公鑰私鑰
+ (void)getKeySuccess:(void (^)(id response))success fail:(void (^)(NSError * error))failure;
//獲取賬戶餘額
+ (void)getUserAssetSuccess:(void (^)(id response))success fail:(void (^)(NSError * error))failure;
//獲取首頁概覽活動數據
+ (void)getWalletActivityDataSuccess:(void (^)(id response))success fail:(void (^)(NSError * error))failure;
@end

NS_ASSUME_NONNULL_END
