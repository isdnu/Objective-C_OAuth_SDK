//
//  OAuthAccout.m
//  iSdnuOAuthSDK
//
//  Created by 梁建 on 15/5/2.
//  Copyright (c) 2015年 梁建. All rights reserved.
//

#import "OAuthAccout.h"

@implementation OAuthAccout
@synthesize access_token=_access_token;
@synthesize oauth_token_secret=_oauth_token_secret;
@synthesize expiresTime=_expiresTime;
@synthesize expires_in=_expires_in;
@synthesize user_id=_user_id;
@synthesize user_type=_user_type;

+ (instancetype)accountWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}
- (instancetype)initWithDict:(NSDictionary *)dict
{
    
    if (self=[super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    
    return self;
}



/**
 *  从文件中解析对象的时候调
 */
- (id)initWithCoder:(NSCoder *)decoder
{
    if (self = [super init]) {
        self.access_token = [decoder decodeObjectForKey:@"access_token"];
        self.oauth_token_secret=[decoder decodeObjectForKey:@"oauth_token_secret"];
        self.expiresTime=[decoder decodeObjectForKey:@"expiresTime"];
        self.expires_in = [decoder decodeInt64ForKey:@"expires_in"];
        self.user_id= [decoder decodeInt64ForKey:@"user_id"];
        self.user_type=[decoder decodeIntForKey:@"user_type"];
        
    }
    return self;
}

/**
 *  将对象写入文件的时候调用
 */
- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.access_token forKey:@"access_token"];
    [encoder encodeObject:self.oauth_token_secret forKey:@"oauth_token_secret"];
    [encoder encodeObject:self.expiresTime forKey:@"expiresTime"];
    [encoder encodeInt64:self.expires_in forKey:@"expires_in"];
    [encoder encodeInt64:self.user_id forKey:@"user_id"];
    [encoder encodeInt:self.user_type forKey:@"user_type"];

    }


@end
