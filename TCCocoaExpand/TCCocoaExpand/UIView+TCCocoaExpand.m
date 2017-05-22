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

- (void)setX:(CGFloat)x
{
    CGFloat scale = [UIScreen mainScreen].scale;
    self.frame = CGRectMake(floor(x * scale) / scale, self.y, self.width, self.height);
}

- (CGFloat)x
{
    return CGRectGetMinX(self.frame);
}

- (void)setY:(CGFloat)y
{
    CGFloat scale = [UIScreen mainScreen].scale;
    self.frame = CGRectMake(self.x, floor(y * scale) / scale, self.width, self.height);
}

- (CGFloat)y
{
    return CGRectGetMinY(self.frame);
}

- (void)setWidth:(CGFloat)width
{
    CGFloat scale = [UIScreen mainScreen].scale;
    self.frame = CGRectMake(self.x, self.y, floor(width * scale) / scale, self.height);
}

- (CGFloat)width
{
    return CGRectGetWidth(self.frame);
}

- (void)setHeight:(CGFloat)height
{
    CGFloat scale = [UIScreen mainScreen].scale;
    self.frame = CGRectMake(self.x, self.y, self.width, floor(height * scale) / scale);
}

- (CGFloat)height
{
    return CGRectGetHeight(self.frame);
}

- (void)setTop:(CGFloat)top
{
    CGFloat scale = [UIScreen mainScreen].scale;
    self.y = floor(top * scale) / scale;
}

- (CGFloat)top
{
    return self.y;
}

- (void)setBottom:(CGFloat)bottom
{
    CGFloat scale = [UIScreen mainScreen].scale;
    self.frame = CGRectMake(self.x, floor(bottom * scale) / scale - self.height, self.width, self.height);
}

- (CGFloat)bottom
{
    return CGRectGetMaxY(self.frame);
}

- (void)setLeft:(CGFloat)left
{
    CGFloat scale = [UIScreen mainScreen].scale;
    self.x = floor(left * scale) / scale;
}

- (CGFloat)left
{
    return self.x;
}

- (void)setRight:(CGFloat)right
{
    CGFloat scale = [UIScreen mainScreen].scale;
    self.frame = CGRectMake(floor(right * scale) / scale - self.width, self.y, self.width, self.height);
}

- (CGFloat)right
{
    return CGRectGetMaxX(self.frame);
}

- (void)setCenterX:(CGFloat)centerX
{
    CGFloat scale = [UIScreen mainScreen].scale;
    self.center = CGPointMake(floor(centerX * scale) / scale, self.centerY);
}

- (CGFloat)centerX
{
    return CGRectGetMidX(self.frame);
}

- (void)setCenterY:(CGFloat)centerY
{
    CGFloat scale = [UIScreen mainScreen].scale;
    self.center = CGPointMake(self.centerX, floor(centerY * scale));
}

- (CGFloat)centerY
{
    return CGRectGetMidY(self.frame);
}

- (CGSize)size
{
    return self.frame.size;
}

- (void)setSize:(CGSize)size
{
    CGFloat scale = [UIScreen mainScreen].scale;
    size.width = floor(size.width * scale) / scale;
    size.height = floor(size.height * scale) / scale;
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
    CGFloat scale = [UIScreen mainScreen].scale;
    origin.x = floor(origin.x * scale) / scale;
    origin.y = floor(origin.y * scale) / scale;
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
