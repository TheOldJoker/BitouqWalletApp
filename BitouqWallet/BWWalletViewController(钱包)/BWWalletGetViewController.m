//
//  BWWalletGetViewController.m
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/4.
//  Copyright © 2018 Joker. All rights reserved.
//

#import "BWWalletGetViewController.h"
#import <Photos/Photos.h>
@interface BWWalletGetViewController ()
@property (nonatomic, strong) UIImageView *codeImageView;
@property (nonatomic, strong) UIButton *saveCodeButton;
@property (nonatomic, strong) UILabel *publickeyLabel;
@property (nonatomic, strong) UIButton *duplicateButton;
@property (nonatomic, strong) UIView *cutline;
@property (nonatomic, strong) UILabel *explianLabel;
@end

@implementation BWWalletGetViewController
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self loadData];
}
- (void)viewDidLoad {
    [super viewDidLoad];
}
#pragma mark - func
- (void)loadData{
    self.codeImageView.image = [UIImage imageNamed:@"wallet_code"];
    self.explianLabel.text = @"請保管好您的接收地址，它將用於接收代幣，您的朋友可以通過向網絡發出請求向您的地址進行轉賬，您將通過此地址獲得代幣。請確認地址的完整性和正確性，否則代幣將丟失在網絡中。同時您可以使用二維碼進行接收代幣。";
    [self.explianLabel reSetHeight];
}
#pragma mark - lazyload
- (UILabel *)explianLabel{
    if (!_explianLabel) {
        _explianLabel = [[UILabel alloc] initWithFrame:(CGRectMake(26, self.cutline.bottom + 14, self.view.width - 52, 0))];
        [_explianLabel configWithTextColor:[UIColor grayColor] font:[UIFont systemFontOfSize:15] textAlignment:(NSTextAlignmentCenter) backgroundColor:nil];
        _explianLabel.numberOfLines = 0;
        [self.view addSubview:_explianLabel];
    }
    return _explianLabel;
}
- (UIView *)cutline{
    if (!_cutline) {
        _cutline = [[UIView alloc] initWithFrame:(CGRectMake(23, self.publickeyLabel.bottom + 17, self.view.width - 46, 2))];
        _cutline.backgroundColor = [UIColor colorWithHexString:@"d7d8da"];
        [self.view addSubview:_cutline];
    }
    return _cutline;
}
- (UILabel *)publickeyLabel{
    if (!_publickeyLabel) {
        _publickeyLabel = [[UILabel alloc] initWithFrame:(CGRectMake((self.view.width - 275) / 2, self.saveCodeButton.bottom + 27, 275, 42))];
        [_publickeyLabel configWithTextColor:[UIColor blackColor] font:[UIFont systemFontOfSize:15] textAlignment:(NSTextAlignmentCenter) backgroundColor:nil];
        _publickeyLabel.numberOfLines = 2;
        [self.view addSubview:_publickeyLabel];
    }
    return _publickeyLabel;
}
- (UIButton *)saveCodeButton{
    if (!_saveCodeButton) {
        _saveCodeButton = [[UIButton alloc] initWithFrame:(CGRectMake((self.view.width - 30) / 2, self.codeImageView.bottom + 25, 30, 30))];
        [_saveCodeButton setImage:[UIImage imageNamed:@"wallet_get_save_code"] forState:(UIControlStateNormal)];
        [_saveCodeButton addTarget:self action:@selector(saveCodeAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [self.view addSubview:_saveCodeButton];
    }
    return _saveCodeButton;
}
- (UIImageView *)codeImageView{
    if (!_codeImageView) {
        _codeImageView = [[UIImageView alloc] initWithFrame:(CGRectMake((self.view.width - 118) / 2, 29, 118, 118))];
        _codeImageView.layer.shadowColor = [UIColor colorWithHexString:@"DCDCDC"].CGColor;
        _codeImageView.layer.shadowOffset = CGSizeMake(2.0, 2.0);
        _codeImageView.layer.shadowOpacity = YES;
        _codeImageView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_codeImageView];
    }
    return _codeImageView;
}
#pragma mark - buttonAction
- (void)saveCodeAction:(UIButton *)sender{
    if (self.codeImageView.image == nil) {
        return;
    }
    [self showHUDWithAlert:@"正在保存二維碼到相冊"];
    [[PHPhotoLibrary sharedPhotoLibrary]performChanges:^{
        [PHAssetChangeRequest creationRequestForAssetFromImage:self.codeImageView.image];
    } completionHandler:^(BOOL success, NSError * _Nullable error) {
        if (error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self hiddenHUD];
                [self showWeakAlertWithString:@"保存失敗"];
            });
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self hiddenHUD];
                [self showWeakAlertWithString:@"保存成功"];
            });
            
        }
    }];
}
@end
