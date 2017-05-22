//
//  UIView+TCCocoaExpand.m
//  TCCocoaExpand
//
//  Created by tauCross on 16/4/15.
//  Copyright © 2016年 tauCross. All rights reserved.
//

#import "UIView+TCCocoaExpand.h"

#import <objc/runtime.h>



@interface UIView ()

@property(nonatomic, strong)CADisplayLink *rotateLink;
@property(nonatomic, assign)CGFloat rotateSpeed;

@end


@implementation UIView (TCCocoaExpand)

+ (void)load
{
    {
        Method oriMethod = class_getInstanceMethod([UILabel class], @selector(setFrame:));
        Method tcMethod = class_getInstanceMethod([UILabel class], @selector(tc_setFrame:));
        method_exchangeImplementations(oriMethod, tcMethod);
    }
    {
        Method oriMethod = class_getInstanceMethod([UILabel class], @selector(setCenter:));
        Method tcMethod = class_getInstanceMethod([UILabel class], @selector(tc_setCenter:));
        method_exchangeImplementations(oriMethod, tcMethod);
    }
}

- (void)tc_setFrame:(CGRect)frame
{
    CGFloat scale = [UIScreen mainScreen].scale;
    frame.origin.x = floor(frame.origin.x * scale) / scale;
    frame.origin.y = floor(frame.origin.y * scale) / scale;
    frame.size.width = floor(frame.size.width * scale) / scale;
    frame.size.height = floor(frame.size.height * scale) / scale;
    [self tc_setFrame:frame];
}

- (void)tc_setCenter:(CGPoint)center
{
    CGFloat scale = [UIScreen mainScreen].scale;
    center.x = floor(center.x * scale) / scale;
    center.y = floor(center.y * scale) / scale;
    [self tc_setCenter:center];
}

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

- (void)rotateTimerClockwiseSpeed:(CGFloat)speed
{
    self.rotateSpeed = speed;
    if(self.rotateLink == nil)
    {
        self.rotateLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(rotateAnimation)];
        [self.rotateLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    }
}

- (void)stopTimerAnimation
{
    [self.rotateLink invalidate];
    self.rotateLink = nil;
}

- (void)rotateAnimation
{
    if(self.superview == nil)
    {
        [self stopTimerAnimation];
        return;
    }
    self.layer.transform = CATransform3DRotate(self.layer.transform, M_PI * 2 / (self.rotateSpeed * 60), 0, 0, 1);
}

#pragma mark -
static char uiview_rotate_link_key;
static char uiview_rotate_speed_key;
- (void)setRotateLink:(CADisplayLink *)rotateLink
{
    objc_setAssociatedObject(self, &uiview_rotate_link_key, rotateLink, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CADisplayLink *)rotateLink
{
    return objc_getAssociatedObject(self, &uiview_rotate_link_key);
}

- (void)setRotateSpeed:(CGFloat)rotateSpeed
{
    objc_setAssociatedObject(self, &uiview_rotate_speed_key, @(rotateSpeed), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)rotateSpeed
{
    return [objc_getAssociatedObject(self, &uiview_rotate_speed_key) doubleValue];
}


@end
