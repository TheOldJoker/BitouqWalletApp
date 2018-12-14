//
//  BWGamePickerViewController.m
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/14.
//  Copyright © 2018 Joker. All rights reserved.
//

#import "BWGamePickerViewController.h"
@interface BWGamePickerViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>
@property (nonatomic, strong) UIPickerView *mainPickerView;
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, assign) NSInteger type;
@end

@implementation BWGamePickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.type = 1;
    self.dataArray = @[@"1星競猜",@"2星競猜",@"3星競猜",@"4星競猜",@"5星競猜",@"前置3星任選",@"前置3星雙殺",@"前置3星豹子"];
    [self.mainPickerView reloadAllComponents];
}
- (UIPickerView *)mainPickerView
{
    if (!_mainPickerView) {
        UIButton *sure = [[UIButton alloc] initWithFrame:(CGRectMake(0, 0, self.view.width, 44))];
        [sure setTitle:@"確定" forState:(UIControlStateNormal)];
        [sure setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
        sure.titleLabel.font = [UIFont systemFontOfSize:15.f];
        [sure addTarget:self action:@selector(sureAction:) forControlEvents:(UIControlEventTouchUpInside)];
        
        [self.view addSubview:sure];
        _mainPickerView = [[UIPickerView alloc] initWithFrame:(CGRectMake(0, 44, self.view.bounds.size.width, 200))];
        //设置代理
        _mainPickerView.delegate = self;
        _mainPickerView.dataSource = self;
        //显示选中标记
        _mainPickerView.showsSelectionIndicator = YES;
        [self.view addSubview:_mainPickerView];
    }
    return _mainPickerView;
}
#pragma mark Action
- (void)sureAction:(UIButton *)sender{
    if ([self.delegate respondsToSelector:@selector(changeGameType:)]) {
        [self.delegate changeGameType:self.type];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark UIPickerViewDataSource的回调
//决定pickerView有多少列
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
//决定pickerView有多少列表项
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.dataArray.count;
}
#pragma mark UIPickerViewDelegate的回调
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    UILabel * pickerLabel = (UILabel*)view;
    if (!pickerLabel){
        pickerLabel = [[UILabel alloc] init];
        pickerLabel.minimumScaleFactor = 0.2;
        pickerLabel.adjustsFontSizeToFitWidth = YES;
        [pickerLabel setTextAlignment:NSTextAlignmentCenter];
        [pickerLabel setBackgroundColor:[UIColor clearColor]];
        [pickerLabel setFont:[UIFont boldSystemFontOfSize:15]];
    }
    pickerLabel.text=[self pickerView:pickerView titleForRow:row forComponent:component];
    return pickerLabel;
}
//返回列表标题
- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component __TVOS_PROHIBITED
{
    return self.dataArray[row];
}
//选择结果
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.type = row + 1;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
