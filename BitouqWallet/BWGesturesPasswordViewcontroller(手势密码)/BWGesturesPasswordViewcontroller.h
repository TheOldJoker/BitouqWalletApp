//
//  BWGesturesPasswordViewcontroller.h
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/12.
//  Copyright © 2018 Joker. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger , BWGesturesPasswordType) {
    BWGesturesPasswordTypeCreate,//创建密码
    BWGesturesPasswordTypeVerify//验证密码
};
NS_ASSUME_NONNULL_BEGIN

@interface BWGesturesPasswordViewcontroller : UIViewController
@property (nonatomic , assign) BWGesturesPasswordType gesturesPasswordType;
@end

NS_ASSUME_NONNULL_END
