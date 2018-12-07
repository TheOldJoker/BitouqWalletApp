//
//  BWWalletSendModel.h
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/7.
//  Copyright © 2018 Joker. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BWWalletSendModel : NSObject
@property (nonatomic, copy) NSString *userAsset;//賬戶餘額
@property (nonatomic, copy) NSString *getAddress;//接受地址
@property (nonatomic, copy) NSString *sendMoney;//輸入金額
@property (nonatomic, copy) NSString *miningMoney;//礦工費
@end

NS_ASSUME_NONNULL_END
