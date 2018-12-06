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
//    self.privatekeyLabel.text = @"127Ktr61h2GtWS22MzJGApX8F73CRpAyjKp2yKh3weXo";
//    BWUser *user = [[BWUser alloc] init];
//    user.privatekey = self.privatekeyLabel.text;
//    [BWUserManager shareManager].user = user;
}
- (void)setValue{
    
}
- (void)loadData{
    [self showHUDWithAlert:@""];
    [BWDataSource getKeySuccess:^(id  _Nonnull response) {
        [self hiddenHUD];
//        self.mainData = [BWLoginCreateKeyRootModel ]
        NSLog(@"%@",[self getMyNeedJsonWithDict:response]);
    } fail:^(NSError * _Nonnull error) {
        [self hiddenHUD];
        NSLog(@"%@",error);
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
