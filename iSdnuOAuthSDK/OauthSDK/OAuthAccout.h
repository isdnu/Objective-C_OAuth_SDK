//
//  OAuthAccout.h
//  iSdnuOAuthSDK
//
//  Created by 梁建 on 15/5/2.
//  Copyright (c) 2015年 梁建. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OAuthAccout : NSObject<NSCoding>

@property (nonatomic, copy) NSString *access_token;

@property (nonatomic,copy) NSString *oauth_token_secret;

@property (nonatomic, assign) long long user_id;

@property (nonatomic,assign) int user_type;

@property (nonatomic,assign) long long expires_in;

@property (nonatomic, strong) NSDate *expiresTime; // 账号的过期时间

+ (instancetype)accountWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;


@end
