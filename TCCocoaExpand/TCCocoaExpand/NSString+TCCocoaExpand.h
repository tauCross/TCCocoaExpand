//
//  NSString+TCCocoaExpand.h
//  TCCocoaExpand
//
//  Created by tauCross on 16/4/15.
//  Copyright © 2016年 tauCross. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface NSString (TCCocoaExpand)

- (NSString *)tc_sha1;
- (NSString *)tc_sha256;
- (NSString *)tc_base64;
- (NSString *)tc_clearSpace;
- (NSString *)tc_encodeURL;
- (NSString *)tc_md5;
- (NSURL *)tc_url;

@end
