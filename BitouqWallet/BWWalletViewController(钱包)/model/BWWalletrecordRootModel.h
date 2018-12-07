//
//  BWWalletrecordRootModel.h
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/7.
//  Copyright © 2018 Joker. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BWWalletrecordRootModel : NSObject
@property (nonatomic, copy) NSString *errorMsg;
@property (nonatomic, assign) NSInteger errorCode;
@property (nonatomic, assign) NSInteger status;

@property (nonatomic, copy) NSArray *data;//數據
@end

NS_ASSUME_NONNULL_END
