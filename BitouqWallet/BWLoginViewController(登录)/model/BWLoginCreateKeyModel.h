//
//  BWLoginCreateKeyModel.h
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/6.
//  Copyright © 2018 Joker. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BWLoginCreateKeyModel : NSObject
@property (nonatomic, copy) NSString *prikey;//私钥
@property (nonatomic, copy) NSString *pubkey;//公钥
@end

NS_ASSUME_NONNULL_END
