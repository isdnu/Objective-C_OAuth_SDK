//
//  OAuthAccountTool.m
//  iSdnuOAuthSDK
//
//  Created by 梁建 on 15/5/2.
//  Copyright (c) 2015年 梁建. All rights reserved.
//

#import "OAuthAccountTool.h"
#import "OAuthAccout.h"
#import "OAuthClient.h"
#import "MJExtension.h"
#define OAuthAccountFile [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"account.data"]

@implementation OAuthAccountTool

+ (void)saveAccount:(OAuthAccout *)account
{
    // 计算账号的过期时间
    NSDate *now = [NSDate date];
    account.expiresTime = [now dateByAddingTimeInterval:account.expires_in];
    
    [NSKeyedArchiver archiveRootObject:account toFile:OAuthAccountFile];
}


+ (OAuthAccout *)account
{
    // 取出账号
    OAuthAccout *account = [NSKeyedUnarchiver unarchiveObjectWithFile:OAuthAccountFile];
    
    // 判断账号是否过期
    NSDate *now = [NSDate date];
    if ([now compare:account.expiresTime] == NSOrderedAscending) { // 还没有过期
        return account;
    } else { // 过期
        return nil;
    }
}

+ (void)accessTokenWithParam:(OAuthAccessTokenParam *)param success:(void (^)(OAuthAccessTokenResult *result))success failure:(void (^)(NSError *error))failure
{

    
    
    
    
}
@end
