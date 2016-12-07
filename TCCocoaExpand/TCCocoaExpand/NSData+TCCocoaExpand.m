//
//  NSData+TCCocoaExpand.m
//  TCCocoaExpand
//
//  Created by 陈潜 on 2016/12/7.
//  Copyright © 2016年 tauCross. All rights reserved.
//

#import "NSData+TCCocoaExpand.h"

#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>



@implementation NSData (TCCocoaExpand)

- (NSString *)md5
{
    const char *original_str = [self bytes];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(original_str, (CC_LONG)[self length], result);
    NSMutableString *hash = [NSMutableString string];
    for (int i = 0; i < 16; i++)
        [hash appendFormat:@"%02X", result[i]];
    return [hash lowercaseString];
}

@end
