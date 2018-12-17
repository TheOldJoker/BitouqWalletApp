//
//  BWForgetPasswordViewController.m
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/13.
//  Copyright © 2018 Joker. All rights reserved.
//

#import "BWForgetPasswordViewController.h"
#import "BWLoginCreateKeyRootModel.h"
@interface BWForgetPasswordViewController ()
@property (strong, nonatomic) IBOutlet UITextField *prikeyTextField;
@property (nonatomic, strong) BWLoginCreateKeyRootModel *loginRootModel;
@end

@implementation BWForgetPasswordViewController
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (void)viewDidLayoutSubviews{
    self.view.width = SCREEN_WIDTH;
    self.view.height = SCREEN_HEIGHT;
}
#pragma mark - func
//驗證私鑰
- (void)verifyPrivatekeyCompletion:(void (^ __nullable)(void))completion{
    [BWDataSource getPubkeyWithPrikey:self.prikeyTextField.text success:^(id  _Nonnull response) {
        self.loginRootModel = [BWLoginCreateKeyRootModel mj_objectWithKeyValues:response];
        if (self.loginRootModel.errorCode == 0) {
            BWUser *user = [[BWUser alloc] init];
            user.privatekey = self.loginRootModel.data.prikey;
            user.publickey = self.loginRootModel.data.pubkey;
            [BWUserManager shareManager].user = user;
        }else{
            [self showNetErrorMessageWithStatus:self.loginRootModel.status errorCode:self.loginRootModel.errorCode errorMessage:self.loginRootModel.errorMsg];
        }
        completion();
    } fail:^(NSError * _Nonnull error) {
        [self showServerError];
        completion();
    }];
}
#pragma mark - lazyload
#pragma mark - buttonAction
- (IBAction)backAction:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)leadAction:(UIButton *)sender {
    //1.如果為輸入privatekey則禁止導入操作
    if (stringIsEmpty(self.prikeyTextField.text)) {
        [self showWeakAlertWithString:@"輸入私鑰明文"];
        return;
    }
    if ([self.prikeyTextField.text isEqualToString:[BWUserManager shareManager].user.privatekey]) {
        //2.驗證私鑰
        [self showHUDWithAlert:@"正在驗證私鑰..."];
        [self verifyPrivatekeyCompletion:^{
            [self hiddenHUD];
            if (self.loginRootModel.errorCode == 0) {
                if ([self.delegate respondsToSelector:@selector(resetpassword)]) {
                    [self.delegate resetpassword];
                    [self dismissViewControllerAnimated:YES completion:nil];
                }
            }else{
                [self showWeakAlertWithString:@"無效的私鑰"];
            }
        }];
    }else{
        [self showWeakAlertWithString:@"無效的私鑰"];
//        [self showSystemAlertTitle:@"導入私鑰與當前私鑰不匹配" message:@"是否繼續" actionTitleArray:@[@"否",@"是"] colorTitle:nil withAction:^(NSInteger actionNumber) {
//            if (actionNumber == 1) {
//                [self verifyPrivatekeyCompletion:^{
//                    [self hiddenHUD];
//                    if (self.loginRootModel.errorCode == 0) {
//                        if ([self.delegate respondsToSelector:@selector(resetpassword)]) {
//                            [self.delegate resetpassword];
//                            [self dismissViewControllerAnimated:YES completion:nil];
//                        }
//                    }else{
//                        [self showWeakAlertWithString:@"無效的私鑰"];
//                    }
//                }];
//            }
//        } preferredStyle:(UIAlertControllerStyleAlert)];
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
