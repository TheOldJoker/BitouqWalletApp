//
//  BWWalletrecordTableViewCell.h
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/5.
//  Copyright © 2018 Joker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BWWalletrecordModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface BWWalletrecordTableViewCell : UITableViewCell
- (void)setValueWithModel:(BWWalletrecordModel *)model;
@end

NS_ASSUME_NONNULL_END
