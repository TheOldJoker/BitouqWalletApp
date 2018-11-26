//
//  UIViewController+YHBaseCategory.h
//  TempDemo
//
//  Created by 赵一欢 on 2018/6/21.
//  Copyright © 2018年 zhaoyihuan. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^AlertActionBlock)(NSInteger actionNumber);
typedef void (^ValueActionBlock)(NSString * resValue);
@interface UIViewController (YHBaseCategory)
//系统弹窗
- (void)showSystemAlertTitle:(NSString *)title message:(NSString *)message actionTitleArray:(NSArray *)actionArray colorTitle:(NSArray *)colorTitleArray withAction:(AlertActionBlock)alertAction preferredStyle:(UIAlertControllerStyle)preferredStyle;
- (void)showTextFieldAlertWithTextContent:(NSString *)textContent title:(NSString *)title message:(NSString *)message actionTitleArray:(NSArray *)actionArray valueBlock:(ValueActionBlock)valueBlok;
//打印Json
- (void)logJsonWithDict:(id)response;
//jsonString to dic
- (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;
@end
