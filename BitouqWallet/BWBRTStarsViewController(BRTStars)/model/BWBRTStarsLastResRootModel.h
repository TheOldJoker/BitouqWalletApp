//
//  BWBRTStarsLastResRootModel.h
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/13.
//  Copyright © 2018 Joker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BWBRTStarsLastResModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface BWBRTStarsLastResRootModel : NSObject
@property (nonatomic, copy) NSString *errorMsg;
@property (nonatomic, assign) NSInteger errorCode;
@property (nonatomic, assign) NSInteger status;

@property (nonatomic, strong) BWBRTStarsLastResModel *data;//數據
@end

NS_ASSUME_NONNULL_END
