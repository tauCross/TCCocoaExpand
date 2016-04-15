//
//  UIActionSheet+TCCocoaExpand.h
//  TCCocoaExpand
//
//  Created by tauCross on 16/4/15.
//  Copyright © 2016年 tauCross. All rights reserved.
//

#import <UIKit/UIKit.h>



typedef void (^ActionSheetCompleteBlock) (NSInteger buttonIndex, UIActionSheet *actionSheet);



@interface UIActionSheet (TCCocoaExpand)<UIActionSheetDelegate>

- (void)showInView:(UIView *)view withBlock:(ActionSheetCompleteBlock)block;

@end
