//
//  BWWalletrecordModel.h
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/7.
//  Copyright © 2018 Joker. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BWWalletrecordModel : NSObject
@property (nonatomic , copy) NSString *amount;//轉賬金額
@property (nonatomic , copy) NSString *createtime;//時間
@property (nonatomic , copy) NSString *fromprikey;//出金账户私钥
@property (nonatomic , copy) NSString *frompubkey;//出金账户公钥
@property (nonatomic , copy) NSString *gid;
@property (nonatomic , copy) NSString *topubkey;//入金账户公钥
@property (nonatomic , assign) NSInteger type;//交易描述

@end

NS_ASSUME_NONNULL_END
