//
//  BWGameArithmeticModel.m
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/15.
//  Copyright © 2018 Joker. All rights reserved.
//

#import "BWGameArithmeticModel.h"

@implementation BWGameArithmeticModel
- (NSString *)getBetWithGameType:(NSInteger)gameType{
    switch (gameType) {
            //1星競猜
        case 1:
        {
            return [NSString stringWithFormat:@"%ld",[self Star1WithNum1:self.num1.length num2:self.num2.length num3:self.num3.length num4:self.num4.length num5:self.num5.length]];
        }
            break;
            //2星競猜
        case 2:
        {
            return [NSString stringWithFormat:@"%ld",[self Star2WithNum1:self.num1.length num2:self.num2.length num3:self.num3.length num4:self.num4.length num5:self.num5.length]];
        }
            break;
            //3星競猜
        case 3:
        {
            return [NSString stringWithFormat:@"%ld",[self Star3WithNum1:self.num1.length num2:self.num2.length num3:self.num3.length num4:self.num4.length num5:self.num5.length]];
        }
            break;
            //4星競猜
        case 4:
        {
            return [NSString stringWithFormat:@"%ld",[self Star4WithNum1:self.num1.length num2:self.num2.length num3:self.num3.length num4:self.num4.length num5:self.num5.length]];
        }
            break;
            //5星競猜
        case 5:
        {
            return [NSString stringWithFormat:@"%ld",[self Star5WithNum1:self.num1.length num2:self.num2.length num3:self.num3.length num4:self.num4.length num5:self.num5.length]];
        }
            break;
            //前置3星任選
        case 6:
        {
#pragma mark 前置3星任選
            if (self.specialNum.length < 3) {
                return @"0";
            }
            NSDictionary *dic = @{
                                  @"3":@"1",
                                  @"4":@"4",
                                  @"5":@"10",
                                  @"6":@"20",
                                  @"7":@"35",
                                  @"8":@"56",
                                  @"9":@"84",
                                  @"10":@"120",
                                  };
            return [dic valueForKey:[NSString stringWithFormat:@"%ld",self.specialNum.length]];
        }
            break;
            //前置3星雙殺
        case 7:
        {
#pragma mark 前置3星雙殺
            if (self.specialNum.length < 2) {
                return @"0";
            }
            NSDictionary *dic = @{
                                  @"2":@"2",
                                  @"3":@"6",
                                  @"4":@"12",
                                  @"5":@"20",
                                  @"6":@"30",
                                  @"7":@"42",
                                  @"8":@"56",
                                  @"9":@"72",
                                  @"10":@"90",
                                  };
            return [dic valueForKey:[NSString stringWithFormat:@"%ld",self.specialNum.length]];
        }
            break;
            //前置3星豹子
        case 8:
        {
#pragma mark 前置3星雙殺
            if (self.specialNum.length < 1) {
                return @"0";
            }
            NSDictionary *dic = @{
                                  @"1":@"1",
                                  @"2":@"2",
                                  @"3":@"3",
                                  @"4":@"4",
                                  @"5":@"5",
                                  @"6":@"6",
                                  @"7":@"7",
                                  @"8":@"8",
                                  @"9":@"9",
                                  @"10":@"10",
                                  };
            return [dic valueForKey:[NSString stringWithFormat:@"%ld",self.specialNum.length]];
        }
            break;
            
        default:
            break;
    }
    return @"0";
}

