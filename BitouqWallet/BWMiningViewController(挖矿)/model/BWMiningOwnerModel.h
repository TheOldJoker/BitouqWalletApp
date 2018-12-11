//
//  BWMiningOwnerModel.h
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/10.
//  Copyright © 2018 Joker. All rights reserved.
//
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BWMiningOwnerModel : NSObject
@property (nonatomic, copy) NSString *asset;//持幣量
@property (nonatomic, copy) NSString *coinage;//節點幣齡
@property (nonatomic, copy) NSString *productRadio;//生產力
@property (nonatomic, copy) NSString *pubkey;//礦主公鑰
@end

NS_ASSUME_NONNULL_END
