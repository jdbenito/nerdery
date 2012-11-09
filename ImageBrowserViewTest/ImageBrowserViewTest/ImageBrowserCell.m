//
//  ImageBrowserCell.m
//  ImageBrowserViewTest
//
//  Created by JD on 2012-10-22.
//  Copyright (c) 2012 JD. All rights reserved.
//

#import "ImageBrowserCell.h"

@implementation ImageBrowserCell
@synthesize isShowingOverlay = _isShowingOverlay;

- (id)init {
    self = [super init];
    if (self != nil) {
        _isShowingOverlay = NO;
    }
    return self;
}

- (void)setShowOverlay:(BOOL)boolValue_ {
    BOOL wasShowingOverlay = _isShowingOverlay;
    _isShowingOverlay = boolValue_;

    
    if (wasShowingOverlay != _isShowingOverlay) {
        // If there was a change in state, redraw the area that the cell occupies
        [[self imageBrowserView] setNeedsDisplayInRect:[self frame]];
    }
}


- (CALayer *)layerForType:(NSString *)type {
    if (type == IKImageBrowserCellSelectionLayer) {
        CALayer *selectionLayer = [CALayer layer];
        NSRect targetFrame = [self selectionFrame];
        [selectionLayer setFrame:CGRectMake(0, 0, targetFrame.size.width, targetFrame.size.height)];
        [selectionLayer setBackgroundColor:[[NSColor alternateSelectedControlColor] cgColorRef]];
        [selectionLayer setBorderColor:[[NSColor blueColor] cgColorRef]];
        [selectionLayer setBorderWidth:1];
        [selectionLayer setZPosition:-100];
        return selectionLayer;
    }
    if (type == IKImageBrowserCellForegroundLayer) {
        if ([self isShowingOverlay] == YES) {
            CALayer *foregroundLayer = [CALayer layer];
            NSRect targetFrame = NSInsetRect([self imageFrame], 3, 3);
            [foregroundLayer setFrame:CGRectMake(0, 0, targetFrame.size.width, targetFrame.size.height)];
            
            [foregroundLayer setBackgroundColor:[[NSColor redColor] cgColorRef]];
            [foregroundLayer setBorderColor:[[NSColor redColor] cgColorRef]];
            [foregroundLayer setBorderWidth:1];
            [foregroundLayer setOpacity:0.3];
            [foregroundLayer setZPosition:100];
            return foregroundLayer;
        }
        else {
            return nil;
        }
    }
    return [super layerForType:type];
}

@end
