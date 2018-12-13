//
//  BWLoginLeadPrivatekeyViewController.m
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/2.
//  Copyright © 2018 Joker. All rights reserved.
//

#import "BWLoginLeadPrivatekeyViewController.h"
#import "BWLoginSuccessViewController.h"
#import "BWLoginCreateKeyRootModel.h"
@interface BWLoginLeadPrivatekeyViewController ()
@property (strong, nonatomic) IBOutlet UITextField *privatekeyTextField;
@property (nonatomic, strong) BWLoginCreateKeyRootModel *loginRootModel;
@end

@implementation BWLoginLeadPrivatekeyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)loginApp{
    //1.如果為輸入privatekey則禁止導入操作
    if (stringIsEmpty(self.privatekeyTextField.text)) {
        [self showWeakAlertWithString:@"輸入私鑰明文"];
        return;
    }
    //2.驗證私鑰
    [self showHUDWithAlert:@"正在驗證私鑰..."];
    [self verifyPrivatekeyCompletion:^{
        [self hiddenHUD];
        if (self.loginRootModel.errorCode == 0) {
            [self showLoginSuccessViewCongtroller];
        }else{
            [self showWeakAlertWithString:@"無效的私鑰"];
        }
    }];
}
- (void)showLoginSuccessViewCongtroller{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Login" bundle:nil];
    BWLoginSuccessViewController * vc = [storyBoard instantiateViewControllerWithIdentifier:@"loginSuccess"];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}
//驗證私鑰
- (void)verifyPrivatekeyCompletion:(void (^ __nullable)(void))completion{
    [BWDataSource getPubkeyWithPrikey:self.privatekeyTextField.text success:^(id  _Nonnull response) {
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
- (IBAction)loginAction:(UIButton *)sender {
    [self loginApp];
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
