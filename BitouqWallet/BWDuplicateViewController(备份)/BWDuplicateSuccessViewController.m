//
//  BWDuplicateSuccessViewController.m
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/17.
//  Copyright © 2018 Joker. All rights reserved.
//

#import "BWDuplicateSuccessViewController.h"
#import "BWLoginCreateKeyRootModel.h"
@interface BWDuplicateSuccessViewController ()
@property (strong, nonatomic) IBOutlet UILabel *privatekeyLabel;
@property (strong, nonatomic) IBOutlet UIButton *nextButton;
@property (strong, nonatomic) BWLoginCreateKeyRootModel *mainData;
@end

@implementation BWDuplicateSuccessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.privatekeyLabel.text = [BWUserManager shareManager].user.privatekey;
}
- (IBAction)successAction:(UIButton *)sender {
    self.tabBarController.selectedIndex = 0;
    [self.navigationController popToRootViewControllerAnimated:NO];
}
- (IBAction)tapAction:(UITapGestureRecognizer *)sender {
    if (stringIsEmpty(self.privatekeyLabel.text)) {
        [self showWeakAlertWithString:@"未獲取私钥"];
        return;
    }
    UIPasteboard *pab = [UIPasteboard generalPasteboard];
    [pab setString:self.privatekeyLabel.text];
    if (pab == nil) {
        [self showWeakAlertWithString:@"複製失敗"];
    }else
    {
        [self showWeakAlertWithString:@"已複製"];
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
