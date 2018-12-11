//
//  BWMiningOwnerRootModel.h
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/10.
//  Copyright © 2018 Joker. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BWMiningOwnerRootModel : NSObject
@property (nonatomic, copy) NSString *errorMsg;
@property (nonatomic, assign) NSInteger errorCode;
@property (nonatomic, assign) NSInteger status;

@property (nonatomic, strong) NSArray *data;//數據
@end

NS_ASSUME_NONNULL_END
