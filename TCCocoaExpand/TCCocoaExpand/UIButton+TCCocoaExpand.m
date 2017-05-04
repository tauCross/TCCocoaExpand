//
//  UIButton+TCCocoaExpand.m
//  TCCocoaExpand
//
//  Created by tauCross on 2017/5/4.
//  Copyright © 2017年 tauCross. All rights reserved.
//

#import "UIButton+TCCocoaExpand.h"



@implementation UIButton (TCCocoaExpand)

- (void)titleImageCenterStyleWithOffset:(CGFloat)offset
{
    self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    self.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    self.titleEdgeInsets = UIEdgeInsetsMake(0, - self.imageView.frame.size.width, - self.imageView.frame.size.height - offset / 2, 0);
    self.imageEdgeInsets = UIEdgeInsetsMake(- self.titleLabel.intrinsicContentSize.height - offset / 2, 0, 0, - self.titleLabel.intrinsicContentSize.width);
}

@end
