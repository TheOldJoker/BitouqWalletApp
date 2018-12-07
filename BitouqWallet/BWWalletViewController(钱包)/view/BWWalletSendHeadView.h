//
//  BWWalletSendHeadView.h
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/5.
//  Copyright © 2018 Joker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BWWalletSendModel.h"
NS_ASSUME_NONNULL_BEGIN
@protocol BWWalletSendHeadViewDelegate <NSObject>

- (void)walletSendHeadReloadDataAciton;

@end
@interface BWWalletSendHeadView : UIView
@property (nonatomic, weak) id<BWWalletSendHeadViewDelegate> delegate;
@property (nonatomic, strong) BWWalletSendModel *mainModel;
@property (nonatomic, strong) UITextField *getAddressTextField;
@property (nonatomic, strong) UITextField *moneyTextField;
@property (nonatomic, strong) UITextField *miningTextFiled;
@property (nonatomic, strong) UIButton *sendButton;//發送按鈕
@property (nonatomic, strong) UIButton *codeButton;//二維碼按鈕
- (void)initSubviews;
@end

NS_ASSUME_NONNULL_END