- (NSInteger)getWinNWithGameType:(NSInteger)gameType{
    if (gameType > 5) {
        return 1;
    }
    switch (gameType) {
        case 1:
            {
                NSInteger num1 = self.num1.length > 0 ? 1 : 0;
                NSInteger num2 = self.num2.length > 0 ? 1 : 0;
                NSInteger num3 = self.num3.length > 0 ? 1 : 0;
                NSInteger num4= self.num4.length > 0 ? 1 : 0;
                NSInteger num5 = self.num5.length > 0 ? 1 : 0;
                return [self Star1WithNum1:num1 num2:num2 num3:num3 num4:num4 num5:num5];
            }
            break;
        case 2:
        {
            NSInteger num1 = self.num1.length > 0 ? 1 : 0;
            NSInteger num2 = self.num2.length > 0 ? 1 : 0;
            NSInteger num3 = self.num3.length > 0 ? 1 : 0;
            NSInteger num4= self.num4.length > 0 ? 1 : 0;
            NSInteger num5 = self.num5.length > 0 ? 1 : 0;
            return [self Star2WithNum1:num1 num2:num2 num3:num3 num4:num4 num5:num5];
        }
            break;
        case 3:
        {
            NSInteger num1 = self.num1.length > 0 ? 1 : 0;
            NSInteger num2 = self.num2.length > 0 ? 1 : 0;
            NSInteger num3 = self.num3.length > 0 ? 1 : 0;
            NSInteger num4= self.num4.length > 0 ? 1 : 0;
            NSInteger num5 = self.num5.length > 0 ? 1 : 0;
            return [self Star3WithNum1:num1 num2:num2 num3:num3 num4:num4 num5:num5];
        }
            break;
        case 4:
        {
            NSInteger num1 = self.num1.length > 0 ? 1 : 0;
            NSInteger num2 = self.num2.length > 0 ? 1 : 0;
            NSInteger num3 = self.num3.length > 0 ? 1 : 0;
            NSInteger num4= self.num4.length > 0 ? 1 : 0;
            NSInteger num5 = self.num5.length > 0 ? 1 : 0;
            return [self Star4WithNum1:num1 num2:num2 num3:num3 num4:num4 num5:num5];
        }
            break;
        case 5:
        {
            NSInteger num1 = self.num1.length > 0 ? 1 : 0;
            NSInteger num2 = self.num2.length > 0 ? 1 : 0;
            NSInteger num3 = self.num3.length > 0 ? 1 : 0;
            NSInteger num4= self.num4.length > 0 ? 1 : 0;
            NSInteger num5 = self.num5.length > 0 ? 1 : 0;
            return [self Star5WithNum1:num1 num2:num2 num3:num3 num4:num4 num5:num5];
        }
            break;
        default:
            break;
    }
    return 0;
}
- (NSInteger)Star5WithNum1:(NSInteger)num1 num2:(NSInteger)num2 num3:(NSInteger)num3 num4:(NSInteger)num4 num5:(NSInteger)num5{
    return num1 * num2 * num3 * num4 * num5;
}
- (NSInteger)Star4WithNum1:(NSInteger)num1 num2:(NSInteger)num2 num3:(NSInteger)num3 num4:(NSInteger)num4 num5:(NSInteger)num5{
    return num1 * num2 * num3 * num4 + num1 * num2 * num3 * num5 + num1 * num2 * num4 * num5 + num1 * num3 * num4 * num5 + num5 * num2 * num3 * num4;
}
- (NSInteger)Star3WithNum1:(NSInteger)num1 num2:(NSInteger)num2 num3:(NSInteger)num3 num4:(NSInteger)num4 num5:(NSInteger)num5{
    NSInteger res = num1 * num2 * num3 + num1 * num2 * num4 + num1 * num2 * num5 + num1 * num3 * num4 + num1 * num3 * num5 + num1 * num4 * num5 +
    num2 * num3 * num4 + num2 * num3 * num5 + num2 * num4 * num5 + num3 * num4 * num5;
    return res;
}
- (NSInteger)Star2WithNum1:(NSInteger)num1 num2:(NSInteger)num2 num3:(NSInteger)num3 num4:(NSInteger)num4 num5:(NSInteger)num5{
    NSInteger res = num1 * num2 + num1 * num3 + num1 * num4 + num1 * num5 + num2 * num3 + num2 * num4 + num2 * num5 + num3 * num4 +  num3 * num5 + num4 * num5;
    return res;
}
- (NSInteger)Star1WithNum1:(NSInteger)num1 num2:(NSInteger)num2 num3:(NSInteger)num3 num4:(NSInteger)num4 num5:(NSInteger)num5{
    NSInteger res = num1 + num2 + num3 + num4 + num5;
    return res;
}
@end
