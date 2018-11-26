//
//  NSString+YHBaseCategory.m
//  TempDemo
//
//  Created by 赵一欢 on 2018/6/21.
//  Copyright © 2018年 zhaoyihuan. All rights reserved.
//

#import "NSString+YHBaseCategory.h"
#import <CommonCrypto/CommonDigest.h>
@implementation NSString (YHBaseCategory)
- (NSString *)sha1
    {
        NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
        uint8_t digest[CC_SHA1_DIGEST_LENGTH];
        
        CC_SHA1(data.bytes, (int)data.length, digest);
        
        NSMutableString *output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
        
        for (int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++)
        {
            [output appendFormat:@"%02x", digest[i]];
        }
        
        return output;
    }
    
- (BOOL)isNumber
    {
        NSString * regex = @"^[0-9]*$";
        NSPredicate * pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@" , regex];
        return [pred evaluateWithObject:self];
    }
- (BOOL)isPhoneNumber
    {
        
        NSString * regex = @"^[1][3,4,5,6,7,8,9][0-9]{9}$";
        NSPredicate * pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@" , regex];
        
        return [pred evaluateWithObject:self];
    }
- (BOOL)isUserName
    {
        NSString * regex = @"^[\u4E00-\u9FA5A-Za-z0-9_]+$";
        NSPredicate * pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
        
        return [pred evaluateWithObject:self];
    }
- (NSMutableDictionary *)getURLParameters {
    
    // 查找参数
    NSRange range = [self rangeOfString:@"?"];
    if (range.location == NSNotFound) {
        return nil;
    }
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    // 截取参数
    NSString *parametersString = [self substringFromIndex:range.location + 1];
    
    // 判断参数是单个参数还是多个参数
    if ([parametersString containsString:@"&"]) {
        
        // 多个参数，分割参数
        NSArray *urlComponents = [parametersString componentsSeparatedByString:@"&"];
        
        for (NSString *keyValuePair in urlComponents) {
            // 生成Key/Value
            NSArray *pairComponents = [keyValuePair componentsSeparatedByString:@"="];
            NSString *key = [pairComponents.firstObject stringByRemovingPercentEncoding];
            NSString *value = [pairComponents.lastObject stringByRemovingPercentEncoding];
            
            // Key不能为nil
            if (key == nil || value == nil) {
                continue;
            }
            
            id existValue = [params valueForKey:key];
            
            if (existValue != nil) {
                
                // 已存在的值，生成数组
                if ([existValue isKindOfClass:[NSArray class]]) {
                    // 已存在的值生成数组
                    NSMutableArray *items = [NSMutableArray arrayWithArray:existValue];
                    [items addObject:value];
                    
                    [params setValue:items forKey:key];
                } else {
                    
                    // 非数组
                    [params setValue:@[existValue, value] forKey:key];
                }
                
            } else {
                
                // 设置值
                [params setValue:value forKey:key];
            }
        }
    } else {
        // 单个参数
        
        // 生成Key/Value
        NSArray *pairComponents = [parametersString componentsSeparatedByString:@"="];
        
        // 只有一个参数，没有值
        if (pairComponents.count == 1) {
            return nil;
        }
        
        // 分隔值
        NSString *key = [pairComponents.firstObject stringByRemovingPercentEncoding];
        NSString *value = [pairComponents.lastObject stringByRemovingPercentEncoding];
        
        // Key不能为nil
        if (key == nil || value == nil) {
            return nil;
        }
        
        // 设置值
        [params setValue:value forKey:key];
    }
    
    return params;
}
- (NSString *)discardUrlParameters {
    // 查找参数
    NSRange range = [self rangeOfString:@"?"];
    if (range.location == NSNotFound) {
        return self;
    }
    return [self substringToIndex:range.location];
}
- (NSDictionary *)dictionaryConversion {
    if (self == nil) {
        return nil;
    }
    NSData *jsonData = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&err];
    
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}
@end
