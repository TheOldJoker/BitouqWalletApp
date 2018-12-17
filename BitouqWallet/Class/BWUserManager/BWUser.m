//
//  BWUser.m
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/2.
//  Copyright © 2018 Joker. All rights reserved.
//

#import "BWUser.h"
@implementation BWUser
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.privatekey forKey:@"privatekey"];
    [aCoder encodeObject:self.password forKey:@"password"];
    [aCoder encodeObject:self.publickey forKey:@"publickey"];
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self.privatekey = [aDecoder decodeObjectForKey:@"privatekey"];
    self.password = [aDecoder decodeObjectForKey:@"password"];
    self.publickey = [aDecoder decodeObjectForKey:@"publickey"];
    return self;
}
- (NSInteger)maxPoint{
//    if (stringIsEmpty(self.officialPoint)) {
//        return 4;
//    }
//    return [self.officialPoint integerValue];
    return 4;
}
@end
