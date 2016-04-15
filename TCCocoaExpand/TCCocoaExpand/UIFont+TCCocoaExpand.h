//
//  UIFont+TCCocoaExpand.h
//  TCCocoaExpand
//
//  Created by tauCross on 16/4/15.
//  Copyright © 2016年 tauCross. All rights reserved.
//

#import <UIKit/UIKit.h>



typedef enum
{
    TCFontWeightUltraLight,
    TCFontWeightThin,
    TCFontWeightLight,
    TCFontWeightRegular,
    TCFontWeightMedium,
    TCFontWeightSemibold,
    TCFontWeightBold,
    TCFontWeightHeavy,
    TCFontWeightBlack
}TCFontWeight;



@interface UIFont (TCCocoaExpand)

+ (UIFont *)tc_systemFontOfSize:(CGFloat)fontSize weight:(TCFontWeight)weight;

@end
