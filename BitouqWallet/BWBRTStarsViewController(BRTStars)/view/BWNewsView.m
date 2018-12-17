//
//  BWNewsView.m
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/13.
//  Copyright © 2018 Joker. All rights reserved.
//

#import "BWNewsView.h"
@interface BWNewsView()<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *mainScorllView;
@property (nonatomic, strong) NSMutableArray *contentLabels;
@property (nonatomic, strong) NSTimer* timer;
@end
@implementation BWNewsView
- (UIScrollView *)mainScorllView{
    if (!_mainScorllView) {
        _mainScorllView = [[UIScrollView alloc] initWithFrame:(CGRectMake(0, 0, self.width, self.height))];
        _mainScorllView.pagingEnabled = YES;
        _mainScorllView.showsHorizontalScrollIndicator = NO;
        _mainScorllView.showsVerticalScrollIndicator = NO;
        _mainScorllView.bounces = NO;
        _mainScorllView.userInteractionEnabled = NO;
        [self addSubview:_mainScorllView];
    }
    return _mainScorllView;
}
- (NSMutableArray *)contentLabels{
    if (!_contentLabels) {
        _contentLabels = [NSMutableArray array];
    }
    return _contentLabels;
}
- (void)initSubViews{
    self.mainScorllView.delegate = self;
}
- (void)setShowContent:(NSArray *)showContent{
    _showContent = showContent;
    [self createShowContents];
}
- (void)createShowContents{
    [_timer invalidate];
    _timer = nil;
    if (self.contentLabels.count > 0) {
        for (UILabel *temp in self.contentLabels) {
            [temp removeFromSuperview];
        }
        [self.contentLabels removeAllObjects];
    }
    self.mainScorllView.contentSize = CGSizeMake(self.mainScorllView.width, self.height * self.showContent.count);
    for (int i = 0; i < self.showContent.count; i++) {
        UILabel *lab = [[UILabel alloc] initWithFrame:(CGRectMake(0, i * self.mainScorllView.height, self.mainScorllView.width, self.mainScorllView.height))];
        [lab configWithTextColor:[UIColor colorWithHexString:@"a3a9af"] font:[UIFont systemFontOfSize:12.f] textAlignment:(NSTextAlignmentCenter) backgroundColor:nil];
        lab.text = self.showContent[i];
        [self.mainScorllView addSubview:lab];
        [self.contentLabels addObject:lab];
    }
    _timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(next) userInfo:nil repeats:YES];
}
/**
 *  定时器轮播效果
 */
- (void)next
{
    
    [UIView animateWithDuration:0.5 animations:^{
        self.mainScorllView.contentOffset = CGPointMake(0,self.mainScorllView.contentOffset.y + self.mainScorllView.height);
    }completion:^(BOOL finished) {
        //如果滚动到最后一张，就设置到第二张
        if (self.mainScorllView.contentOffset.y == self.height * (self.contentLabels.count - 1))
        {
            self.mainScorllView.contentOffset = CGPointMake(0, self.height);
        }
    }];
}
-(void)dealloc
{
    [_timer invalidate];
    _timer = nil;
}
@end
