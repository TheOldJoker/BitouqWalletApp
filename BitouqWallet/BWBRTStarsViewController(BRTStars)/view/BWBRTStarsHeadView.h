//
//  BWBRTStarsHeadView.h
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/13.
//  Copyright © 2018 Joker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BWMiningOwnerNumbersView.h"
#import "BWBRTStarsGameGambleView.h"
NS_ASSUME_NONNULL_BEGIN
@protocol BWBRTStarsHeadViewDelegate <NSObject>

- (void)timeOver;

@end
@interface BWBRTStarsHeadView : UIView
@property (nonatomic, weak) id<BWBRTStarsHeadViewDelegate> delegate;
@property (nonatomic, strong) NSArray *news;//中奖消息
@property (nonatomic, copy) NSString *countdown;//倒计时时间
@property (nonatomic, copy) NSString *theLotteryResults;//中奖公告
@property (nonatomic, strong) UIButton *bettingRecordButton;//投注记录
@property (nonatomic, strong) UIButton *currentBettingButton;//当前投注
@property (nonatomic, strong) UIButton *theLotteryRecordButton;//开奖记录
@property (nonatomic, strong) UIButton *gameButton;//竞猜方式
@property (nonatomic, assign) NSInteger gameType;//1->(1-5星),2->(3星玩法)
@property (nonatomic, strong) BWMiningOwnerNumbersView *gameStarsView1;//1~5星
@property (nonatomic, strong) BWBRTStarsGameGambleView *gameStarsView2;//3星玩法
@end

NS_ASSUME_NONNULL_END
