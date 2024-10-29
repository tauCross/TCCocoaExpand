//
//  UIView+TCCocoaExpand.h
//  TCCocoaExpand
//
//  Created by tauCross on 16/4/15.
//  Copyright © 2016年 tauCross. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface UIView (TCCocoaExpand)

@property(nonatomic, assign)CGFloat tc_x;
@property(nonatomic, assign)CGFloat tc_y;
@property(nonatomic, assign)CGFloat tc_width;
@property(nonatomic, assign)CGFloat tc_height;
@property(nonatomic, assign)CGFloat tc_top;
@property(nonatomic, assign)CGFloat tc_bottom;
@property(nonatomic, assign)CGFloat tc_left;
@property(nonatomic, assign)CGFloat tc_right;
@property(nonatomic, assign)CGFloat tc_centerX;
@property(nonatomic, assign)CGFloat tc_centerY;
@property(nonatomic, assign)CGPoint tc_origin;
@property(nonatomic, assign)CGSize tc_size;

- (void)removeAllSubView;

- (void)rotateTimerClockwiseSpeed:(CGFloat)speed;
- (void)stopTimerAnimation;

@end
