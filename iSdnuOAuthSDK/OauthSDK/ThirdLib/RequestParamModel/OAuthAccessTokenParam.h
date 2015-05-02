//
//  OAuthAccessTokenParam.h
//  iSdnuOAuthSDK
//
//  Created by 梁建 on 15/5/2.
//  Copyright (c) 2015年 梁建. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OAuthBaseTokenParam.h"
@interface OAuthAccessTokenParam : OAuthBaseTokenParam


@property (nonatomic, copy) NSString *oauth_verifier;

@property (nonatomic,copy)NSString *oauth_token;






@end
