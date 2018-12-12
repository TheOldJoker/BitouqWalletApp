//
//  YHGesturePasswordView.m
//  YHGesturesPassword
//
//  Created by 赵一欢 on 2018/12/12.
//  Copyright © 2018 Joker. All rights reserved.
//

#import "YHGesturePasswordView.h"
@interface YHGesturePasswordView()
@property (nonatomic, strong) NSMutableArray *selectedButtons;
@property (nonatomic, strong) NSMutableArray *buttons;
@property (nonatomic, assign) CGPoint currentPoint;
@end
@implementation YHGesturePasswordView
- (void)awakeFromNib{
    [super awakeFromNib];
    [self initSubviews];
}
#pragma mark - func
- (void)initSubviews{
    for (int i = 1; i < 10; i++) {
        UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
        button.userInteractionEnabled = NO;
        button.tag = 8000 + i;
        [button setImage:[UIImage imageNamed:@"gesturesButton_normal"] forState:(UIControlStateNormal)];
        [button setImage:[UIImage imageNamed:@"gesturesButton_normal"] forState:(UIControlStateSelected)];
        [self addSubview:button];
        [self.buttons addObject:button];
    }
}
- (void)layoutSubviews{
    [super layoutSubviews];
    //按钮宽高
    double btnWH = 80;
    //行列数
    NSInteger column = 3;
    double margin = (self.bounds.size.width - column * btnWH) / (column + 1);
    for (int i = 0 ; i < self.buttons.count; i++) {
        double x = margin + (margin + btnWH) * (i % column);
        double y = margin + (margin + btnWH) * (i / column);
        UIButton *temp = self.buttons[i];
        temp.frame = CGRectMake(x, y, btnWH, btnWH);
    }
}
//获取触碰点
- (CGPoint)getCurrentPoint:(NSSet *)touches{
    UITouch *touch = [touches anyObject];
    return [touch locationInView:self];
}
//是否触碰按钮
- (UIButton *)buttonContainsPoint:(CGPoint)point{
    for (UIButton *temp in self.buttons) {
        if (CGRectContainsPoint(temp.frame, point)) {
            return temp;
        }
    }
    return nil;
}
#pragma mark - touch
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGPoint currentPoint = [self getCurrentPoint:touches];
    UIButton *temp = [self buttonContainsPoint:currentPoint];
    if (temp && temp.selected == NO) {
        temp.selected = YES;
        [self.selectedButtons addObject:temp];
    }
}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGPoint currentPoint = [self getCurrentPoint:touches];
    UIButton *temp = [self buttonContainsPoint:currentPoint];
    self.currentPoint = currentPoint;
    if (temp && temp.selected == NO) {
        temp.selected = YES;
        [self.selectedButtons addObject:temp];
    }
    [self setNeedsDisplay];
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSMutableString *res = [NSMutableString string];
    for (UIButton *temp in self.selectedButtons) {
        temp.selected = NO;
        [res appendFormat:@"%ld",temp.tag - 8000];
    }
    [self.selectedButtons removeAllObjects];
    if ([self.delegate respondsToSelector:@selector(getGesturePassword:)]) {
        [self.delegate getGesturePassword:[res copy]];
    }
    [self setNeedsDisplay];
}
- (void)drawRect:(CGRect)rect{
    if (self.selectedButtons.count) {
        // 把所有选中按钮中心点连线
        UIBezierPath *path = [UIBezierPath bezierPath];
        for (int i = 0; i < self.selectedButtons.count; i ++) {
            UIButton *btn = self.selectedButtons[i];
            if (i == 0) {
                [path moveToPoint:btn.center]; // 设置起点
            } else {
                [path addLineToPoint:btn.center];
            }
        }
        [path addLineToPoint:self.currentPoint];
        path.lineWidth = 6;
        [[UIColor whiteColor] set];
        path.lineJoinStyle = kCGLineCapRound;
        path.lineCapStyle = kCGLineCapRound;
        [path stroke];
    }
}
#pragma mark - lazyload
- (NSMutableArray *)buttons{
    if (!_buttons) {
        _buttons = [NSMutableArray array];
    }
    return _buttons;
}
- (NSMutableArray *)selectedButtons{
    if (!_selectedButtons) {
        _selectedButtons = [NSMutableArray array];
    }
    return _selectedButtons;
}
@end
