//
//  BWBRTStarsLastResModel.h
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/13.
//  Copyright © 2018 Joker. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BWBRTStarsLastResModel : NSObject
@property (nonatomic, copy) NSString *createtime;//开奖时间
@property (nonatomic, copy) NSString *ID;//开奖期数
@property (nonatomic, copy) NSString *miningpubkey;//开奖用户
@property (nonatomic, copy) NSString *result;//开奖结果
@end

NS_ASSUME_NONNULL_END
