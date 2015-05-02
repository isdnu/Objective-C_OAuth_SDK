//
//  OAuthCommon.h
//  iSdnuOAuthSDK
//
//  Created by 梁建 on 15/5/2.
//  Copyright (c) 2015年 梁建. All rights reserved.
//

#ifndef iSdnuOAuthSDK_OAuthCommon_h
#define iSdnuOAuthSDK_OAuthCommon_h


#define AppKey      @""
#define AppSecret   @""
#define CallBackURL @"http://i.sdnu.edu.cn/oauth/index.html"
// 3.自定义Log
#ifdef DEBUG
#define LJLog(...) NSLog(__VA_ARGS__)
#else
#define LJLog(...)
#endif

#endif
/*
 
 第一步请求
 oauth_callback	第二步用户授权时的回调地址
 oauth_consumer_key	Consumer Key
 oauth_nonce	单次值，最长32位字符串
 oauth_signature	签名
 oauth_signature_method	签名方法，固定为“HMAC-SHA1”
 oauth_timestamp	时间戳
 oauth_version
 
 
 
 */

/*
 oauth_consumer_key	Consumer Key
 oauth_nonce	单次值，最长32位字符串
 oauth_signature	签名
 oauth_signature_method	签名方法，固定为“HMAC-SHA1”
 oauth_timestamp	时间戳
 oauth_token	第一步获得的Request Token ID
 oauth_verifier	第二步获得的验证码
 oauth_version
 
 
 
 */