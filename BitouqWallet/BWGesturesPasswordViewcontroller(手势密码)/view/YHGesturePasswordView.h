//
//  YHGesturePasswordView.h
//  YHGesturesPassword
//
//  Created by 赵一欢 on 2018/12/12.
//  Copyright © 2018 Joker. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol YHGesturePasswordViewDelegate <NSObject>

- (void)getGesturePassword:(NSString *)password;

@end
@interface YHGesturePasswordView : UIView
@property (nonatomic, weak) id<YHGesturePasswordViewDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
