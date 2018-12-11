//
//  BWNumberSelectedView.m
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/10.
//  Copyright © 2018 Joker. All rights reserved.
//

#import "BWNumberSelectedView.h"
@interface BWNumberSelectedView()
@property (nonatomic, strong) UIButton *mainButton;
@property (nonatomic, strong) NSMutableArray *buttonsArray;
@property (nonatomic, strong) NSMutableArray *selectedButtons;
@end
@implementation BWNumberSelectedView
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
- (UIButton *)mainButton{
    if (!_mainButton) {
        _mainButton = [[UIButton alloc] initWithFrame:(CGRectMake(0, 0, self.height, self.height))];
        _mainButton.layer.cornerRadius = self.height / 2;
        _mainButton.clipsToBounds = YES;
        [_mainButton addTarget:self action:@selector(mainButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [self addSubview:_mainButton];
    }
    return _mainButton;
}
- (void)initSubViews{
    for (int i = 1; i < 11; i++) {
        UIButton *button = [[UIButton alloc] initWithFrame:(CGRectMake((self.mainButton.width + 2) * i, 0, self.mainButton.width, self.mainButton.width))];
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
}
- (void)mainButtonAction:(UIButton *)sender{
    
    if (self.selectedButtons.count == 10) {
        sender.selected = YES;
    }
    sender.selected = !sender.selected;
    if (sender.isSelected) {
        [self.selectedButtons removeAllObjects];
        [self.selectedButtons addObjectsFromArray:self.buttonsArray];
        for (UIButton *tempButton in self.buttonsArray) {
            tempButton.selected = YES;
            tempButton.backgroundColor = [UIColor colorWithHexString:@"9014ee"];
        }
    }else{
        [self.selectedButtons removeAllObjects];
        for (UIButton *tempButton in self.buttonsArray) {
            tempButton.selected = NO;
            tempButton.backgroundColor = [UIColor whiteColor];
        }
    }
}
- (void)setMainColor:(UIColor *)mainColor{
    _mainColor = mainColor;
    self.mainButton.backgroundColor = mainColor;
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
        self.mainButton.selected = YES;
        [self.selectedButtons removeAllObjects];
        [self.selectedButtons addObjectsFromArray:self.buttonsArray];
        for (UIButton *tempButton in self.buttonsArray) {
            tempButton.selected = YES;
            tempButton.backgroundColor = [UIColor colorWithHexString:@"9014ee"];
        }
        return;
    }
    self.mainButton.selected = NO;
    [self.selectedButtons removeAllObjects];
    for (UIButton *tempButton in self.buttonsArray) {
        tempButton.selected = NO;
        tempButton.backgroundColor = [UIColor whiteColor];
    }
}
- (void)setTargetNumberSelectedWithString:(NSString *)numberString{
    if ([numberString isNumber] == NO) {
        return;
    }
    NSArray *tagNumbers = [numberString componentsSeparatedByCharset];
    //全部选中
    if (tagNumbers.count == 10) {
        [self setNumbersSelected:YES];
        return;
    }
    //全部未选中
    if (tagNumbers.count == 0) {
        [self setNumbersSelected:NO];
        return;
    }
    //部分选中
    [self setNumbersSelected:NO];
    for (NSString *temp in tagNumbers) {
        NSInteger index = [temp integerValue];
        if (index == 0) {
            index = 9;
        }else{
            index -= 1;
        }
        UIButton *tempButton = self.buttonsArray[index];
        tempButton.selected = YES;
        tempButton.backgroundColor = [UIColor colorWithHexString:@"9014ee"];
        [self.selectedButtons addObject:tempButton];
    }
}
@end
