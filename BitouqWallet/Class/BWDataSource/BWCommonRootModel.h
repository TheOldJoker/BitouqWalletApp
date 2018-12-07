//
//  BWCommonRootModel.h
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/7.
//  Copyright © 2018 Joker. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BWCommonRootModel : NSObject
@property (nonatomic, copy) NSString *errorMsg;
@property (nonatomic, assign) NSInteger errorCode;//0成功
@property (nonatomic, assign) NSInteger status;
@end

NS_ASSUME_NONNULL_END
