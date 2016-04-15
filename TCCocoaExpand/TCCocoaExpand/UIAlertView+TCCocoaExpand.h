//
//  UIAlertView+TCCocoaExpand.h
//  TCCocoaExpand
//
//  Created by tauCross on 16/4/15.
//  Copyright © 2016年 tauCross. All rights reserved.
//

#import <UIKit/UIKit.h>



typedef void(^AlertViewCompleteBlock) (NSInteger buttonIndex, UIAlertView *alertView);



@interface UIAlertView (TCCocoaExpand)

- (void)showAlertViewWithCompleteBlock:(AlertViewCompleteBlock)block;

@end
