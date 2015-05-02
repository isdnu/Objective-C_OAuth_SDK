//
//  OAuthBaseTokenParam.h
//  iSdnuOAuthSDK
//
//  Created by 梁建 on 15/5/2.
//  Copyright (c) 2015年 梁建. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OAuthBaseTokenParam : NSObject

@property (nonatomic, copy) NSString *oauth_callback;
@property (nonatomic, copy) NSString *oauth_consumer_key;
@property (nonatomic, copy) NSString *oauth_nonce;
@property (nonatomic, copy) NSString *oauth_signature;
@property (nonatomic, copy) NSString *oauth_signature_method;
@property (nonatomic, copy) NSString *oauth_timestamp;
@property (nonatomic, copy) NSString *oauth_version;


-(id)initWithOAuth_Consumer_Key:(NSString *)oauth_consumer_key;

+ (instancetype)param;

-(void)resetNonceAndTimestamp;

@end
