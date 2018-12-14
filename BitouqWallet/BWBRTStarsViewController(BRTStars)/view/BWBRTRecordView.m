//
//  BWBRTRecordView.m
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/14.
//  Copyright © 2018 Joker. All rights reserved.
//

#import "BWBRTRecordView.h"

@implementation BWBRTRecordView

- (void)initSubviewsWithTitle1:(NSString *)title1 title2:(NSString *)title2 title3:(NSString *)title3{
    float w = (self.width - 50) / 3;
    UILabel *label1 = [[UILabel alloc] initWithFrame:(CGRectMake(25, 10, w, 20))];
    [label1 configWithTextColor:[UIColor colorWithHexString:@"a3a9af"] font:[UIFont systemFontOfSize:13] textAlignment:(NSTextAlignmentLeft) backgroundColor:nil];
    label1.text = title1;
    [self addSubview:label1];
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:(CGRectMake(25 + w, 10, w, 20))];
    [label2 configWithTextColor:[UIColor colorWithHexString:@"a3a9af"] font:[UIFont systemFontOfSize:13] textAlignment:(NSTextAlignmentCenter) backgroundColor:nil];
    label2.text = title2;
    [self addSubview:label2];
    
    UILabel *label3 = [[UILabel alloc] initWithFrame:(CGRectMake(25 + w * 2, 10, w, 20))];
    [label3 configWithTextColor:[UIColor colorWithHexString:@"a3a9af"] font:[UIFont systemFontOfSize:13] textAlignment:(NSTextAlignmentRight) backgroundColor:nil];
    label3.text = title3;
    [self addSubview:label3];
}

@end
