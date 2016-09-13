//
//  NSString+TCCocoaExpand.h
//  TCCocoaExpand
//
//  Created by tauCross on 16/4/15.
//  Copyright © 2016年 tauCross. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface NSString (TCCocoaExpand)

- (NSString *)sha256;
- (NSString *)base64;
- (NSString *)clearSpace;
- (NSString *)encodeURL;
- (NSString *)md5;
- (NSURL *)url;

@end
