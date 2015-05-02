//
//  NSString+RFC3986Encode.m
//  iSdnuOAuthSDK
//
//  Created by 梁建 on 15/5/2.
//  Copyright (c) 2015年 梁建. All rights reserved.
//

#import "NSString+RFC3986Encode.h"

static NSString * RFC3986EscapedStringWithEncoding(NSString *string, NSStringEncoding encoding)
{
    // Validate the input string to ensure we dont return nil.
    string = string ?: @"";
    
    // Escape per RFC 3986 standards as required by OAuth. Previously, not
    // escaping asterisks (*) causes passwords with * to fail in
    // Instapaper authentication
    static NSString * const kAFCharactersToBeEscaped = @":/?#[]@!$&'()*+,;=";
    static NSString * const kAFCharactersToLeaveUnescaped = @"-._~";
    
    return (__bridge_transfer  NSString *)CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (__bridge CFStringRef)string, (__bridge CFStringRef)kAFCharactersToLeaveUnescaped, (__bridge CFStringRef)kAFCharactersToBeEscaped, CFStringConvertNSStringEncodingToEncoding(encoding));
}



@implementation NSString (RFC3986Encode)

-(NSString *)lj_rfc3986EncodeWithString
{
    
    return RFC3986EscapedStringWithEncoding(self, NSUTF8StringEncoding);

}

@end
