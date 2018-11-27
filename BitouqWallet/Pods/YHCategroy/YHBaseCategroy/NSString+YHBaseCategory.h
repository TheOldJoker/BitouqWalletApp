//
//  NSString+YHBaseCategory.h
//  TempDemo
//
//  Created by 赵一欢 on 2018/6/21.
//  Copyright © 2018年 zhaoyihuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (YHBaseCategory)
- (NSString *)sha1;
    /**
     *  判断是否数字
     *
     *  @return 是否为数字
     */
- (BOOL)isNumber;
    
    /**
     判断电话号码
     
     @return 是否为电话号码
     */
- (BOOL)isPhoneNumber;
    
    /**
     判断昵称
     
     @return 是否为昵称
     */
- (BOOL)isUserName;
    //去掉url参数
- (NSString *)discardUrlParameters;
    //获取url参数
- (NSMutableDictionary *)getURLParameters;
    //jsonString转字典
- (NSDictionary *)dictionaryConversion;
@end
