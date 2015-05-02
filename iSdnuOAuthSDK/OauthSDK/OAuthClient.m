//
//  OAuthClient.m
//  iSdnuOAuthSDK
//
//  Created by 梁建 on 15/5/2.
//  Copyright (c) 2015年 梁建. All rights reserved.
//

#import "OAuthClient.h"
#import "OAuthConstants.h"
#import "OAuthCommon.h"
#import "NSString+RFC3986Encode.h"
#include <CommonCrypto/CommonHMAC.h>
#import "OAuthBaseParam.h"
#import "NSData+Base64.h"
#import "MJExtension.h"
@interface OAuthClient()


-(NSString *)getOAuthBasetringWithHttpMethod:(NSString *)method requestUrl:(NSString *)url;
-(NSString *)getAuthorizationHeader;
-(NSString *)getOAuthSignatureWithBaseString:(NSString *)basestring;


@end
@implementation OAuthClient

-(id)initWithConsumerKey:(NSString *)consumerKey ConsumerSecret:(NSString *)consumerSecret andRequestParam:(OAuthRequestTokenParam *)param
{
    
    
    if (self=[super init]) {
        
        self.consumerKey=consumerKey;
        self.consumerSecret=consumerSecret;
        self.requestParam=param;
    }
    
    return self;
}



-(id)init
{
    
    return [self initWithConsumerKey:nil ConsumerSecret:nil andRequestParam:nil];
}





/*
-(void)getWithURL:(NSString *)url params:(NSDictionary *)params success:(void (^)(id json))success failure:(void (^)(NSError *error))failure
{
    
    
    
    
    // 1.创建请求管理对象
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    
    
    self.tokenParam.oauth_signature=[self getOAuthSignatureWithBaseString:[self getOAuthBasetringWithHttpMethod:@"GET" requestUrl:url]];
    
    [mgr.requestSerializer setValue:[self getAuthorizationHeader] forHTTPHeaderField:@"Authorization"];
    // 2.发送请求
    [mgr GET:url parameters:params
     success:^(AFHTTPRequestOperation *operation, id responseObject) {
         if (success) {
             success(responseObject);
         }
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         if (failure) {
             failure(error);
         }
     }];

    
    
}
 */



-(NSString *)getOAuthBasetringWithHttpMethod:(NSString *)method requestUrl:(NSString *)url
{
    
    if ([method isEqualToString:@"GET"]) {
        
    }else if([method isEqualToString:@"POST"])
    {
        
    }
    
    
    if (!([method isEqualToString:@"GET"]||[method isEqualToString:@"POST"])) {
        
        LJLog(@"请求参数不对");
        
        abort();
    }
    
 

    
    
    
    NSArray *baseParams=[NSArray arrayWithObjects:
                         [NSString stringWithFormat:@"%@%%3D%@",ConsumerKeyParameter,self.requestParam.oauth_consumer_key.lj_rfc3986EncodeWithString],
                         [NSString stringWithFormat:@"%@%%3D%@",NonceParameter,self.requestParam.oauth_nonce.lj_rfc3986EncodeWithString],
                         [NSString stringWithFormat:@"%@%%3D%@",SignatureMethodParameter,self.requestParam.oauth_signature_method.lj_rfc3986EncodeWithString],
                         [NSString stringWithFormat:@"%@%%3D%@",TimestampParameter,self.requestParam.oauth_timestamp.lj_rfc3986EncodeWithString],
                         [NSString stringWithFormat:@"%@%%3D%@",VersionParameter,self.requestParam.oauth_version.lj_rfc3986EncodeWithString],
                         [NSString stringWithFormat:@"%@%%3D%@",CallbackParameter,self.requestParam.oauth_callback.lj_rfc3986EncodeWithString],
                                                    nil];
    
    
    baseParams = [baseParams sortedArrayUsingSelector:@selector(compare:)];
    
     NSString *tempParamsString=[baseParams componentsJoinedByString:@"%26"];
    
    NSArray * baseComponents = [NSArray arrayWithObjects:
                                method,
                                url,
                                tempParamsString,
                                nil];

    
    return [baseComponents componentsJoinedByString:@"&"];
   
    
}

-(NSString *)getAuthorizationHeader
{
    
    
    //self.tokenParam.oauth_signature=[self getOAuthSignatureWithBaseString:<#(NSString *)#>];
    NSArray *baseParams=[NSArray arrayWithObjects:
                         [NSString stringWithFormat:@"%@=\"%@\"",ConsumerKeyParameter,self.requestParam.oauth_consumer_key.lj_rfc3986EncodeWithString],
                         [NSString stringWithFormat:@"%@=\"%@\"",NonceParameter,self.requestParam.oauth_nonce.lj_rfc3986EncodeWithString],
                         [NSString stringWithFormat:@"%@=\"%@\"",SignatureMethodParameter,self.requestParam.oauth_signature_method.lj_rfc3986EncodeWithString],
                         [NSString stringWithFormat:@"%@=\"%@\"",TimestampParameter,self.requestParam.oauth_timestamp.lj_rfc3986EncodeWithString],
                         [NSString stringWithFormat:@"%@=\"%@\"",VersionParameter,self.requestParam.oauth_version.lj_rfc3986EncodeWithString],
                         
                         [NSString stringWithFormat:@"%@=\"%@\"",SignatureParameter,self.requestParam.oauth_signature.lj_rfc3986EncodeWithString],
                         nil];

    
    return [NSString stringWithFormat:@"OAuth %@", [baseParams componentsJoinedByString:@","]];
    

    
   
    
}

-(NSString *)getOAuthSignatureWithBaseString:(NSString *)basestring
{
    
    NSString * secret = [NSString stringWithFormat:@"%@&%@", self.consumerKey, [OAuthBaseParam param].oauth_token_secret];
    
    NSData * secretData = [secret dataUsingEncoding:NSUTF8StringEncoding];
    NSData * baseData = [basestring dataUsingEncoding:NSUTF8StringEncoding];
    
    
    uint8_t digest[20] = {0};
    CCHmac(kCCHmacAlgSHA1, secretData.bytes, secretData.length,
           baseData.bytes, baseData.length, digest);
    
    NSData * signatureData = [NSData dataWithBytes:digest length:20];
    
    return [signatureData base64EncodedString];
}

@end


