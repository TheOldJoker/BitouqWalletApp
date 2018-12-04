//
//  BWUserManager.m
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/2.
//  Copyright © 2018 Joker. All rights reserved.
//

#import "BWUserManager.h"
NSString * const USERCACHE = @"BW_USER";
@implementation BWUserManager
static BWUserManager * _single;
@synthesize user = _user;
+ (BWUserManager *)shareManager
{
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        _single = [[self alloc] init];
    });
    return _single;
}
- (YYCache *)userCache
{
    if (!_userCache) {
        _userCache = [YYCache cacheWithName:USERCACHE];
    }
    return _userCache;
}
- (void)setUser:(BWUser *)user
{
    if (_user != user) {
        _user = user;
        [self.userCache setObject:user forKey:USERCACHE];
    }
}
- (BWUser *)user
{
    if (_user) {
        return _user;
    }
    if ([self.userCache objectForKey:USERCACHE]) {
        _user = (BWUser *)[self.userCache objectForKey:USERCACHE];
        
        return _user;
    }
    
    return nil;
}
- (void)updateUser
{
    if (self.user) {
        [self.userCache setObject:self.user forKey:USERCACHE];
    }
}
@end
