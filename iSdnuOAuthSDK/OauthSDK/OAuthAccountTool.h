//
//  OAuthAccountTool.h
//  iSdnuOAuthSDK
//
//  Created by 梁建 on 15/5/2.
//  Copyright (c) 2015年 梁建. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OAuthAccessTokenParam.h"
#import "OAuthAccessTokenResult.h"
@class OAuthAccout;
@interface OAuthAccountTool : NSObject

/**
 *  存储账号信息
 *
 *  @param account 需要存储的账号
 */
+ (void)saveAccount:(OAuthAccout *)account;

/**
 *  返回存储的账号信息
 */
+ (OAuthAccout *)account;

/**
 *  获得accessToken
 *
 *  @param param   请求参数
 *  @param success 请求成功后的回调
 *  @param failure 请求失败后的回调
 */
+ (void)accessTokenWithParam:(OAuthAccessTokenParam *)param success:(void (^)(OAuthAccessTokenResult *result))success failure:(void (^)(NSError *error))failure;
@end
