//
//  BWMyMiningInfoModel.h
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/11.
//  Copyright © 2018 Joker. All rights reserved.
//
/*
 "degree": 90000,        //我的选数结果
 "mingingRate": 0,
 "num1": "012345678",        //万位（绿）
 "num2": "0123456789",        //千位（蓝）
 "num3": "0123456789",        //百位（红）
 "num4": "0123456789",        //十位（黄）
 "num5": "0123456789",        //个位（灰）
 "pubkey": "1234"            //公钥
 */
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BWMyMiningInfoModel : NSObject
@property (nonatomic, copy) NSString *degree;
@property (nonatomic, copy) NSString *mingingRate;
@property (nonatomic, copy) NSString *num1;
@property (nonatomic, copy) NSString *num2;
@property (nonatomic, copy) NSString *num3;
@property (nonatomic, copy) NSString *num4;
@property (nonatomic, copy) NSString *num5;
@property (nonatomic, copy) NSString *pubkey;
@end

NS_ASSUME_NONNULL_END
