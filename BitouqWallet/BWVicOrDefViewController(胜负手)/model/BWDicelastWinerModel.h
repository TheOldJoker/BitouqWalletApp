//
//  BWDicelastWinerModel.h
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/11.
//  Copyright © 2018 Joker. All rights reserved.
//
/*
 "createtime": 1542883558000,    //购买时间
 "guess": 15,            //猜的数
 "id": 76,
 "pubkey": "8JWRqEGK84GxbF7jpn5TZoEnefjuzxDA39iBRrVYge2D",    //公钥
 "result": 40,        //开奖结果
 "win": false            //是否中奖
*/
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BWDicelastWinerModel : NSObject
@property (nonatomic, copy) NSString *createtime;//创建时间
@property (nonatomic, copy) NSString *guess;//猜的数
@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *pubkey;
@property (nonatomic, copy) NSString *result;//开奖结果
@property (nonatomic, assign) BOOL win;
@end

NS_ASSUME_NONNULL_END
