//
//  UIView+TCCocoaExpand.m
//  TCCocoaExpand
//
//  Created by tauCross on 16/4/15.
//  Copyright © 2016年 tauCross. All rights reserved.
//

#import "UIView+TCCocoaExpand.h"



@implementation UIView (TCCocoaExpand)

- (void)setX:(CGFloat)x
{
    self.frame = CGRectMake(x, self.y, self.width, self.height);
}

- (CGFloat)x
{
    return CGRectGetMinX(self.frame);
}

- (void)setY:(CGFloat)y
{
    self.frame = CGRectMake(self.x, y, self.width, self.height);
}

- (CGFloat)y
{
    return CGRectGetMinY(self.frame);
}

- (void)setWidth:(CGFloat)width
{
    self.frame = CGRectMake(self.x, self.y, width, self.height);
}

- (CGFloat)width
{
    return CGRectGetWidth(self.frame);
}

- (void)setHeight:(CGFloat)height
{
    self.frame = CGRectMake(self.x, self.y, self.width, height);
}

- (CGFloat)height
{
    return CGRectGetHeight(self.frame);
}

- (void)setTop:(CGFloat)top
{
    self.y = top;
}

- (CGFloat)top
{
    return self.y;
}

- (void)setBottom:(CGFloat)bottom
{
    self.frame = CGRectMake(self.x, bottom - self.height, self.width, self.height);
}

- (CGFloat)bottom
{
    return CGRectGetMaxY(self.frame);
}

- (void)setLeft:(CGFloat)left
{
    self.x = left;
}

- (CGFloat)left
{
    return self.x;
}

- (void)setRight:(CGFloat)right
{
    self.frame = CGRectMake(right - self.width, self.y, self.width, self.height);
}

- (CGFloat)right
{
    return CGRectGetMaxX(self.frame);
}

- (void)setCenterX:(CGFloat)centerX
{
    self.center = CGPointMake(centerX, self.centerY);
}

- (CGFloat)centerX
{
    return CGRectGetMidX(self.frame);
}

- (void)setCenterY:(CGFloat)centerY
{
    self.center = CGPointMake(self.centerX, centerY);
}

- (CGFloat)centerY
{
    return CGRectGetMidY(self.frame);
}

- (CGSize)size {
    return self.frame.size;
}

- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGPoint)origin
{
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (void)removeAllSubView
{
    for(UIView *subView in self.subviews)
    {
        [subView removeFromSuperview];
    }
}

@end
