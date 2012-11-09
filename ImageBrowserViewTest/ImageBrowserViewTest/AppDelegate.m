//
//  AppDelegate.m
//  ImageBrowserViewTest
//
//  Created by JD on 2012-10-22.
//  Copyright (c) 2012 JD. All rights reserved.
//

#import "AppDelegate.h"
#import "ImageBrowserView.h"
#import "Placeholder.h"

@interface AppDelegate ()
- (void)populateImageBrowserView;
@end


@implementation AppDelegate
@synthesize mainView;
@synthesize window;
@synthesize imageBrowserView;
@synthesize detailsBox;
@synthesize dataArray = _dataArray;

- (void)dealloc
{
    [_dataArray release];
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    _isShowingMore = NO;
    
    [[self window] makeKeyAndOrderFront:nil];
    [self populateImageBrowserView];
    
    
    // ***** UNCOMMENT THE FOLLOWING LINE TO TURN LAYER-BACKING ON *****
    [[self mainView] setWantsLayer:YES];
}

- (IBAction)toggleShowMore:(id)sender {
    _isShowingMore = !_isShowingMore;
    
    // Resize the details box
    NSRect targetFrame = [[self detailsBox] frame];
    if (_isShowingMore == YES) {
        targetFrame.size.height += 100;
    } else {
        targetFrame.size.height -= 100;
    }
    [[[self detailsBox] animator] setFrame:targetFrame];
}


#pragma mark - Private
- (void)populateImageBrowserView {
    // Populate the imageBrowserView with placeholders
    NSMutableArray *tempArray = [NSMutableArray array];
    for (int i = 0; i<=49; ++i) {
        [tempArray addObject:[Placeholder sharedPlaceholder]];      // Create 50 placeholder objects
    }
    [self setDataArray:tempArray];
}
@end
