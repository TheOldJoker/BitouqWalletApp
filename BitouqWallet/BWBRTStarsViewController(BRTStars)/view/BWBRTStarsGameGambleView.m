//
//  BWBRTStarsGameGambleView.m
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/14.
//  Copyright © 2018 Joker. All rights reserved.
//

#import "BWBRTStarsGameGambleView.h"
@interface BWBRTStarsGameGambleView()
@property (nonatomic, strong) NSMutableArray *buttonsArray;
@property (nonatomic, strong) NSMutableArray *selectedButtons;
@end
@implementation BWBRTStarsGameGambleView
- (NSMutableArray *)buttonsArray{
    if (!_buttonsArray) {
        _buttonsArray = [NSMutableArray array];
    }
    return _buttonsArray;
}
- (NSMutableArray *)selectedButtons{
    if (!_selectedButtons) {
        _selectedButtons = [NSMutableArray array];
    }
    return _selectedButtons;
}
- (void)initSubViews{
    float ButtonW = 25;
    NSArray *backColor = @[@"7ed321",@"4a90e2",@"f42850"];
    for (int i = 0; i < 3; i++) {
        UIView *view = [[UIView alloc] initWithFrame:(CGRectMake((ButtonW + 2) * i, 0, ButtonW, ButtonW))];
        view.layer.cornerRadius = ButtonW / 2;
        view.clipsToBounds = YES;
        view.backgroundColor = [UIColor colorWithHexString:backColor[i]];
        [self addSubview:view];
    }
    for (int i = 1; i < 11; i++) {
        UIButton *button = [[UIButton alloc] initWithFrame:(CGRectMake((ButtonW + 2) * (i - 1), 35, ButtonW, ButtonW))];
        [button setTitle:[NSString stringWithFormat:@"%d",i] forState:(UIControlStateNormal)];
        [button setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
        button.titleLabel.font = [UIFont systemFontOfSize:13.f];
        [button setTitleColor:[UIColor whiteColor] forState:(UIControlStateSelected)];
        button.layer.cornerRadius = button.height / 2;
        button.clipsToBounds = YES;
        [button setImage:[[UIImage alloc] init] forState:(UIControlStateNormal)];
        button.tag = 2000 + i;
        if (i == 10) {
            button.tag = 2000;
            [button setTitle:@"0" forState:(UIControlStateNormal)];
        }
        [button addTarget:self action:@selector(buttonAciton:) forControlEvents:(UIControlEventTouchUpInside)];
        [self addSubview:button];
        [self.buttonsArray addObject:button];
    }
}
- (void)buttonAciton:(UIButton *)sender{
    sender.selected = !sender.selected;
    if (sender.isSelected) {
        [self.selectedButtons addObject:sender];
        sender.backgroundColor = [UIColor colorWithHexString:@"9014ee"];
    }else{
        [self.selectedButtons removeObject:sender];
        sender.backgroundColor = [UIColor whiteColor];
    }
    if ([self.delegate respondsToSelector:@selector(gameGambleNumberChange)]) {
        [self.delegate gameGambleNumberChange];
    }
}
- (NSString *)resNumber{
    NSMutableString *res = [NSMutableString string];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"tag" ascending:YES];
    [self.selectedButtons sortUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]];
    for (UIButton *temp in self.selectedButtons) {
        [res appendFormat:@"%@", temp.titleLabel.text];
    }
    return res;
}
- (void)setNumbersSelected:(BOOL)selected{
    if (selected) {
        [self.selectedButtons removeAllObjects];
        [self.selectedButtons addObjectsFromArray:self.buttonsArray];
        for (UIButton *tempButton in self.buttonsArray) {
            tempButton.selected = YES;
            tempButton.backgroundColor = [UIColor colorWithHexString:@"9014ee"];
        }
        return;
    }
    [self.selectedButtons removeAllObjects];
    for (UIButton *tempButton in self.buttonsArray) {
        tempButton.selected = NO;
        tempButton.backgroundColor = [UIColor whiteColor];
    }
}
@end
