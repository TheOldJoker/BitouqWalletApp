//
//  BWVoteCellButton.h
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/11.
//  Copyright © 2018 Joker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BWMiningOwnerModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface BWVoteCellButton : UIButton
@property (nonatomic, strong) BWMiningOwnerModel *model;
@end

NS_ASSUME_NONNULL_END
