//
//  BWDataSource.m
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/6.
//  Copyright © 2018 Joker. All rights reserved.
//

#import "BWDataSource.h"
#import "BWNetHelper.h"
@implementation BWDataSource
#pragma mark - 獲取公鑰私鑰
+ (void)getKeySuccess:(void (^)(id response))success fail:(void (^)(NSError * error))failure{
    NSDictionary *params = @{};
    [BWNetHelper getWithUrl:[@"addr/getkeypair" getSeverUrl] params:params header:NO success:^(id response) {
        if (success) {
            success(response);
        }
    } fail:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
#pragma mark - 獲取賬戶餘額
+ (void)getUserAssetSuccess:(void (^)(id response))success fail:(void (^)(NSError * error))failure{
    BWUser *user = [BWUserManager shareManager].user;
    NSDictionary *params = @{
                             @"pubkey":user.publickey
                             };
    [BWNetHelper getWithUrl:[@"asset" getSeverUrl] params:params header:NO success:^(id response) {
        if (success) {
            success(response);
        }
    } fail:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
#pragma mark - 獲取首頁概覽活動數據
+ (void)getWalletActivityDataSuccess:(void (^)(id response))success fail:(void (^)(NSError * error))failure{
    BWUser *user = [BWUserManager shareManager].user;
    NSDictionary *params = @{
                             @"pubkey":user.publickey
                             };
    [BWNetHelper getWithUrl:[@"staticbypubkey" getSeverUrl] params:params header:NO success:^(id response) {
        if (success) {
            success(response);
        }
    } fail:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
@end
