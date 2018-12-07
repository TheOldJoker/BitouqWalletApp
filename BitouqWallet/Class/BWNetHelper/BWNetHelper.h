//
//  BWNetHelper.h
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/6.
//  Copyright © 2018 Joker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^ResponseSuccess)(id response);
typedef void(^ResponseFail)(NSError * error);
NS_ASSUME_NONNULL_BEGIN

@interface BWNetHelper : NSObject
+(void)getWithUrl:(NSString *)url params:(NSDictionary *)params header:(BOOL)header success:(ResponseSuccess)success fail:(ResponseFail)fail;
+ (void)postWithUrl:(NSString *)url params:(NSDictionary *)params header:(BOOL)header success:(ResponseSuccess)success fail:(ResponseFail)fail;
@end

NS_ASSUME_NONNULL_END
