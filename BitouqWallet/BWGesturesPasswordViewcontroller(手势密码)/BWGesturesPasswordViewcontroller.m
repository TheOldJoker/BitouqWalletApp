//
//  BWGesturesPasswordViewcontroller.m
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/12.
//  Copyright © 2018 Joker. All rights reserved.
//

#import "BWGesturesPasswordViewcontroller.h"
#import "YHGesturePasswordView.h"
#import <AudioToolbox/AudioToolbox.h>
@interface BWGesturesPasswordViewcontroller ()<YHGesturePasswordViewDelegate>
@property (strong, nonatomic) IBOutlet YHGesturePasswordView *mainGesturePasswordView;
@property (strong, nonatomic) IBOutlet UIButton *backButton;
@property (strong, nonatomic) IBOutlet UILabel *alertLabel;
@property (nonatomic, copy) NSString *tempPassword;
@property (strong, nonatomic) IBOutlet UILabel *topTitleLabel;
@property (strong, nonatomic) IBOutlet UIButton *forgetButton;

@end

@implementation BWGesturesPasswordViewcontroller

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mainGesturePasswordView.delegate = self;
    //创建密码
    if (self.gesturesPasswordType == BWGesturesPasswordTypeCreate) {
        self.backButton.hidden = YES;
        self.forgetButton.hidden = YES;
        self.topTitleLabel.text = @"請繪製手勢密碼";
        return;
    }
    //验证密码
    if (self.gesturesPasswordType == BWGesturesPasswordTypeVerify) {
        self.backButton.hidden = NO;
        self.forgetButton.hidden = NO;
        self.topTitleLabel.text = @"驗證手勢密碼";
        return;
    }
}
- (void)viewDidLayoutSubviews{
    self.view.width = SCREEN_WIDTH;
    self.view.height = SCREEN_HEIGHT;
}
- (IBAction)forgetAction:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(forgetThePassword)]) {
        [self.delegate forgetThePassword];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)backAciton:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark - YHGesturePasswordViewDelegate
- (void)getGesturePassword:(NSString *)password{
    BWUser *user = [BWUserManager shareManager].user;
    //创建密码
    if (self.gesturesPasswordType == BWGesturesPasswordTypeCreate) {
        //1.第一次输入密码
        if (stringIsEmpty(self.tempPassword)) {
            self.tempPassword = password;
            self.alertLabel.text = @"請再次輸入密碼";
            return;
        }
        //2.第二次驗證
        //驗證通過
        if ([self.tempPassword isEqualToString:password]) {
            [BWUserManager shareManager].user.password = password;
            [[BWUserManager shareManager] updateUser];
            [self showWeakAlertWithString:@"密碼設置成功"];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self dismissViewControllerAnimated:YES completion:nil];
            });
            return;
        }
        //驗證失敗
        self.alertLabel.text = @"兩次輸入密碼不同,請重新輸入";
        [self errorAlert];
        self.tempPassword = nil;
        return;
    }
    //验证手势
    if (self.gesturesPasswordType == BWGesturesPasswordTypeVerify) {
        if ([user.password isEqualToString:password]) {
            self.alertLabel.text = @"驗證成功";
            
            if ([self.delegate respondsToSelector:@selector(verifyPasswordSuccess)]) {
                [self.delegate verifyPasswordSuccess];
            }
            [self dismissViewControllerAnimated:YES completion:nil];
        }else{
            self.alertLabel.text = @"手勢密碼不正確";
            [self errorAlert];
        }
        return;
    }
}
- (void)errorAlert{
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    CABasicAnimation* shake = [CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    shake.fromValue = [NSNumber numberWithFloat:-5];
    shake.toValue = [NSNumber numberWithFloat:5];
    shake.duration = 0.1;//执行时间
    shake.autoreverses = YES; //是否重复
    shake.repeatCount = 2;//次数
    [self.alertLabel.layer addAnimation:shake forKey:@"shakeAnimation"];
    self.alertLabel.alpha = 1.0;
    [UIView animateWithDuration:2.0 delay:0.0 options:UIViewAnimationOptionCurveEaseIn | UIViewAnimationOptionAllowUserInteraction animations:^{
        //self.infoLabel.alpha = 0.0; //透明度变0则消失
    } completion:nil];
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
