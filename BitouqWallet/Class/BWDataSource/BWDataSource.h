//
//  BWDataSource.h
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/6.
//  Copyright © 2018 Joker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BWCommonRootModel.h"
#import "BWWalletSendModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface BWDataSource : NSObject
//獲取公鑰私鑰
+ (void)getKeySuccess:(void (^)(id response))success fail:(void (^)(NSError * error))failure;
//獲取賬戶餘額
+ (void)getUserAssetSuccess:(void (^)(id response))success fail:(void (^)(NSError * error))failure;
//獲取首頁概覽活動數據
+ (void)getWalletActivityDataSuccess:(void (^)(id response))success fail:(void (^)(NSError * error))failure;
//默認礦工費
+ (void)getDefaultservicefeeSuccess:(void (^)(id response))success fail:(void (^)(NSError * error))failure;
//獲取錢包頁面轉賬記錄
+ (void)getWalletrecordSuccess:(void (^)(id response))success fail:(void (^)(NSError * error))failure;
//轉賬
+ (void)transferAssetWithModel:(BWWalletSendModel *)sendModel success:(void (^)(id response))success fail:(void (^)(NSError * error))failure;
//轉賬記錄
+ (void)getRecordeSuccess:(void (^)(id response))success fail:(void (^)(NSError * error))failure;
//獲取所有礦主信息
+ (void)getAllTheMineOwnerSuccess:(void (^)(id response))success fail:(void (^)(NSError * error))failure;
//矿主挖矿
+ (void)miningProductionWithNum1:(NSString *)num1 num2:(NSString *)num2 num3:(NSString *)num3 num4:(NSString *)num4 num5:(NSString *)num5 success:(void (^)(id response))success fail:(void (^)(NSError * error))failure;
//查詢我的礦主
+ (void)getMyMiningOwnerSuccess:(void (^)(id response))success fail:(void (^)(NSError * error))failure;
//查詢我的累計收益
+ (void)getMyMiningEarningsSuccess:(void (^)(id response))success fail:(void (^)(NSError * error))failure;
//查詢我的幣齡
+ (void)getMyMiningAgeSuccess:(void (^)(id response))success fail:(void (^)(NSError * error))failure;
//投票
+ (void)voteToMiningOwnerWithKey:(NSString *)pubkey success:(void (^)(id response))success fail:(void (^)(NSError * error))failure;
//獲取礦主挖礦信息
+ (void)getMyMiningInfoSuccess:(void (^)(id response))success fail:(void (^)(NSError * error))failure;
//获取胜负手上次开奖记录
+ (void)getLastDiceWinerSuccess:(void (^)(id response))success fail:(void (^)(NSError * error))failure;
//获取胜负手赔率
+ (void)getDiceOddsSuccess:(void (^)(id response))success fail:(void (^)(NSError * error))failure;
//投票
+ (void)betWithGuessNumber:(NSString *)guessNumber money:(NSString *)money success:(void (^)(id response))success fail:(void (^)(NSError * error))failure;
@end

NS_ASSUME_NONNULL_END
