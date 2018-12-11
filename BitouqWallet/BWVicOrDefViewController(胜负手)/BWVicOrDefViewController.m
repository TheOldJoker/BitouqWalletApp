//
//  BWVicOrDefViewController.m
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/11/27.
//  Copyright © 2018 Joker. All rights reserved.
//

#import "BWVicOrDefViewController.h"
#import "BWDicelastWinerRootModel.h"
#import "BWDiceLastWinerView.h"
@interface BWVicOrDefViewController ()
@property (nonatomic, strong) BWDicelastWinerRootModel *diceRootModel;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *mainScrollTopValue;
@property (strong, nonatomic) IBOutlet UIScrollView *mainScorllView;
@property (nonatomic, strong) BWDiceLastWinerView *lastWinerView;
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
    self.mainScrollTopValue.constant = self.customNavTitleLabel.bottom;
    [self initSubViews];
}
#pragma mark - func
- (void)initSubViews{
    self.mainScorllView.contentSize = CGSizeMake(self.mainScorllView.width, self.lastWinerView.bottom);
}
- (void)loadData{
    [BWDataSource getLastDiceWinerSuccess:^(id  _Nonnull response) {
        self.diceRootModel = [BWDicelastWinerRootModel mj_objectWithKeyValues:response];
        if (self.diceRootModel.errorCode == 0) {
            self.lastWinerView.mainContentLabel.text = self.diceRootModel.data.result;
        }else{
            [self showNetErrorMessageWithStatus:self.diceRootModel.status errorCode:self.diceRootModel.errorCode errorMessage:self.diceRootModel.errorMsg];
        }
    } fail:^(NSError * _Nonnull error) {
        [self showServerError];
    }];
}
#pragma mark - lazyload
- (BWDiceLastWinerView *)lastWinerView{
    if (!_lastWinerView) {
        _lastWinerView = [[NSBundle mainBundle] loadNibNamed:@"BWDiceLastWinerView" owner:self options:nil].firstObject;
        _lastWinerView.frame = CGRectMake(0, 0, self.mainScorllView.width, self.mainScorllView.width / 375 * 416);
        [self.mainScorllView addSubview:_lastWinerView];
    }
    return _lastWinerView;
}
#pragma mark - buttonAction
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
