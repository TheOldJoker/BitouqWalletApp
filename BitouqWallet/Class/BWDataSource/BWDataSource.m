//
//  BWDataSource.m
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/6.
//  Copyright © 2018 Joker. All rights reserved.
//

#import "BWDataSource.h"
#import "BWNetHelper.h"
@implementation BWDataSource
#pragma mark - 獲取公鑰私鑰
+ (void)getKeySuccess:(void (^)(id response))success fail:(void (^)(NSError * error))failure{
    NSDictionary *params = @{};
    [BWNetHelper getWithUrl:[@"addr/getkeypair" getSeverUrl] params:params header:NO success:^(id response) {
        if (success) {
            success(response);
        }
    } fail:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
#pragma mark - 獲取賬戶餘額
+ (void)getUserAssetSuccess:(void (^)(id response))success fail:(void (^)(NSError * error))failure{
    BWUser *user = [BWUserManager shareManager].user;
    NSDictionary *params = @{
                             @"pubkey":user.publickey
                             };
    [BWNetHelper getWithUrl:[@"asset" getSeverUrl] params:params header:NO success:^(id response) {
        if (success) {
            success(response);
        }
    } fail:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
#pragma mark - 獲取首頁概覽活動數據
+ (void)getWalletActivityDataSuccess:(void (^)(id response))success fail:(void (^)(NSError * error))failure{
    BWUser *user = [BWUserManager shareManager].user;
    NSDictionary *params = @{
                             @"pubkey":user.publickey
                             };
    [BWNetHelper getWithUrl:[@"staticbypubkey" getSeverUrl] params:params header:NO success:^(id response) {
        if (success) {
            success(response);
        }
    } fail:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
#pragma mark - 獲取錢包頁面轉賬記錄
+ (void)getWalletrecordSuccess:(void (^)(id response))success fail:(void (^)(NSError * error))failure{
    BWUser *user = [BWUserManager shareManager].user;
    NSDictionary *params = @{
                             @"pubkey":user.publickey
                             };
    [BWNetHelper getWithUrl:[@"transfer/record" getSeverUrl] params:params header:NO success:^(id response) {
        if (success) {
            success(response);
        }
    } fail:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
#pragma mark - 默認礦工費
+ (void)getDefaultservicefeeSuccess:(void (^)(id response))success fail:(void (^)(NSError * error))failure{
    BWUser *user = [BWUserManager shareManager].user;
    NSDictionary *params = @{
                             @"pubkey":user.publickey
                             };
    [BWNetHelper getWithUrl:[@"transfer/defaultservicefee" getSeverUrl] params:params header:NO success:^(id response) {
        if (success) {
            success(response);
        }
    } fail:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
#pragma mark - 轉賬
+ (void)transferAssetWithModel:(BWWalletSendModel *)sendModel success:(void (^)(id response))success fail:(void (^)(NSError * error))failure{
    BWUser *user = [BWUserManager shareManager].user;
    NSDictionary *params = @{
                             @"frompubkey":user.publickey,
                             @"fromprikey":user.privatekey,
                             @"topubkey":sendModel.getAddress,
                             @"amount":sendModel.sendMoney,
                             @"serviceFee":sendModel.miningMoney
                             };
    [BWNetHelper postWithUrl:[@"transfer" getSeverUrl] params:params header:NO success:^(id response) {
        if (success) {
            success(response);
        }
    } fail:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
#pragma mark - 轉賬記錄
+ (void)getRecordeSuccess:(void (^)(id response))success fail:(void (^)(NSError * error))failure{
    BWUser *user = [BWUserManager shareManager].user;
    NSDictionary *params = @{
                             @"pubkey":user.publickey
                             };
    [BWNetHelper getWithUrl:[@"billdetailbypubkey" getSeverUrl] params:params header:NO success:^(id response) {
        if (success) {
            success(response);
        }
    } fail:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
#pragma mark - 獲取所有礦主信息
+ (void)getAllTheMineOwnerSuccess:(void (^)(id response))success fail:(void (^)(NSError * error))failure{
//    BWUser *user = [BWUserManager shareManager].user;
    NSDictionary *params = @{
                             };
    [BWNetHelper getWithUrl:[@"xjssc/mining/master" getSeverUrl] params:params header:NO success:^(id response) {
        if (success) {
            success(response);
        }
    } fail:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
#pragma mark - 矿主挖矿
+ (void)miningProductionWithNum1:(NSString *)num1 num2:(NSString *)num2 num3:(NSString *)num3 num4:(NSString *)num4 num5:(NSString *)num5 success:(void (^)(id response))success fail:(void (^)(NSError * error))failure{
    BWUser *user = [BWUserManager shareManager].user;
    NSDictionary *params = @{
                             @"pubkey":user.publickey,
                             @"prikey":user.privatekey,
                             @"num1":num1,
                             @"num2":num2,
                             @"num3":num3,
                             @"num4":num4,
                             @"num5":num5
                             };
    
    [BWNetHelper postWithUrl:[@"xjssx/mining" getSeverUrl] params:params header:NO success:^(id response) {
        if (success) {
            success(response);
        }
    } fail:^(NSError *error) {
        
        if (failure) {
            failure(error);
        }
    }];
}
#pragma mark - 查詢我的礦主
+ (void)getMyMiningOwnerSuccess:(void (^)(id response))success fail:(void (^)(NSError * error))failure{
    BWUser *user = [BWUserManager shareManager].user;
    NSDictionary *params = @{
                             @"pubkey":user.publickey
                             };
    [BWNetHelper getWithUrl:[@"xjssc/voteinfo" getSeverUrl] params:params header:NO success:^(id response) {
        if (success) {
            success(response);
        }
    } fail:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
#pragma mark - 查詢我的累計收益
+ (void)getMyMiningEarningsSuccess:(void (^)(id response))success fail:(void (^)(NSError * error))failure{
    BWUser *user = [BWUserManager shareManager].user;
    NSDictionary *params = @{
                             @"pubkey":user.publickey
                             };
    [BWNetHelper getWithUrl:[@"xjssx/mining/profit" getSeverUrl] params:params header:NO success:^(id response) {
        
        if (success) {
            success(response);
        }
    } fail:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
#pragma mark - 查詢我的幣齡
+ (void)getMyMiningAgeSuccess:(void (^)(id response))success fail:(void (^)(NSError * error))failure{
    BWUser *user = [BWUserManager shareManager].user;
    NSDictionary *params = @{
                             @"pubkey":user.publickey
                             };
    
    [BWNetHelper getWithUrl:[@"xjssc/mining/age" getSeverUrl] params:params header:NO success:^(id response) {
        if (success) {
            success(response);
        }
    } fail:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
#pragma mark - 投票
+ (void)voteToMiningOwnerWithKey:(NSString *)pubkey success:(void (^)(id response))success fail:(void (^)(NSError * error))failure{
    BWUser *user = [BWUserManager shareManager].user;
    NSDictionary *params = @{
                             @"pubkey":user.publickey,
                             @"prikey":user.privatekey,
                             @"master":pubkey
                             };
    
    [BWNetHelper postWithUrl:[@"xjssc/vote" getSeverUrl] params:params header:NO success:^(id response) {
        if (success) {
            success(response);
        }
    } fail:^(NSError *error) {
        
        if (failure) {
            failure(error);
        }
    }];
}
#pragma mark - 獲取礦主挖礦信息
+ (void)getMyMiningInfoSuccess:(void (^)(id response))success fail:(void (^)(NSError * error))failure{
    BWUser *user = [BWUserManager shareManager].user;
    NSDictionary *params = @{
                             @"pubkey":user.publickey,
                             @"prikey":user.privatekey
                             };
    
    [BWNetHelper getWithUrl:[@"xjssx/mininginfo" getSeverUrl] params:params header:NO success:^(id response) {
        
        if (success) {
            success(response);
        }
    } fail:^(NSError *error) {
        
        if (failure) {
            failure(error);
        }
    }];
}
#pragma mark - 获取胜负手上次开奖记录
+ (void)getLastDiceWinerSuccess:(void (^)(id response))success fail:(void (^)(NSError * error))failure{
    BWUser *user = [BWUserManager shareManager].user;
    NSDictionary *params = @{
                             @"pubkey":user.publickey
                             };
    [BWNetHelper getWithUrl:[@"dice/lastrecordbypubkey" getSeverUrl] params:params header:NO success:^(id response) {
        
        if (success) {
            success(response);
        }
    } fail:^(NSError *error) {
        
        if (failure) {
            failure(error);
        }
    }];
}
#pragma mark - 获取胜负手赔率
+ (void)getDiceOddsSuccess:(void (^)(id response))success fail:(void (^)(NSError * error))failure{
    NSDictionary *params = @{};
    [BWNetHelper postWithUrl:[@"dice/odds" getSeverUrl] params:params header:NO success:^(id response) {
        
        if (success) {
            success(response);
        }
    } fail:^(NSError *error) {
        
        if (failure) {
            failure(error);
        }
    }];
}
#pragma mark - 投票
+ (void)betWithGuessNumber:(NSString *)guessNumber money:(NSString *)money success:(void (^)(id response))success fail:(void (^)(NSError * error))failure{
    BWUser *user = [BWUserManager shareManager].user;
    NSDictionary *params = @{
                             @"pubkey":user.publickey,
                             @"prikey":user.privatekey,
                             @"amount":money,
                             @"guessnum":guessNumber
                             };
    [BWNetHelper postWithUrl:[@"dice" getSeverUrl] params:params header:NO success:^(id response) {
        if (success) {
            success(response);
        }
    } fail:^(NSError *error) {
        
        if (failure) {
            failure(error);
        }
    }];
}
#pragma mark - 根據私鑰獲取公鑰
+ (void)getPubkeyWithPrikey:(NSString *)prikey success:(void (^)(id response))success fail:(void (^)(NSError * error))failure{
    NSDictionary *params = @{
                             @"prikey":prikey
                             };
    [BWNetHelper getWithUrl:[@"addr/getpubbypri" getSeverUrl] params:params header:NO success:^(id response) {
        if (success) {
            success(response);
        }
    } fail:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
#pragma mark - 获取最新一期开奖结果
+ (void)getLastBRTStarsResSuccess:(void (^)(id response))success fail:(void (^)(NSError * error))failure{
    NSDictionary *params =@{};
    [BWNetHelper getWithUrl:[@"xjssx/lastterm" getSeverUrl] params:params header:NO success:^(id response) {
        
        if (success) {
            success(response);
        }
    } fail:^(NSError *error) {
        
        if (failure) {
            failure(error);
        }
    }];
}
#pragma mark - 获取中奖消息
+ (void)getBRTStarsNewsSuccess:(void (^)(id response))success fail:(void (^)(NSError * error))failure{
    NSDictionary *params =@{};
    [BWNetHelper getWithUrl:[@"xjssx/newestwinner" getSeverUrl] params:params header:NO success:^(id response) {
        
        if (success) {
            success(response);
        }
    } fail:^(NSError *error) {
        
        if (failure) {
            failure(error);
        }
    }];
}
#pragma mark - 获取投注记录
+ (void)getBettingRecordSuccess:(void (^)(id response))success fail:(void (^)(NSError * error))failure{
    BWUser *user = [BWUserManager shareManager].user;
    NSDictionary *params = @{
                             @"pubkey":user.publickey
                             };
    [BWNetHelper getWithUrl:[@"xjssx/recordbypubkey" getSeverUrl] params:params header:NO success:^(id response) {
        if (success) {
            success(response);
        }
    } fail:^(NSError *error) {
        
        if (failure) {
            failure(error);
        }
    }];
}
#pragma mark - 获取开奖记录
+ (void)getTheLotteryRecordSuccess:(void (^)(id response))success fail:(void (^)(NSError * error))failure{
    NSDictionary *params = @{};
    [BWNetHelper getWithUrl:[@"xjssx/term" getSeverUrl] params:params header:NO success:^(id response) {
        if (success) {
            success(response);
        }
    } fail:^(NSError *error) {
        
        if (failure) {
            failure(error);
        }
    }];
}
#pragma mark - 获取游戏赔率
+ (void)getTheGameOddsSuccess:(void (^)(id response))success fail:(void (^)(NSError * error))failure{
    NSDictionary *params = @{};
    [BWNetHelper getWithUrl:[@"xjssx/gamerule" getSeverUrl] params:params header:NO success:^(id response) {
        if (success) {
            success(response);
        }
    } fail:^(NSError *error) {
        
        if (failure) {
            failure(error);
        }
    }];
}
#pragma mark - 游戏投注
//xjssx
//+ (void)gameBetWith
@end
