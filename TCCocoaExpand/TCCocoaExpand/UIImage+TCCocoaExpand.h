//
//  UIImage+TCCocoaExpand.h
//  TCCocoaExpand
//
//  Created by tauCross on 16/4/15.
//  Copyright © 2016年 tauCross. All rights reserved.
//

#import <UIKit/UIKit.h>



#define TCImage(macro_image_name) [UIImage imageNamed:macro_image_name]



typedef enum  {
    UIImageGradientTypeTopToBottom,
    UIImageGradientTypeLeftToRight,
    UIImageGradientTypeTopLeftToBottomRight,
    UIImageGradientTypeTopRightToBottomLeft
}UIImageGradientType;



@interface UIImage (TCCocoaExpand)

+ (UIImage *)gradientImageFromColors:(NSArray*)colors ByGradientType:(UIImageGradientType)gradientType size:(CGSize)size;
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;
- (UIImage *)scaleToSize:(CGSize)size;
- (UIImage *)subImage:(CGRect)rect;

@end
