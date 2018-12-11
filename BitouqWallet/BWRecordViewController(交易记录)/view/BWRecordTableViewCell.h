//
//  BWRecordTableViewCell.h
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/10.
//  Copyright © 2018 Joker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BWRecordModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface BWRecordTableViewCell : UITableViewCell
- (void)setValueWithModel:(BWRecordModel *)model;
@end

NS_ASSUME_NONNULL_END
