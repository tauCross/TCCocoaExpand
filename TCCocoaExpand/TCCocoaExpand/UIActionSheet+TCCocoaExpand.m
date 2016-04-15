//
//  UIActionSheet+TCCocoaExpand.m
//  TCCocoaExpand
//
//  Created by tauCross on 16/4/15.
//  Copyright © 2016年 tauCross. All rights reserved.
//

#import "UIActionSheet+TCCocoaExpand.h"

#import <objc/runtime.h>



static char action_sheet_complete_block_key;



@implementation UIActionSheet (TCCocoaExpand)

- (void)showInView:(UIView *)view withBlock:(ActionSheetCompleteBlock)block
{
    if(block)
    {
        objc_setAssociatedObject(self, &action_sheet_complete_block_key, block, OBJC_ASSOCIATION_COPY);
        self.delegate = self;
    }
    [self showInView:view];
}

#pragma mark - UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    ActionSheetCompleteBlock block = objc_getAssociatedObject(self, &action_sheet_complete_block_key);
    if(block)
    {
        block(buttonIndex, actionSheet);
    }
}

@end
