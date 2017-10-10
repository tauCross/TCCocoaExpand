//
//  ViewController.m
//  TCCocoaExpand
//
//  Created by tauCross on 16/4/15.
//  Copyright © 2016年 tauCross. All rights reserved.
//

#import "ViewController.h"

#import "UIButton+TCCocoaExpand.h"
#import "UIImage+TCCocoaExpand.h"

@interface ViewController ()<UITextFieldDelegate, UITextViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    {
        UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(20, 20, 200, 44)];
        textField.backgroundColor = [UIColor brownColor];
        textField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
        [self.view addSubview:textField];
    }
    {
        UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(20, 80, 200, 44)];
        textField.backgroundColor = [UIColor cyanColor];
        textField.keyboardType = UIKeyboardTypeNumberPad;
        [self.view addSubview:textField];
    }
    {
        UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(20, 140, 200, 44)];
        textField.backgroundColor = [UIColor yellowColor];
        [self.view addSubview:textField];
    }
    {
        UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(20, 200, 200, 44)];
        textView.backgroundColor = [UIColor redColor];
        textView.delegate = self;
        textView.tc_allowCustomKeyboard = NO;
        [self.view addSubview:textView];
    }
    {
        UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(20, 260, 200, 44)];
        textView.backgroundColor = [UIColor grayColor];
        textView.tc_allowCustomKeyboard = NO;
        [self.view addSubview:textView];
    }
    {
        UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(20, 320, 200, 44)];
        textView.backgroundColor = [UIColor grayColor];
        textView.delegate = self;
        textView.tc_allowCustomKeyboard = NO;
        [self.view addSubview:textView];
    }
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

@end
