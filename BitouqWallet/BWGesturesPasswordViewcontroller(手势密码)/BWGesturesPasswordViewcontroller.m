//
//  BWGesturesPasswordViewcontroller.m
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/12.
//  Copyright © 2018 Joker. All rights reserved.
//

#import "BWGesturesPasswordViewcontroller.h"
#import "YHGesturePasswordView.h"
@interface BWGesturesPasswordViewcontroller ()<YHGesturePasswordViewDelegate>
@property (strong, nonatomic) IBOutlet YHGesturePasswordView *mainGesturePasswordView;
@property (strong, nonatomic) IBOutlet UIButton *backButton;
@property (strong, nonatomic) IBOutlet UILabel *alertLabel;
@property (nonatomic, copy) NSString *tempPassword;

@end

@implementation BWGesturesPasswordViewcontroller

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mainGesturePasswordView.delegate = self;
    //创建密码
    if (self.gesturesPasswordType == BWGesturesPasswordTypeCreate) {
        self.backButton.hidden = YES;
        return;
    }
}
- (void)viewDidLayoutSubviews{
    self.view.width = SCREEN_WIDTH;
    self.view.height = SCREEN_HEIGHT;
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
            [self dismissViewControllerAnimated:YES completion:nil];
            return;
        }
        //驗證失敗
        self.alertLabel.text = @"兩次輸入密碼不同,請重新輸入";
        self.tempPassword = nil;
        return;
    }
    //验证手势
    if (self.gesturesPasswordType == BWGesturesPasswordTypeVerify) {
        if ([user.password isEqualToString:password]) {
            NSLog(@"验证成功");
        }
        return;
    }
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
