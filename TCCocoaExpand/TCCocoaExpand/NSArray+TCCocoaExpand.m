//
//  NSArray+TCCocoaExpand.m
//  TCCocoaExpand
//
//  Created by tauCross on 16/4/15.
//  Copyright © 2016年 tauCross. All rights reserved.
//

#import "NSArray+TCCocoaExpand.h"



@implementation NSArray (TCCocoaExpand)

- (NSArray *)reversal
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:self.count];
    for(NSUInteger i = 0; i < self.count; i ++)
    {
        id object = [self objectAtIndex:i];
        [array insertObject:object atIndex:0];
    }
    return array;
}

@end
