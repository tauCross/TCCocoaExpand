//
//  UIFont+TCCocoaExpand.m
//  TCCocoaExpand
//
//  Created by tauCross on 16/4/15.
//  Copyright © 2016年 tauCross. All rights reserved.
//

#import "UIFont+TCCocoaExpand.h"



@implementation UIFont (TCCocoaExpand)

+ (UIFont *)tc_systemFontOfSize:(CGFloat)fontSize weight:(TCFontWeight)weight
{
    if([[[UIDevice currentDevice] systemVersion] compare:@"8.2" options:NSNumericSearch] != NSOrderedAscending)
    {
        switch(weight)
        {
            case TCFontWeightUltraLight:
                return [UIFont systemFontOfSize:fontSize weight:UIFontWeightUltraLight];
            case TCFontWeightThin:
                return [UIFont systemFontOfSize:fontSize weight:UIFontWeightThin];
            case TCFontWeightLight:
                return [UIFont systemFontOfSize:fontSize weight:UIFontWeightLight];
            case TCFontWeightRegular:
                return [UIFont systemFontOfSize:fontSize weight:UIFontWeightRegular];
            case TCFontWeightMedium:
                return [UIFont systemFontOfSize:fontSize weight:UIFontWeightMedium];
            case TCFontWeightSemibold:
                return [UIFont systemFontOfSize:fontSize weight:UIFontWeightSemibold];
            case TCFontWeightBold:
                return [UIFont systemFontOfSize:fontSize weight:UIFontWeightBold];
            case TCFontWeightHeavy:
                return [UIFont systemFontOfSize:fontSize weight:UIFontWeightHeavy];
            case TCFontWeightBlack:
                return [UIFont systemFontOfSize:fontSize weight:UIFontWeightBlack];
        }
    }
    else
    {
        switch(weight)
        {
            case TCFontWeightUltraLight:
            case TCFontWeightThin:
            case TCFontWeightLight:
            case TCFontWeightRegular:
                return [UIFont systemFontOfSize:fontSize];
            case TCFontWeightMedium:
            case TCFontWeightSemibold:
            case TCFontWeightBold:
            case TCFontWeightHeavy:
            case TCFontWeightBlack:
                return [UIFont boldSystemFontOfSize:fontSize];
        }
    }
}

@end
