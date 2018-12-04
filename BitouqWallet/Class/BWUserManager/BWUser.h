//
//  BWUser.h
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/2.
//  Copyright © 2018 Joker. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BWUser : NSObject<NSCoding>
@property (nonatomic, copy) NSString *privatekey;
@end

NS_ASSUME_NONNULL_END
