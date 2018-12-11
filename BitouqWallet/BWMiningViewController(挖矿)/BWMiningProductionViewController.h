//
//  BWMiningProductionViewController.h
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/10.
//  Copyright © 2018 Joker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BWMiningOwnerRootModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface BWMiningProductionViewController : UIViewController
@property (nonatomic, strong)BWMiningOwnerRootModel *miningOwnerRootModel;
- (void)loadData;
@end

NS_ASSUME_NONNULL_END
