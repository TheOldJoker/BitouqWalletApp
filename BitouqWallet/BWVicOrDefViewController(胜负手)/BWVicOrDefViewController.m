//
//  BWVicOrDefViewController.m
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/11/27.
//  Copyright © 2018 Joker. All rights reserved.
//

#import "BWVicOrDefViewController.h"
#import "BWDicelastWinerRootModel.h"
@interface BWVicOrDefViewController ()
@property (nonatomic, strong) BWDicelastWinerRootModel *diceRootModel;
@end

@implementation BWVicOrDefViewController
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self loadData];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"勝負手";
    [self initMenuNav];
}
- (void)loadData{
    [BWDataSource getLastDiceWinerSuccess:^(id  _Nonnull response) {
        self.diceRootModel = [BWDicelastWinerRootModel mj_objectWithKeyValues:response];
        if (self.diceRootModel.errorCode == 0) {
            
        }else{
            
        }
    } fail:^(NSError * _Nonnull error) {
        [self showServerError];
    }];
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
