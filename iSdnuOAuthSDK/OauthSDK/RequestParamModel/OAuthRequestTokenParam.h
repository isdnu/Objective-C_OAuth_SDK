//
//  OAuthRequestTokenParam.h
//  iSdnuOAuthSDK
//
//  Created by 梁建 on 15/5/2.
//  Copyright (c) 2015年 梁建. All rights reserved.
//

#import "OAuthBaseTokenParam.h"

@interface OAuthRequestTokenParam : OAuthBaseTokenParam

@property (nonatomic, copy) NSString *oauth_callback;

@end
