//
//  UIColor+TCCocoaExpand.h
//  TCCocoaExpand
//
//  Created by tauCross on 16/4/15.
//  Copyright © 2016年 tauCross. All rights reserved.
//

#import <UIKit/UIKit.h>



#define HEXCOLOR(hex)                       HEXCOLORA(hex,1)
#define HEXCOLORA(hex,a)                    [UIColor colorWithHexString:hex alpha:a]



@interface UIColor (TCCocoaExpand)

+ (instancetype)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;

@end
