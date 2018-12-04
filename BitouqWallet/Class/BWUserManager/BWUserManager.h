//
//  BWUserManager.h
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/2.
//  Copyright © 2018 Joker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BWUser.h"
#import "YYCache.h"
NS_ASSUME_NONNULL_BEGIN

@interface BWUserManager : NSObject
@property (nonatomic , strong) BWUser * user;
@property (nonatomic , strong) YYCache * userCache;
+ (BWUserManager *)shareManager;
//更新用户缓存信息
- (void)updateUser;
@end

NS_ASSUME_NONNULL_END
