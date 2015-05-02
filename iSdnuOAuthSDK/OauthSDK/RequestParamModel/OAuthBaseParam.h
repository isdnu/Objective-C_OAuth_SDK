//
//  OAuthBaseParam.h
//  iSdnuOAuthSDK
//
//  Created by 梁建 on 15/5/2.
//  Copyright (c) 2015年 梁建. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OAuthBaseParam : NSObject

@property(nonatomic,copy)NSString *access_token;

@property(nonatomic,copy)NSString *oauth_token_secret;

+ (instancetype)param;

@end
