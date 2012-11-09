//
//  ImageBrowserView.m
//  ImageBrowserViewTest
//
//  Created by JD on 2012-10-22.
//  Copyright (c) 2012 JD. All rights reserved.
//

#import "ImageBrowserView.h"
#import "ImageBrowserCell.h"

@interface ImageBrowserView ()

- (void)showOverlayWhenApplicable:(NSEvent *)theEvent;
- (void)setupTrackingArea;    
@end

@implementation ImageBrowserView

- (ImageBrowserCell *)newCellForRepresentedItem:(id)anItem {
    return [ImageBrowserCell new];
}

- (void)awakeFromNib {
    _lastMouseOverIndex = NSNotFound;
    
    [self setupTrackingArea];
}

- (void)showOverlayWhenApplicable:(NSEvent *)theEvent {
    NSPoint mouseLocationInBrowserView = [self convertPoint:[theEvent locationInWindow] fromView:nil];
    NSInteger currentMouseOverIndex = [self indexOfItemAtPoint:mouseLocationInBrowserView];
    if (currentMouseOverIndex != NSNotFound) {
        // We are hovering over a valid cell
        ImageBrowserCell *currentCell = (ImageBrowserCell *)[self cellForItemAtIndex:currentMouseOverIndex];
        [currentCell setShowOverlay:YES];
        
        if ((_lastMouseOverIndex != NSNotFound) && (_lastMouseOverIndex != currentMouseOverIndex)){
            ImageBrowserCell *lastMouseOverCell = (ImageBrowserCell *)[self cellForItemAtIndex:_lastMouseOverIndex];
            [lastMouseOverCell setShowOverlay:NO];
        }
    }
    else {
        // We are hovering over the free-space area of the image browser view
        if (_lastMouseOverIndex != NSNotFound) {
            ImageBrowserCell *lastMouseOverCell = (ImageBrowserCell *)[self cellForItemAtIndex:_lastMouseOverIndex];
            [lastMouseOverCell setShowOverlay:NO];
        }
    }
    _lastMouseOverIndex = currentMouseOverIndex;
}

- (void)setupTrackingArea {
    NSTrackingArea *trackingArea = [[[NSTrackingArea alloc] initWithRect:[self frame] 
                                                                 options: (NSTrackingInVisibleRect | NSTrackingMouseMoved | NSTrackingMouseEnteredAndExited | NSTrackingActiveInActiveApp) 
                                                                   owner:self
                                                                userInfo:nil] autorelease];
    [self addTrackingArea:trackingArea];
}

- (void)mouseEntered:(NSEvent *)theEvent {
    [self showOverlayWhenApplicable:theEvent];
    [super mouseEntered:theEvent];
}

- (void)mouseExited:(NSEvent *)theEvent {
    if (_lastMouseOverIndex != NSNotFound) {
        ImageBrowserCell *lastMouseOverCell = (ImageBrowserCell *)[self cellForItemAtIndex:_lastMouseOverIndex];
        [lastMouseOverCell setShowOverlay:NO];
    }
    [super mouseExited:theEvent];
}

- (void)mouseMoved:(NSEvent *)theEvent {
    [self showOverlayWhenApplicable:theEvent];
    [super mouseMoved:theEvent];
}

@end
