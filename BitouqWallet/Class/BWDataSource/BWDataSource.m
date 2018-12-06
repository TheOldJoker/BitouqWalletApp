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
@end
