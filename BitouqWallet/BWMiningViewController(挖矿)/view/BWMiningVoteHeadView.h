//
//  BWMiningVoteHeadView.h
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/11.
//  Copyright © 2018 Joker. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BWMiningVoteHeadView : UIView
@property (strong, nonatomic) IBOutlet UILabel *atmLabel;//幣齡
@property (strong, nonatomic) IBOutlet UILabel *groupLabel;//挖礦累計收益
@property (strong, nonatomic) IBOutlet UILabel *memberLabel;//所屬礦主信息

@end

NS_ASSUME_NONNULL_END
