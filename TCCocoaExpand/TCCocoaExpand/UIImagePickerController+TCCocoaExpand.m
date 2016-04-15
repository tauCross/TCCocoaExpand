//
//  UIImagePickerController+TCCocoaExpand.m
//  TCCocoaExpand
//
//  Created by tauCross on 16/4/15.
//  Copyright © 2016年 tauCross. All rights reserved.
//

#import "UIImagePickerController+TCCocoaExpand.h"

#import <objc/runtime.h>



static char image_picker_complete_block_key;
static char image_picker_cancel_block_key;



@implementation UIImagePickerController (TCCocoaExpand)

- (void)showFromViewController:(UIViewController *)controller completeBlock:(ImagePickerCompleteBlock)completeBlock cancelBlock:(ImagePickerCancelBlock)cancelBlock
{
    if(completeBlock)
    {
        objc_setAssociatedObject(self, &image_picker_complete_block_key, completeBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
    if(cancelBlock)
    {
        objc_setAssociatedObject(self, &image_picker_cancel_block_key, cancelBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
    self.delegate = self;
    
    [controller presentViewController:self animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    ImagePickerCompleteBlock block = objc_getAssociatedObject(self, &image_picker_complete_block_key);
    if(block)
    {
        block(picker, info);
    }
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    ImagePickerCancelBlock block = objc_getAssociatedObject(self, &image_picker_cancel_block_key);
    if(block)
    {
        block(picker);
    }
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if(self.sourceType == UIImagePickerControllerSourceTypePhotoLibrary)
    {
        UIView *custom = [[UIView alloc] initWithFrame:CGRectMake(0,0,0,0)];
        UIBarButtonItem *btn = [[UIBarButtonItem alloc] initWithCustomView:custom];
        [viewController.navigationItem setRightBarButtonItem:btn animated:NO];
    }
}


@end
