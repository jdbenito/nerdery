//
//  NSColor+Additions.m
//  ImageBrowserViewTest
//
//  Created by JD Benito on 12-10-23.
//  Copyright (c) 2012 JD. All rights reserved.
//

#import "NSColor+Additions.h"

@implementation NSColor (Additions)

- (CGColorRef)cgColorRef {
    // Get the equivalent NSColor of self in a color space that support 'numberOfComponents'
    NSColor *sourceColor = [self colorUsingColorSpaceName:NSCalibratedRGBColorSpace];
    NSInteger numberOfComponents = [sourceColor numberOfComponents];
    CGFloat components[numberOfComponents];
    [sourceColor getComponents:(CGFloat *)&components];
    CGColorSpaceRef colorSpace = [[sourceColor colorSpace] CGColorSpace];
    return (CGColorRef)[(id)CGColorCreate(colorSpace, components) autorelease];
}

@end
