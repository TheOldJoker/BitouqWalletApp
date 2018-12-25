//
//  BWMenuViewController.m
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/11/28.
//  Copyright © 2018 Joker. All rights reserved.
//

#import "BWMenuViewController.h"
#import "BWMenuButton.h"
@interface BWMenuViewController ()
@property (strong, nonatomic) IBOutlet BWMenuButton *walletButton;
@property (strong, nonatomic) IBOutlet BWMenuButton *starsButton;
@property (strong, nonatomic) IBOutlet BWMenuButton *vicOrDevButton;
@property (strong, nonatomic) IBOutlet BWMenuButton *miningButton;
@property (strong, nonatomic) IBOutlet BWMenuButton *recordButton;
@property (strong, nonatomic) IBOutlet BWMenuButton *deuplicateButton;
@property (strong, nonatomic) IBOutlet BWMenuButton *rlueButton;
@property (nonatomic, strong) UILabel *bottomLabel;
@property (strong, nonatomic) NSArray *buttonArray;
@end

@implementation BWMenuViewController
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    if (self.bottomLabel == nil) {
        
        self.bottomLabel = [[UILabel alloc] initWithFrame:(CGRectMake(60, SCREEN_HEIGHT- 100, 163, 40))];
        [self.bottomLabel configWithTextColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:11.f] textAlignment:(NSTextAlignmentLeft) backgroundColor:nil];
        self.bottomLabel.text = @"Bitouq Republic Technology\nWallet oasis 1.0";
        self.bottomLabel.numberOfLines = 2;
        [self.view addSubview:self.bottomLabel];
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initSubViews];
    BWMenuButton *temp = self.buttonArray[self.selectedIndex];
    temp.isSelected = YES;
}
- (void)initSubViews{
    self.walletButton.customTitle = @"錢包";
    self.starsButton.customTitle = @"BRTStars";
    self.vicOrDevButton.customTitle = @"勝負手";
    self.miningButton.customTitle = @"挖礦";
    self.recordButton.customTitle = @"交易記錄";
    self.deuplicateButton.customTitle = @"備份錢包";
    self.rlueButton.customTitle = @"規則";
    self.buttonArray = @[self.walletButton,self.starsButton,self.vicOrDevButton,self.miningButton,self.recordButton,self.deuplicateButton,self.rlueButton];
    for (BWMenuButton *temp in self.buttonArray) {
        temp.isSelected = NO;
    }
}
- (IBAction)menuAction:(BWMenuButton *)sender {
    if ([self.delegate respondsToSelector:@selector(menuSelectedIndex:)]) {
        [self.delegate menuSelectedIndex:sender.tag - 2001];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
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
