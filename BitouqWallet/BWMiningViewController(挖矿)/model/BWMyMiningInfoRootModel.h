//
//  BWMyMiningInfoRootModel.h
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/11.
//  Copyright © 2018 Joker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BWMyMiningInfoModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface BWMyMiningInfoRootModel : NSObject
@property (nonatomic, copy) NSString *errorMsg;
@property (nonatomic, assign) NSInteger errorCode;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, strong) BWMyMiningInfoModel *data;
@end

NS_ASSUME_NONNULL_END
