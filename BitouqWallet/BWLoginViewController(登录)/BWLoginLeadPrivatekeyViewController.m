//
//  BWLoginLeadPrivatekeyViewController.m
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/2.
//  Copyright © 2018 Joker. All rights reserved.
//

#import "BWLoginLeadPrivatekeyViewController.h"
#import "BWLoginSuccessViewController.h"
@interface BWLoginLeadPrivatekeyViewController ()
@property (strong, nonatomic) IBOutlet UITextField *privatekeyTextField;

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
        BWUser *user = [[BWUser alloc] init];
        user.privatekey = self.privatekeyTextField.text;
        [BWUserManager shareManager].user = user;
        [self hiddenHUD];
        [self showLoginSuccessViewCongtroller];
    }];
}
- (void)showLoginSuccessViewCongtroller{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Login" bundle:nil];
    BWLoginSuccessViewController * vc = [storyBoard instantiateViewControllerWithIdentifier:@"loginSuccess"];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}
//與服務器交互,驗證私鑰
- (void)verifyPrivatekeyCompletion:(void (^ __nullable)(void))completion{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        completion();
    });
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
