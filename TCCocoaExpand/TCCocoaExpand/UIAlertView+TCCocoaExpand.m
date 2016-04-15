//
//  UIAlertView+TCCocoaExpand.m
//  TCCocoaExpand
//
//  Created by tauCross on 16/4/15.
//  Copyright © 2016年 tauCross. All rights reserved.
//

#import "UIAlertView+TCCocoaExpand.h"

#import <objc/runtime.h>



static char alert_view_complete_block_key;



@implementation UIAlertView (TCCocoaExpand)

- (void)showAlertViewWithCompleteBlock:(AlertViewCompleteBlock)block
{
    if(block)
    {
        objc_removeAssociatedObjects(self);
        objc_setAssociatedObject(self, &alert_view_complete_block_key, block, OBJC_ASSOCIATION_COPY);
        self.delegate = self;
    }
    [self show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    AlertViewCompleteBlock block = objc_getAssociatedObject(self, &alert_view_complete_block_key);
    if(block)
    {
        block(buttonIndex, alertView);
    }
}

@end
