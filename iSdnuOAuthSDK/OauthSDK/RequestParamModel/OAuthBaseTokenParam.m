//
//  OAuthBaseTokenParam.m
//  iSdnuOAuthSDK
//
//  Created by 梁建 on 15/5/2.
//  Copyright (c) 2015年 梁建. All rights reserved.
//

#import "OAuthBaseTokenParam.h"
#import "OAuthCommon.h"
#import "OAuthConstants.h"
@implementation OAuthBaseTokenParam

- (id)init
{
    
    return [self initWithOAuth_Consumer_Key:nil];
}



-(id)initWithOAuth_Consumer_Key:(NSString *)oauth_consumer_key
{
    if (self=[super init]) {
        self.oauth_consumer_key=oauth_consumer_key;
        self.oauth_version=CurrentVersion;
        self.oauth_signature_method=SupportSignatureMethod;
    }
    
    
    return self;
}

+(id)param
{
    
    return [[self alloc]init];
}

-(NSString *)oauth_nonce
{
    if (_oauth_nonce == nil)
    {
        
        
        CFUUIDRef uuid_ref = CFUUIDCreate(NULL);
        CFStringRef uuid_string_ref= CFUUIDCreateString(NULL, uuid_ref);
        CFRelease(uuid_ref);
        _oauth_nonce = [[[NSString stringWithString:(__bridge NSString*)uuid_string_ref] lowercaseString] stringByReplacingOccurrencesOfString:@"-" withString:@""];
        CFRelease(uuid_string_ref);
        //LJLog(@"%@",[[_oauth_nonce lowercaseString] stringByReplacingOccurrencesOfString:@"-" withString:@""]);
        
        
    }
    
    
    
    return _oauth_nonce;
    //[[_oauth_nonce lowercaseString] stringByReplacingOccurrencesOfString:@"-" withString:@""];
}


- (NSString *)oauth_timestamp
{
    if (_oauth_timestamp == nil)
        _oauth_timestamp = [NSString stringWithFormat:@"%d", (int)(((float)([[NSDate date] timeIntervalSince1970])) + 0.5)];
    
    return _oauth_timestamp;
}





-(void)resetNonceAndTimestamp
{
    _oauth_nonce=nil;
    _oauth_timestamp=nil;
}




@end
