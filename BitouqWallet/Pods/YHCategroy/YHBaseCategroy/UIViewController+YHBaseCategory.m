//
//  UIViewController+YHBaseCategory.m
//  TempDemo
//
//  Created by 赵一欢 on 2018/6/21.
//  Copyright © 2018年 zhaoyihuan. All rights reserved.
//

#import "UIViewController+YHBaseCategory.h"

@implementation UIViewController (YHBaseCategory)
- (void)showTextFieldAlertWithTextContent:(NSString *)textContent title:(NSString *)title message:(NSString *)message actionTitleArray:(NSArray *)actionArray valueBlock:(ValueActionBlock)valueBlok{
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.text = textContent;
    }];
    UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:actionArray[0] style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertController addAction:cancelAction];
    
    UIAlertAction * confirmAction = [UIAlertAction actionWithTitle:actionArray[1] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UITextField * textField = alertController.textFields[0];
        if (textField.text) {
            valueBlok(textField.text);
        }
    }];
    [alertController addAction:confirmAction];
    [self presentViewController:alertController animated:YES completion:nil];
    
}
- (void)showSystemAlertTitle:(NSString *)title message:(NSString *)message actionTitleArray:(NSArray *)actionArray colorTitle:(NSArray *)colorTitleArray withAction:(AlertActionBlock)alertAction preferredStyle:(UIAlertControllerStyle)preferredStyle
    {
        UIAlertController * alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:preferredStyle];
        //添加按钮
        if (actionArray && actionArray.count) {
            for (NSInteger i = 0; i < actionArray.count; i ++) {
                UIAlertActionStyle alertActionStyle = UIAlertActionStyleDefault;
                if ([actionArray[i] isEqualToString:@"取消"]) {
                    alertActionStyle = UIAlertActionStyleCancel;
                }
                for (NSString * colorTitle in colorTitleArray) {
                    if ([colorTitle isEqualToString:actionArray[i]]) {
                        alertActionStyle = UIAlertActionStyleDestructive;
                    }
                }
                UIAlertAction * buttonAction = [UIAlertAction actionWithTitle:actionArray[i] style:alertActionStyle handler:^(UIAlertAction * _Nonnull action) {
                    alertAction(i);
                }];
                [alertController addAction:buttonAction];
            }
        }
        [self presentViewController:alertController animated:YES completion:nil];
    }
- (void)logJsonWithDict:(id)response
    {
        if (response == nil) {
            return;
        }
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:response options:NSJSONWritingPrettyPrinted error:nil];
        NSLog(@"%@",[[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding]);
    }
- (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&err];
    
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}
@end
