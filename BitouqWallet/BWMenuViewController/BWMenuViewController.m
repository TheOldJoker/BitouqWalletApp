//
//  BWMenuViewController.m
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/11/28.
//  Copyright © 2018 Joker. All rights reserved.
//

#import "BWMenuViewController.h"

@interface BWMenuViewController ()

@end

@implementation BWMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor purpleColor];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
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
