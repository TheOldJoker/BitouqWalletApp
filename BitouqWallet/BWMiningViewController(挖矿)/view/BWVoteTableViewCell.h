//
//  BWVoteTableViewCell.h
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/11.
//  Copyright © 2018 Joker. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BWVoteCellButton.h"
NS_ASSUME_NONNULL_BEGIN

@interface BWVoteTableViewCell : UITableViewCell
@property (nonatomic, strong) BWMiningOwnerModel *model;
@property (strong, nonatomic) IBOutlet BWVoteCellButton *userActionButton;
@end

NS_ASSUME_NONNULL_END
