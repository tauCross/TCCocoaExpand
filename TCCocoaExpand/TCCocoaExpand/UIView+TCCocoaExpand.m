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

- (void)setTc_x:(CGFloat)tc_x
{
    CGFloat scale = [UIScreen mainScreen].scale;
    self.frame = CGRectMake(floor(tc_x * scale) / scale, self.tc_y, self.tc_width, self.tc_height);
}

- (CGFloat)tc_x
{
    return CGRectGetMinX(self.frame);
}

- (void)setTc_y:(CGFloat)tc_y
{
    CGFloat scale = [UIScreen mainScreen].scale;
    self.frame = CGRectMake(self.tc_x, floor(tc_y * scale) / scale, self.tc_width, self.tc_height);
}

- (CGFloat)tc_y
{
    return CGRectGetMinY(self.frame);
}

- (void)setTc_width:(CGFloat)tc_width
{
    CGFloat scale = [UIScreen mainScreen].scale;
    self.frame = CGRectMake(self.tc_x, self.tc_y, floor(tc_width * scale) / scale, self.tc_height);
}

- (CGFloat)tc_width
{
    return CGRectGetWidth(self.frame);
}

- (void)setTc_height:(CGFloat)tc_height
{
    CGFloat scale = [UIScreen mainScreen].scale;
    self.frame = CGRectMake(self.tc_x, self.tc_y, self.tc_width, floor(tc_height * scale) / scale);
}

- (CGFloat)tc_height
{
    return CGRectGetHeight(self.frame);
}

- (void)setTc_top:(CGFloat)tc_top
{
    self.tc_y = tc_top;
}

- (CGFloat)tc_top
{
    return self.tc_y;
}

- (void)setTc_bottom:(CGFloat)tc_bottom
{
    CGFloat scale = [UIScreen mainScreen].scale;
    self.frame = CGRectMake(self.tc_x, floor(tc_bottom * scale) / scale - self.tc_height, self.tc_width, self.tc_height);
}

- (CGFloat)tc_bottom
{
    return CGRectGetMaxY(self.frame);
}

- (void)setTc_left:(CGFloat)tc_left
{
    self.tc_x = tc_left;
}

- (CGFloat)tc_left
{
    return self.tc_x;
}

- (void)setTc_right:(CGFloat)tc_right
{
    CGFloat scale = [UIScreen mainScreen].scale;
    self.frame = CGRectMake(floor(tc_right * scale) / scale - self.tc_width, self.tc_y, self.tc_width, self.tc_height);
}

- (CGFloat)tc_right
{
    return CGRectGetMaxX(self.frame);
}

- (void)setTc_centerX:(CGFloat)tc_centerX
{
    self.tc_left = tc_centerX - self.tc_width / 2;
}

- (CGFloat)tc_centerX
{
    return CGRectGetMidX(self.frame);
}

- (void)setTc_centerY:(CGFloat)tc_centerY
{
    self.tc_top = tc_centerY - self.tc_height / 2;
}

- (CGFloat)tc_centerY
{
    return CGRectGetMidY(self.frame);
}

- (CGSize)tc_size
{
    return self.frame.size;
}

- (void)setTc_size:(CGSize)tc_size
{
    CGFloat scale = [UIScreen mainScreen].scale;
    tc_size.width = floor(tc_size.width * scale) / scale;
    tc_size.height = floor(tc_size.height * scale) / scale;
    CGRect frame = self.frame;
    frame.size = tc_size;
    self.frame = frame;
}

- (CGPoint)tc_origin
{
    return self.frame.origin;
}

- (void)setTc_origin:(CGPoint)tc_origin
{
    CGFloat scale = [UIScreen mainScreen].scale;
    tc_origin.x = floor(tc_origin.x * scale) / scale;
    tc_origin.y = floor(tc_origin.y * scale) / scale;
    CGRect frame = self.frame;
    frame.origin = tc_origin;
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
