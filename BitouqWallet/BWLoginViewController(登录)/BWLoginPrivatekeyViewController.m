//
//  BWLoginPrivatekeyViewController.m
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/2.
//  Copyright © 2018 Joker. All rights reserved.
//

#import "BWLoginPrivatekeyViewController.h"
#import "BWLoginCreateKeyRootModel.h"
@interface BWLoginPrivatekeyViewController ()
@property (strong, nonatomic) IBOutlet UILabel *privatekeyLabel;
@property (strong, nonatomic) BWLoginCreateKeyRootModel *mainData;
@end

@implementation BWLoginPrivatekeyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
}
- (void)setValue{
    self.privatekeyLabel.text = self.mainData.data.prikey;
    BWUser *user = [[BWUser alloc] init];
    user.privatekey = self.mainData.data.prikey;
    user.publickey = self.mainData.data.pubkey;
    [BWUserManager shareManager].user = user;
}
- (void)loadData{
    [self showHUDWithAlert:LOADING_STRING];
    [BWDataSource getKeySuccess:^(id  _Nonnull response) {
        [self hiddenHUD];
        self.mainData = [BWLoginCreateKeyRootModel mj_objectWithKeyValues:response];
        if (self.mainData.errorCode == 0) {
            [self setValue];
        }else{
            [self showNetErrorMessageWithStatus:self.mainData.status errorCode:self.mainData.errorCode errorMessage:self.mainData.errorMsg];
        }
    } fail:^(NSError * _Nonnull error) {
        [self hiddenHUD];
        [self showServerError];
    }];
}
-(IBAction)unwindSegue:(UIStoryboardSegue *)sender{
    
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
