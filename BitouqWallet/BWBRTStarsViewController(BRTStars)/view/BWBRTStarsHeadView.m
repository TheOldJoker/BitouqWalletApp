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
@interface BWBRTStarsHeadView()
@property (nonatomic, strong) BWTheLotteryResultsView *theLotteryResultsView;//中奖结果
@property (nonatomic, strong) UILabel *timerLabel;//计时器
@property (nonatomic, strong) BWNewsView *publishedLabel;//中奖公告

@end
@implementation BWBRTStarsHeadView
#pragma mark - func

#pragma mark - lazyload
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
@end
