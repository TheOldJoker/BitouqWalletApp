//
//  NSString+BWStringCategory.m
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/6.
//  Copyright © 2018 Joker. All rights reserved.
//

#import "NSString+BWStringCategory.h"
NSString *const accurateTime = @"yyyy-MM-dd-HH-mm-ss";
@implementation NSString (BWStringCategory)
- (BOOL)isKey{
    if (self.length == 44) {
        return YES;
    }
    return NO;
}
- (NSString *)getSeverUrl
{
    return [NSString stringWithFormat:@"%@%@",DOMAINSTRING,self];
}
- (NSArray *)componentsSeparatedByCharset{
    NSMutableString *targetString = [NSMutableString stringWithString:self];
    NSMutableArray *tagArray = [NSMutableArray array];
    NSInteger count = self.length;
    for (int i = 0; i < count; i++) {
        [tagArray addObject:[targetString substringWithRange:(NSMakeRange(0, 1))]];
        targetString = [NSMutableString stringWithFormat:@"%@", [targetString substringFromIndex:1]];
    }
    return tagArray;
}
- (NSString *)getTime{
    NSString *targetString = [self getConventionTime];
    NSArray *timesArray = [targetString componentsSeparatedByString:@"-"];
    if (timesArray.count == 0) {
        return @"";
    }
    //年月日时分秒
    NSMutableString *resString = [NSMutableString string];
    NSInteger month = [timesArray[1] integerValue];
    NSString *resMonth = @"";
    switch (month) {
        case 1:
            resMonth = @"Jan";
            break;
        case 2:
            resMonth = @"Feb";
            break;
        case 3:
            resMonth = @"Mar";
            break;
        case 4:
            resMonth = @"Apr";
            break;
        case 5:
            resMonth = @"May";
            break;
        case 6:
            resMonth = @"June";
            break;
        case 7:
            resMonth = @"July";
            break;
        case 8:
            resMonth = @"Aug";
            break;
        case 9:
            resMonth = @"Sept";
            break;
        case 10:
            resMonth = @"Oct";
            break;
        case 11:
            resMonth = @"Nov";
            break;
        case 12:
            resMonth = @"Dec";
            break;
        default:
            break;
    }
    [resString appendString:[NSString stringWithFormat:@"%@ %@ %@ ",resMonth,timesArray[2],timesArray[0]]];
    NSInteger hour = [timesArray[3] integerValue];
    if (hour > 12) {
        [resString appendString:[NSString stringWithFormat:@"%02ld:%@ PM",(long)(hour - 12),timesArray[4]]];
    }else{
        [resString appendString:[NSString stringWithFormat:@"%02ld:%@ AM",(long)hour,timesArray[4]]];
    }
    return resString;
}
- (NSString *)getConventionTime{
    NSInteger timeIn = [self integerValue] / 1000;
    
    if (timeIn != 0) {
        NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:timeIn];
        NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:accurateTime];
        return [formatter stringFromDate:confromTimesp];
    }
    return @"";
}
@end
