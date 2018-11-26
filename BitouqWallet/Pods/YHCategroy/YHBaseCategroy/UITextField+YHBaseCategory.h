//
//  UITextField+YHBaseCategory.h
//  TempDemo
//
//  Created by 赵一欢 on 2018/6/21.
//  Copyright © 2018年 zhaoyihuan. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol YHTextFieldDeleteDelegate <NSObject>
- (void)textFieldDidDeleteBackward:(UITextField *)textField;
@end
@interface UITextField (YHBaseCategory)
@property (nonatomic , weak) id<YHTextFieldDeleteDelegate> delegate;
@end
