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
    [aCoder encodeObject:self.publickey forKey:@"publickey"];
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self.privatekey = [aDecoder decodeObjectForKey:@"privatekey"];
    self.publickey = [aDecoder decodeObjectForKey:@"publickey"];
    return self;
}
@end
