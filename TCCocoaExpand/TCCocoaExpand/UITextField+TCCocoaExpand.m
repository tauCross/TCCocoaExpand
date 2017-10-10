//
//  UITextField+TCCocoaExpand.m
//  TCCocoaExpand
//
//  Created by tauCross on 2017/10/10.
//  Copyright © 2017年 tauCross. All rights reserved.
//

#import "UITextField+TCCocoaExpand.h"

#import "UIApplication+TCCocoaExpand.h"

#import <objc/runtime.h>



static char tc_text_field_allow_custom_keyboard;
static char tc_text_field_delegate;



@interface UITextField ()<UITextFieldDelegate>

@property(nonatomic, weak)id<UITextFieldDelegate> tc_delegate;

@end


@implementation UITextField (TCCocoaExpand)

+ (void)load
{
    Method oriMethod = class_getInstanceMethod(self, @selector(layoutSubviews));
    Method tcMethod = class_getInstanceMethod(self, @selector(tc_layoutSubviews));
    method_exchangeImplementations(oriMethod, tcMethod);
}

- (void)setDelegate:(id<UITextFieldDelegate>)delegate
{
    [self setTc_delegate:delegate];
}

- (id<UITextFieldDelegate>)delegate
{
    return [self tc_delegate];
}

- (void)tc_layoutSubviews
{
    [self setValue:self forKey:@"_delegate"];
    [self tc_layoutSubviews];
}

#pragma mark - property
- (void)setTc_delegate:(id<UITextFieldDelegate>)tc_delegate
{
    objc_setAssociatedObject(self, &tc_text_field_delegate, tc_delegate, OBJC_ASSOCIATION_ASSIGN);
}

- (id<UITextFieldDelegate>)tc_delegate
{
    return objc_getAssociatedObject(self, &tc_text_field_delegate);
}

- (void)setTc_allowCustomKeyboard:(BOOL)tc_allowCustomKeyboard
{
    objc_setAssociatedObject(self, &tc_text_field_allow_custom_keyboard, @(tc_allowCustomKeyboard), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)tc_allowCustomKeyboard
{
    NSNumber *n = objc_getAssociatedObject(self, &tc_text_field_allow_custom_keyboard);
    if(n)
    {
        return n.boolValue;
    }
    return YES;
}

#pragma mark - UITextfieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [UIApplication sharedApplication].tc_allowCustomKeyboard = self.tc_allowCustomKeyboard;
    if(self.tc_delegate != self && [self.tc_delegate respondsToSelector:_cmd])
    {
        return [self.tc_delegate textFieldShouldBeginEditing:textField];
    }
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if(self.tc_delegate != self && [self.tc_delegate respondsToSelector:_cmd])
    {
        [self.tc_delegate textFieldDidBeginEditing:textField];
    }
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    if(self.tc_delegate != self && [self.tc_delegate respondsToSelector:_cmd])
    {
        return [self.tc_delegate textFieldShouldEndEditing:textField];
    }
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if(self.tc_delegate != self && [self.tc_delegate respondsToSelector:_cmd])
    {
        [self.tc_delegate textFieldDidEndEditing:textField];
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField reason:(UITextFieldDidEndEditingReason)reason
{
    if(self.tc_delegate != self && [self.tc_delegate respondsToSelector:_cmd])
    {
        [self.tc_delegate textFieldDidEndEditing:textField reason:reason];
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if(self.tc_delegate != self && [self.tc_delegate respondsToSelector:_cmd])
    {
        [self.tc_delegate textField:textField shouldChangeCharactersInRange:range replacementString:string];
    }
    return YES;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    if(self.tc_delegate != self && [self.tc_delegate respondsToSelector:_cmd])
    {
        return [self.tc_delegate textFieldShouldClear:textField];
    }
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if(self.tc_delegate != self && [self.tc_delegate respondsToSelector:_cmd])
    {
        return [self.tc_delegate textFieldShouldReturn:textField];
    }
    return YES;
}

@end
