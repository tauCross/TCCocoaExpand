//
//  UIApplication+TCCocoaExpand.m
//  TCCocoaExpand
//
//  Created by tauCross on 2017/10/10.
//  Copyright © 2017年 tauCross. All rights reserved.
//

#import "UIApplication+TCCocoaExpand.h"

#import <objc/runtime.h>



static char tc_application_allow_custom_keyboard;

@implementation UIApplication (TCCocoaExpand)

- (void)setTc_allowCustomKeyboard:(BOOL)tc_allowCustomKeyboard
{
    objc_setAssociatedObject(self, &tc_application_allow_custom_keyboard, @(tc_allowCustomKeyboard), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)tc_allowCustomKeyboard
{
    NSNumber *n = objc_getAssociatedObject(self, &tc_application_allow_custom_keyboard);
    if(n)
    {
        return n.boolValue;
    }
    return YES;
}

@end
