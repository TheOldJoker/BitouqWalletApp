//
//  UIBarButtonItem+YHBaseCategory.h
//  TempDemo
//
//  Created by 赵一欢 on 2018/6/21.
//  Copyright © 2018年 zhaoyihuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (YHBaseCategory)
    /**
     *  初始化导航栏取消按钮
     */
- (nullable UIBarButtonItem *)initCancelButtonWithTarget:(nullable id)target action:(nullable SEL)action;
    /**
     *  初始化导航栏通用返回按钮
     */
- (nullable UIBarButtonItem *)initBackButtonWithTarget:(nullable id)target action:(nullable SEL)action;
    /**
     *  初始化导航栏黑色返回按钮
     */
- (nullable UIBarButtonItem *)initWhiteBackButtonWithTarget:(nullable id)target action:(nullable SEL)action;
    
    //- (nullable UIBarButtonItem *)initGoodsInfoBackButtonWithTarget:(nullable id)target action:(nullable SEL)action;
    /**
     *  初始化导航栏消息按钮
     */
- (nullable UIBarButtonItem *)initMessageButtonWithTarget:(nullable id)target action:(nullable SEL)action;
@end
