//
//  NSFileManager+YHBaseCategory.m
//  TempDemo
//
//  Created by 赵一欢 on 2018/6/21.
//  Copyright © 2018年 zhaoyihuan. All rights reserved.
//

#import "NSFileManager+YHBaseCategory.h"

@implementation NSFileManager (YHBaseCategory)
    //文件是否存在
+ (BOOL)fileExistInPath:(NSString *)path{
    if (path == nil) {
        return NO;
    }
    return [[NSFileManager defaultManager] fileExistsAtPath:path];
}
    //目录是否存在
+ (BOOL)directoryExistInPat:(NSString *)path{
    BOOL isDirecotry = NO;
    if (![[NSFileManager defaultManager] fileExistsAtPath:path isDirectory:&isDirecotry] || !isDirecotry){
        isDirecotry = NO;
    }
    return isDirecotry;
}
    //创建目录
+ (BOOL)createDirectory:(NSString *)path{
    BOOL success = YES;
    NSError * error = nil;
    if (![self directoryExistInPat:path]) {
        if (![[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:&error]
            || error != nil) {
            success = NO;
        }
    }
    return success;
}
+ (BOOL)deleteFile:(NSString*)path
    {
        NSError *error = nil;
        BOOL bRet = [[NSFileManager defaultManager] removeItemAtPath:path error:&error];
        if (error) {
            NSLog(@"%@",error);
        }
        return bRet;
    }
+ (BOOL)saveData:(NSData *)data filePath:(NSString *)filePath{
    
    if (![self createDirectory:[filePath stringByDeletingLastPathComponent]]) {
        return NO;
    }
    
    return [data writeToFile:filePath atomically:YES];
}
+ (UIImage *)getImageWithFilePath:(NSString *)filePath{
    if (![self fileExistInPath:filePath]) {
        return nil;
    }
    return [UIImage imageWithContentsOfFile:filePath];
}
@end
