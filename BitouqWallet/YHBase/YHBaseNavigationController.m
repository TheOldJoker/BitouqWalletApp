//
//  LPBaseNavigationController.m
//  LePao
//
//  Created by 赵一欢 on 2017/7/3.
//  Copyright © 2017年 zhaoyihuan. All rights reserved.
//

#import "YHBaseNavigationController.h"

@interface YHBaseNavigationController ()<UIGestureRecognizerDelegate>
@end

@implementation YHBaseNavigationController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self configNavigationBar];
    [self.navigationBar setBarTintColor:[UIColor whiteColor]];
    self.navigationBar.clipsToBounds = YES;
    [self setPop];
}
- (void)awakeFromNib
{
    [super awakeFromNib];
    [self configNavigationBar];
    [self.navigationBar setBarTintColor:[UIColor whiteColor]];
    self.navigationBar.clipsToBounds = YES;
    [self setPop];
}
- (void)setPop
{
    UIGestureRecognizer *ges = self.interactivePopGestureRecognizer;
    // 打印,输出了很多成员属性,其中最重要的成员属性是_targets,据此我们猜测,target可能存在于_targets里面,然后我们尝试一下
    NSArray *targetArray = [ges valueForKeyPath:@"_targets"];
    // 去掉数组
    id tempTarget = targetArray[0];
    // 获取target
    id target = [tempTarget valueForKeyPath:@"_target"];
    //消除警告
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    UIScreenEdgePanGestureRecognizer *pan = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:target action:@selector(handleNavigationTransition:)];
    pan.edges = UIRectEdgeLeft;
#pragma clang diagnostic pop
    [self.view addGestureRecognizer:pan];
    pan.delegate = self;
}
#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    if (self.viewControllers.count > 1) {
        // 非根控制器
        return YES;
    }else{
        // 跟控制器
        return NO;
    }
}
#pragma mark 自定义配置
- (void)configNavigationBar
{
    NSDictionary * titleTextAttribuesDict = @{
                                              NSFontAttributeName:[UIFont systemFontOfSize:17.f],
                                              NSForegroundColorAttributeName:[UIColor blackColor],
                                              };
    [[UINavigationBar appearance] setTitleTextAttributes:titleTextAttribuesDict];
}
- (void)backButtonClicked:(UIButton *)sender
{
    [self.visibleViewController.navigationController popViewControllerAnimated:YES];
}
- (void)setBackgroundColor:(UIColor *)backgroundColor
{
    [self.navigationBar setBarTintColor:backgroundColor];
}
- (void)setTitleColor:(UIColor *)titleColor
{
    _titleColor = titleColor;
    NSDictionary * titleTextAttribuesDict = @{
                                              NSFontAttributeName:_titleFont == nil ?[UIFont systemFontOfSize:17.f] : _titleFont,
                                              NSForegroundColorAttributeName:titleColor,
                                              };
    [[UINavigationBar appearance] setTitleTextAttributes:titleTextAttribuesDict];
}
- (void)setTitleFont:(UIFont *)titleFont
{
    _titleFont = titleFont;
    NSDictionary * titleTextAttribuesDict = @{
                                              NSFontAttributeName:titleFont,
                                              NSForegroundColorAttributeName:_titleColor == nil ? [UIColor blackColor] : _titleColor,
                                              };
    [[UINavigationBar appearance] setTitleTextAttributes:titleTextAttribuesDict];
}
- (NSString *)description
{
    return [NSString stringWithFormat:@"YHNavigationController"];
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [super pushViewController:viewController animated:animated];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
