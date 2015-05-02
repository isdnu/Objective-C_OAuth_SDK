//
//  OAuthBaseParam.m
//  iSdnuOAuthSDK
//
//  Created by 梁建 on 15/5/2.
//  Copyright (c) 2015年 梁建. All rights reserved.
//

#import "OAuthBaseParam.h"
#import "OAuthAccout.h"
#import "OAuthAccountTool.h"
@implementation OAuthBaseParam

@synthesize oauth_token_secret=_oauth_token_secret;
@synthesize access_token=_access_token;

- (id)init
{
    if (self = [super init]) {
        
        self.access_token=[OAuthAccountTool account].access_token;
        self.oauth_token_secret=[OAuthAccountTool account].oauth_token_secret;
    }
    return self;
}



+ (instancetype)param
{
    return [[self alloc] init];
}


@end
