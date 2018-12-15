//
//  BWBRTStarsHeadView.m
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/13.
//  Copyright © 2018 Joker. All rights reserved.
//

#import "BWBRTStarsHeadView.h"
#import "BWNewsView.h"
#import "BWBRTStarsNewsModel.h"
#import "BWTheLotteryResultsView.h"
@interface BWBRTStarsHeadView()<BWMiningOwnerNumbersViewDelegate,BWBRTStarsGameGambleViewDelegate>
@property (nonatomic, strong) BWTheLotteryResultsView *theLotteryResultsView;//中奖结果
@property (nonatomic, strong) UILabel *timerLabel;//计时
@property (nonatomic, strong) BWNewsView *publishedLabel;//中奖公告
@property (nonatomic, strong) NSTimer * myTimer;//開獎倒計時
@property (nonatomic, assign) NSInteger myTime;
//@property (nonatomic, strong) UIImageView *mainBackImageView;
@end
@implementation BWBRTStarsHeadView
#pragma mark - func
- (void)initSubviews{
//    self.mainBackImageView = [[UIImageView alloc] initWithFrame:(CGRectMake(0, 0, self.width, self.height))];
//    self.mainBackImageView.image = [UIImage imageNamed:@"main_background"];
//    self.mainBackImageView.contentMode = UIViewContentModeTop;
//    [self addSubview:self.mainBackImageView];
}
- (void)setCountdownTimer:(NSInteger)time{
    self.myTime = time;
    NSInteger day = time / 24 / 3600;
    NSInteger hour = (time - day * 24 * 3600)/3600;
    NSInteger min = (time - day * 24 * 3600 - hour * 3600)/60;
    NSInteger second = time - day * 24 * 3600 - hour * 3600 - min * 60;
    if (time <= 0) {
        time = 0;
        [self.myTimer invalidate];
        self.myTimer = nil;
        self.timerLabel.text = @"00:00:00";
        if ([self.delegate respondsToSelector:@selector(timeOver)]) {
            [self.delegate timeOver];
        }
    }
    self.timerLabel.text = [NSString stringWithFormat:@"%02ld:%02ld:%02ld",hour,min,second];
}
- (void)countdownFunc {
    self.myTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(setCountdownValue) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.myTimer forMode:UITrackingRunLoopMode];
}
- (void)setCountdownValue {
    self.myTime -= 1;
    self.myTime = MAX(0, self.myTime);
    [self setCountdownTimer:self.myTime];
}
#pragma mark - lazyload
- (BWBRTStarsGameGambleView *)gameStarsView2{
    if (!_gameStarsView2) {
        _gameStarsView2 = [[BWBRTStarsGameGambleView alloc] initWithFrame:(CGRectMake(0, self.gameButton.bottom + 20, 304, 60))];
        _gameStarsView2.centerX = self.width / 2;
        [_gameStarsView2 initSubViews];
        [_gameStarsView2 setNumbersSelected:NO];
        _gameStarsView2.delegate = self;
        [self addSubview:_gameStarsView2];
    }
    return _gameStarsView2;
}
- (BWMiningOwnerNumbersView *)gameStarsView1{
    if (!_gameStarsView1) {
        _gameStarsView1 = [[BWMiningOwnerNumbersView alloc] initWithFrame:(CGRectMake(0, self.gameButton.bottom + 20, 304, 165))];
        _gameStarsView1.centerX = self.width / 2;
        [_gameStarsView1 initSubViews];
        [_gameStarsView1.greenView setNumbersSelected:NO];
        [_gameStarsView1.blueView setNumbersSelected:NO];
        [_gameStarsView1.redView setNumbersSelected:NO];
        [_gameStarsView1.yellowView setNumbersSelected:NO];
        [_gameStarsView1.grayView setNumbersSelected:NO];
        _gameStarsView1.delegate = self;
        [self addSubview:_gameStarsView1];
    }
    return _gameStarsView1;
}
- (UIButton *)gameButton{
    if (!_gameButton) {
        _gameButton = [[UIButton alloc] initWithFrame:(CGRectMake(self.currentBettingButton.x, self.currentBettingButton.bottom + 12, 80, 30))];
        _gameButton.backgroundColor = [UIColor colorWithHexString:@"7932DF"];
        [_gameButton setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        [_gameButton setTitle:@"1星競猜" forState:(UIControlStateNormal)];
        _gameButton.layer.cornerRadius = 15;
        _gameButton.clipsToBounds = YES;
        _gameButton.titleLabel.font = [UIFont systemFontOfSize:13.f];
        
        [_gameButton setImage:[UIImage imageNamed:@"brtstar_pull"] forState:(UIControlStateNormal)];
        
//        CGFloat labelWidth = _gameButton.titleLabel.frame.size.width;
//        CGFloat imageWith = _gameButton.imageView.frame.size.width;
//        _gameButton.imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth, 0, -labelWidth);
//        _gameButton.titleEdgeInsets = UIEdgeInsetsMake(0, -imageWith, 0, imageWith);
        
        [self addSubview:_gameButton];
    }
    return _gameButton;
}
- (UIButton *)theLotteryRecordButton{
    if (!_theLotteryRecordButton) {
        _theLotteryRecordButton = [[UIButton alloc] initWithFrame:(CGRectMake(self.currentBettingButton.right + 10, self.currentBettingButton.y, 80, 30))];
        _theLotteryRecordButton.backgroundColor = [UIColor colorWithHexString:@"7932DF"];
        [_theLotteryRecordButton setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        [_theLotteryRecordButton setTitle:@"開獎記錄" forState:(UIControlStateNormal)];
        _theLotteryRecordButton.layer.cornerRadius = 15;
        _theLotteryRecordButton.clipsToBounds = YES;
        _theLotteryRecordButton.titleLabel.font = [UIFont systemFontOfSize:13.f];
        [self addSubview:_theLotteryRecordButton];
    }
    return _theLotteryRecordButton;
}
- (UIButton *)currentBettingButton{
    if (!_currentBettingButton) {
        _currentBettingButton = [[UIButton alloc] initWithFrame:(CGRectMake(0, self.theLotteryResultsView.bottom + 20, 80, 30))];
        _currentBettingButton.backgroundColor = [UIColor colorWithHexString:@"7932DF"];
        [_currentBettingButton setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        [_currentBettingButton setTitle:@"當期投注" forState:(UIControlStateNormal)];
        _currentBettingButton.layer.cornerRadius = 15;
        _currentBettingButton.clipsToBounds = YES;
        _currentBettingButton.titleLabel.font = [UIFont systemFontOfSize:13.f];
        _currentBettingButton.centerX = self.width / 2;
        [self addSubview:_currentBettingButton];
    }
    return _currentBettingButton;
}
- (UIButton *)bettingRecordButton{
    if (!_bettingRecordButton) {
        _bettingRecordButton = [[UIButton alloc] initWithFrame:(CGRectMake(self.currentBettingButton.x - 90, self.currentBettingButton.y, 80, 30))];
        _bettingRecordButton.backgroundColor = [UIColor colorWithHexString:@"7932DF"];
        
        _bettingRecordButton.layer.cornerRadius = 15;
        _bettingRecordButton.clipsToBounds = YES;
        _bettingRecordButton.titleLabel.font = [UIFont systemFontOfSize:13.f];
        
        [_bettingRecordButton setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        [_bettingRecordButton setTitle:@"投注記錄" forState:(UIControlStateNormal)];
        [self addSubview:_bettingRecordButton];
    }
    return _bettingRecordButton;
}
- (BWTheLotteryResultsView *)theLotteryResultsView{
    if (!_theLotteryResultsView) {
        _theLotteryResultsView = [[BWTheLotteryResultsView alloc] initWithFrame:(CGRectMake(0, self.timerLabel.bottom + 10, 50 * 5 + 32, 50))];
        _theLotteryResultsView.centerX = self.width / 2;
        [self addSubview:_theLotteryResultsView];
    }
    return _theLotteryResultsView;
}
- (UILabel *)timerLabel{
    if (!_timerLabel) {
        _timerLabel = [[UILabel alloc] initWithFrame:(CGRectMake(0, self.publishedLabel.bottom + 11, self.width, 48))];
        [_timerLabel configWithTextColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:40.f] textAlignment:(NSTextAlignmentCenter) backgroundColor:nil];
        [self addSubview:_timerLabel];
    }
    return _timerLabel;
}
- (BWNewsView *)publishedLabel{
    if (!_publishedLabel) {
        _publishedLabel = [[BWNewsView alloc] initWithFrame:(CGRectMake(0, 20, 259, 20))];
        _publishedLabel.centerX = self.width / 2;
        [_publishedLabel initSubViews];
        [self addSubview:_publishedLabel];
    }
    return _publishedLabel;
}
#pragma mark - buttonAction
#pragma mark - setter
- (void)setGameType:(NSInteger)gameType{
    _gameType = gameType;
    NSArray *dataArray = @[@"1星競猜",@"2星競猜",@"3星競猜",@"4星競猜",@"5星競猜",@"前置3星任選",@"前置3星雙殺",@"前置3星豹子"];
    [self.gameButton setTitle:dataArray[gameType - 1] forState:(UIControlStateNormal)];
    if (gameType > 5) {
        self.gameButton.width = 130;
    }else{
        self.gameButton.width = 80;
    }
    self.gameButton.centerX = self.width / 2;
    
    //游戏方式
    if (gameType < 6) {
        //1~5星游戏
        self.gameStarsView1.hidden = NO;
        self.gameStarsView2.hidden = YES;
        [self.gameStarsView1.greenView setNumbersSelected:NO];
        [self.gameStarsView1.blueView setNumbersSelected:NO];
        [self.gameStarsView1.redView setNumbersSelected:NO];
        [self.gameStarsView1.yellowView setNumbersSelected:NO];
        [self.gameStarsView1.grayView setNumbersSelected:NO];
        self.height = self.gameStarsView1.bottom + 5;
    }else{
        //3星特殊游戏
        self.gameStarsView1.hidden = YES;
        self.gameStarsView2.hidden = NO;
        [self.gameStarsView2 setNumbersSelected:NO];
        self.height = self.gameStarsView2.bottom + 5;
    }
//    self.mainBackImageView.height = self.height;
}
- (void)setCountdown:(NSString *)countdown{
    if (_countdown != countdown) {
        [self.myTimer invalidate];
        self.myTimer = nil;
        _countdown = countdown;
        if ([countdown integerValue] < 0) {
            self.timerLabel.text = @"00:00:00";
        }else{
            [self setCountdownTimer:[countdown integerValue]];
            [self countdownFunc];
        }
    }
}
- (void)setTheLotteryResults:(NSString *)theLotteryResults{
    if (_theLotteryResults != theLotteryResults) {
        _theLotteryResults = theLotteryResults;
        self.theLotteryResultsView.showNumber = theLotteryResults;
    }
}
- (void)setNews:(NSArray *)news{
    if (_news != news) {
        _news = news;
        NSMutableArray *contents = [NSMutableArray array];
        for (BWBRTStarsNewsModel *temp in news) {
            NSString *userInfo = [NSString stringWithFormat:@"%@...%@",[temp.pubkey substringToIndex:2],[temp.pubkey substringFromIndex:40]];
            NSString *content = [NSString stringWithFormat:@"快訊：節點%@獲得獎金%@ BRT",userInfo,temp.amount];
            [contents addObject:content];
        }
        self.publishedLabel.showContent = contents;
    }
}
#pragma mark - BWMiningOwnerNumbersViewDelegate
- (void)numberStatusChange{
    if ([self.delegate respondsToSelector:@selector(userPressNumbers)]) {
        [self.delegate userPressNumbers];
    }
}
#pragma mark - BWBRTStarsGameGambleViewDelegate
- (void)gameGambleNumberChange{
    if ([self.delegate respondsToSelector:@selector(userPressNumbers)]) {
        [self.delegate userPressNumbers];
    }
}
@end
