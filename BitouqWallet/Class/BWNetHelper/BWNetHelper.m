//
//  BWNetHelper.m
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/6.
//  Copyright © 2018 Joker. All rights reserved.
//

#import "BWNetHelper.h"
#import "AFNetworking.h"
@implementation BWNetHelper
+ (void)cancancelAllOperationscel
{
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    [manager.operationQueue cancelAllOperations];
}
+(void)getWithUrl:(NSString *)url params:(NSDictionary *)params header:(BOOL)header success:(ResponseSuccess)success fail:(ResponseFail)fail
{
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = 10;
    manager.responseSerializer.acceptableContentTypes =  [NSSet setWithObjects:@"text/html",@"application/json",@"text/javascript",@"text/json",@"text/plain",@"charset=UTF-8", nil];
    
    // 设置请求头
//    if (header) {
//        [manager.requestSerializer setValue:[YHUserInfoTool getToken] forHTTPHeaderField:@"token"];
//        [manager.requestSerializer setValue:@"kaka" forHTTPHeaderField:@"kaka"];
//    }
    
    [manager GET:url parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (fail) {
            fail(error);
        }
    }];
}
@end
