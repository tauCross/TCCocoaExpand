//
//  UITextView+TCCocoaExpand.m
//  TCCocoaExpand
//
//  Created by tauCross on 2017/10/10.
//  Copyright © 2017年 tauCross. All rights reserved.
//

#import "UITextView+TCCocoaExpand.h"

#import "UIApplication+TCCocoaExpand.h"

#import <objc/runtime.h>



static char tc_text_view_allow_custom_keyboard;
static char tc_text_view_delegate;



@interface UITextView ()<UITextViewDelegate>

@property(nonatomic, weak, nullable)id<UITextViewDelegate> tc_delegate;

@end


@implementation UITextView (TCCocoaExpand)

+ (void)load
{
    Method oriMethod = class_getInstanceMethod(self, @selector(layoutSubviews));
    Method tcMethod = class_getInstanceMethod(self, @selector(tc_layoutSubviews));
    method_exchangeImplementations(oriMethod, tcMethod);
}

- (void)setDelegate:(id<UITextViewDelegate>)delegate
{
    [self setTc_delegate:delegate];
}

- (id<UITextViewDelegate>)delegate
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
    objc_setAssociatedObject(self, &tc_text_view_delegate, tc_delegate, OBJC_ASSOCIATION_ASSIGN);
}

- (id<UITextFieldDelegate>)tc_delegate
{
    return objc_getAssociatedObject(self, &tc_text_view_delegate);
}

- (void)setTc_allowCustomKeyboard:(BOOL)tc_allowCustomKeyboard
{
    objc_setAssociatedObject(self, &tc_text_view_allow_custom_keyboard, @(tc_allowCustomKeyboard), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)tc_allowCustomKeyboard
{
    NSNumber *n = objc_getAssociatedObject(self, &tc_text_view_allow_custom_keyboard);
    if(n)
    {
        return n.boolValue;
    }
    return YES;
}

#pragma mark - UITextViewDelegate
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    [UIApplication sharedApplication].tc_allowCustomKeyboard = self.tc_allowCustomKeyboard;
    if(self.tc_delegate != self && [self.tc_delegate respondsToSelector:_cmd])
    {
        return [self.tc_delegate textViewShouldBeginEditing:textView];
    }
    return YES;
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView
{
    if(self.tc_delegate != self && [self.tc_delegate respondsToSelector:_cmd])
    {
        return [self.tc_delegate textViewShouldEndEditing:textView];
    }
    return YES;
}

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    if(self.tc_delegate != self && [self.tc_delegate respondsToSelector:_cmd])
    {
        [self.tc_delegate textViewDidBeginEditing:textView];
    }
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    if(self.tc_delegate != self && [self.tc_delegate respondsToSelector:_cmd])
    {
        [self.tc_delegate textViewDidEndEditing:textView];
    }
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if(self.tc_delegate != self && [self.tc_delegate respondsToSelector:_cmd])
    {
        return [self.tc_delegate textView:textView shouldChangeTextInRange:range replacementText:text];
    }
    return YES;
}

- (void)textViewDidChange:(UITextView *)textView
{
    if(self.tc_delegate != self && [self.tc_delegate respondsToSelector:_cmd])
    {
        [self.tc_delegate textViewDidChange:textView];
    }
}

- (void)textViewDidChangeSelection:(UITextView *)textView
{
    if(self.tc_delegate != self && [self.tc_delegate respondsToSelector:_cmd])
    {
        [self.tc_delegate textViewDidChangeSelection:textView];
    }
}

- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange interaction:(UITextItemInteraction)interaction
{
    if(self.tc_delegate != self && [self.tc_delegate respondsToSelector:_cmd])
    {
        return [self.tc_delegate textView:textView shouldInteractWithURL:URL inRange:characterRange interaction:interaction];
    }
    return YES;
}

- (BOOL)textView:(UITextView *)textView shouldInteractWithTextAttachment:(NSTextAttachment *)textAttachment inRange:(NSRange)characterRange interaction:(UITextItemInteraction)interaction
{
    if(self.tc_delegate != self && [self.tc_delegate respondsToSelector:_cmd])
    {
        return [self.tc_delegate textView:textView shouldInteractWithTextAttachment:textAttachment inRange:characterRange interaction:interaction];
    }
    return YES;
}

- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange
{
    if(self.tc_delegate != self && [self.tc_delegate respondsToSelector:_cmd])
    {
        return [self.tc_delegate textView:textView shouldInteractWithURL:URL inRange:characterRange];
    }
    return YES;
}

- (BOOL)textView:(UITextView *)textView shouldInteractWithTextAttachment:(NSTextAttachment *)textAttachment inRange:(NSRange)characterRange
{
    if(self.tc_delegate != self && [self.tc_delegate respondsToSelector:_cmd])
    {
        return [self.tc_delegate textView:textView shouldInteractWithTextAttachment:textAttachment inRange:characterRange];
    }
    return YES;
}

@end
