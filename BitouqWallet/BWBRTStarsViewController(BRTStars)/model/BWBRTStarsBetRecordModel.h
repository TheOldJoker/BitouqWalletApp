//
//  BWBRTStarsBetRecordModel.h
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/14.
//  Copyright © 2018 Joker. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BWBRTStarsBetRecordModel : NSObject
@property (nonatomic, copy) NSString *amount;//投注合计
@property (nonatomic, copy) NSString *createtime;//时间
@property (nonatomic, copy) NSString *num1;//绿
@property (nonatomic, copy) NSString *num2;//蓝
@property (nonatomic, copy) NSString *num3;//红
@property (nonatomic, copy) NSString *num4;//黄
@property (nonatomic, copy) NSString *num5;//灰
@property (nonatomic, copy) NSString *price;//单注金额
@property (nonatomic, copy) NSString *pubkey;//
@property (nonatomic, copy) NSString *reward;//中奖金额
@property (nonatomic, copy) NSString *result;//开奖结果
@property (nonatomic, copy) NSString *term;//第几期
@property (nonatomic, copy) NSString *type;//投注类型
@property (nonatomic, assign) BOOL win;//是否中奖
@end

NS_ASSUME_NONNULL_END
