//
//  UIView+TCCocoaExpand.h
//  TCCocoaExpand
//
//  Created by tauCross on 16/4/15.
//  Copyright © 2016年 tauCross. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface UIView (TCCocoaExpand)

@property(nonatomic, assign)CGFloat x;
@property(nonatomic, assign)CGFloat y;
@property(nonatomic, assign)CGFloat width;
@property(nonatomic, assign)CGFloat height;
@property(nonatomic, assign)CGFloat top;
@property(nonatomic, assign)CGFloat bottom;
@property(nonatomic, assign)CGFloat left;
@property(nonatomic, assign)CGFloat right;
@property(nonatomic, assign)CGFloat centerX;
@property(nonatomic, assign)CGFloat centerY;
@property(nonatomic, assign)CGPoint origin;
@property(nonatomic, assign)CGSize size;

- (void)removeAllSubView;

@end
