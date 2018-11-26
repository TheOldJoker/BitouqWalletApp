//
//  NSFileManager+YHBaseCategory.h
//  TempDemo
//
//  Created by 赵一欢 on 2018/6/21.
//  Copyright © 2018年 zhaoyihuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSFileManager (YHBaseCategory)
+ (BOOL)saveData:(NSData *)data filePath:(NSString *)filePath;
+ (UIImage *)getImageWithFilePath:(NSString *)filePath;
@end
