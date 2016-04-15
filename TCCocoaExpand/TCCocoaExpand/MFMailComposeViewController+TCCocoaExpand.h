//
//  MFMailComposeViewController+TCCocoaExpand.h
//  TCCocoaExpand
//
//  Created by tauCross on 16/4/15.
//  Copyright © 2016年 tauCross. All rights reserved.
//

#import <MessageUI/MessageUI.h>



typedef void(^MailComposeViewControllerCompleteBlock) (MFMailComposeViewController *controller, MFMailComposeResult result, NSError *error);



@interface MFMailComposeViewController (TCCocoaExpand)<MFMailComposeViewControllerDelegate>

- (void)presentFromViewController:(UIViewController *)viewController completeBlock:(MailComposeViewControllerCompleteBlock)block;

@end
