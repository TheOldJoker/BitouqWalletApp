//
//  BWWalletActivityModel.h
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/7.
//  Copyright © 2018 Joker. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BWWalletActivityModel : NSObject
@property (nonatomic, copy) NSString *diceSum;//勝負手
@property (nonatomic, copy) NSString *miningSum;//挖礦
@property (nonatomic, copy) NSString *starSum;//brtstar
@property (nonatomic, copy) NSString *transferSum;//交易
@end

NS_ASSUME_NONNULL_END
