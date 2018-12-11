//
//  BWRecordModel.h
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/10.
//  Copyright © 2018 Joker. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BWRecordModel : NSObject
@property (nonatomic, copy) NSString *amount;//交易金額
@property (nonatomic, assign) NSInteger type;//交易類型
@property (nonatomic, copy) NSString *createtime;//創建時間
@property (nonatomic, copy) NSString *frompubkey;//出金公鑰
@property (nonatomic, copy) NSString *fromprikey;//出金私鑰
@property (nonatomic, assign) NSInteger gid;
@property (nonatomic, copy) NSString *topubkey;//入金公鑰
@end

NS_ASSUME_NONNULL_END
