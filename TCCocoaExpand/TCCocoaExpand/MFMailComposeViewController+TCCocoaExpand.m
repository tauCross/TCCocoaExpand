//
//  MFMailComposeViewController+TCCocoaExpand.m
//  TCCocoaExpand
//
//  Created by tauCross on 16/4/15.
//  Copyright © 2016年 tauCross. All rights reserved.
//

#import "MFMailComposeViewController+TCCocoaExpand.h"

#import <objc/runtime.h>



static char mail_caomponse_complete_block_key;



@implementation MFMailComposeViewController (TCCocoaExpand)

- (void)presentFromViewController:(UIViewController *)viewController completeBlock:(MailComposeViewControllerCompleteBlock)block
{
    if(block)
    {
        self.mailComposeDelegate = self;
        objc_setAssociatedObject(self, &mail_caomponse_complete_block_key, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
    [viewController presentViewController:self animated:YES completion:nil];
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    MailComposeViewControllerCompleteBlock block = objc_getAssociatedObject(self, &mail_caomponse_complete_block_key);
    if(block)
    {
        block(controller, result, error);
    }
}

@end
