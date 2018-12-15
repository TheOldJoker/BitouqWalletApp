//
//  BWGameArithmeticModel.h
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/15.
//  Copyright © 2018 Joker. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BWGameArithmeticModel : NSObject
@property (nonatomic, copy) NSString *num1;
@property (nonatomic, copy) NSString *num2;
@property (nonatomic, copy) NSString *num3;
@property (nonatomic, copy) NSString *num4;
@property (nonatomic, copy) NSString *num5;
@property (nonatomic, copy) NSString *specialNum;

- (NSString *)getBetWithGameType:(NSInteger)gameType;
- (NSInteger)getWinNWithGameType:(NSInteger)gameType;

@end

NS_ASSUME_NONNULL_END
