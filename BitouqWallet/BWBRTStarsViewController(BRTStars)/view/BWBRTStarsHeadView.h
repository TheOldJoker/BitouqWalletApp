//
//  BWBRTStarsHeadView.h
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/13.
//  Copyright © 2018 Joker. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BWBRTStarsHeadView : UIView
@property (nonatomic, strong) NSArray *news;//中奖消息
@property (nonatomic, copy) NSString *theLotteryResults;//中奖公告
@property (nonatomic, strong) UIButton *bettingRecordButton;//投注记录
@property (nonatomic, strong) UIButton *currentBettingButton;//当前投注
@property (nonatomic, strong) UIButton *theLotteryRecordButton;//开奖记录
@property (nonatomic, strong) UIButton *gameButton;//竞猜方式
@property (nonatomic, assign) NSInteger gameType;//1->(1-5星),2->(3星玩法)
@end

NS_ASSUME_NONNULL_END
