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

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [[UIButton alloc] init];
    button.backgroundColor = [UIColor cyanColor];
    [button setTitleColor:[UIColor brownColor] forState:UIControlStateNormal];
    [button setTitle:@"12345" forState:UIControlStateNormal];
    [button setImage:[UIImage imageWithColor:[UIColor redColor] size:CGSizeMake(50, 50)] forState:UIControlStateNormal];
    button.frame = CGRectMake(100, 200, 200, 100);
    [self.view addSubview:button];
    [button titleImageCenterStyleWithOffset:20];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
