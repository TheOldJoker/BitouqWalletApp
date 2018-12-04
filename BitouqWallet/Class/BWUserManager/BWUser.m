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
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self.privatekey = [aDecoder decodeObjectForKey:@"privatekey"];
    return self;
}
@end
