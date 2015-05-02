//
//  OAuthClient.h
//  iSdnuOAuthSDK
//
//  Created by 梁建 on 15/5/2.
//  Copyright (c) 2015年 梁建. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPRequestOperationManager.h"
#import "OAuthAccessTokenParam.h"

#import "OAuthRequestTokenParam.h"
@interface OAuthClient : NSObject

@property(nonatomic,strong) OAuthAccessTokenParam *tokenParam;

@property(nonatomic,strong) OAuthRequestTokenParam *requestParam;

@property(nonatomic,copy) NSString *consumerKey;

@property(nonatomic,copy) NSString *consumerSecret;

-(id)initWithConsumerKey:(NSString *)consumerKey ConsumerSecret:(NSString *)consumerSecret andRequestParam:(OAuthRequestTokenParam *)param;


@end
