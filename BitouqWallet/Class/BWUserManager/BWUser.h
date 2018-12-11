//
//  BWUser.h
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/2.
//  Copyright © 2018 Joker. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BWUser : NSObject<NSCoding>
@property (nonatomic, copy) NSString *privatekey;//私鑰
@property (nonatomic, copy) NSString *publickey;//公鑰
@property (nonatomic, copy) NSString *asset;//資產餘額
@property (nonatomic, copy) NSString *miningOwner;//所屬礦主公鑰
@property (nonatomic, copy) NSString *miningAge;//幣齡
#pragma mark 矿主身份属性
@property (nonatomic, copy) NSString *productRadio;//矿主身份
@property (nonatomic, copy) NSString *degree;//概率指数
@end

NS_ASSUME_NONNULL_END
