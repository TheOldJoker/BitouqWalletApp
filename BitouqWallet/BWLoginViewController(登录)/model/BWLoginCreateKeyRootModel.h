//
//  BWLoginCreateKeyRootModel.h
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/6.
//  Copyright © 2018 Joker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BWLoginCreateKeyModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface BWLoginCreateKeyRootModel : NSObject
@property (nonatomic, copy) NSString *errorMsg;
@property (nonatomic, assign) NSInteger errorCode;
@property (nonatomic, assign) NSInteger status;

@property (nonatomic, strong) BWLoginCreateKeyModel *data;

@end

NS_ASSUME_NONNULL_END
