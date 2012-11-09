//
//  AppDelegate.h
//  ImageBrowserViewTest
//
//  Created by JD on 2012-10-22.
//  Copyright (c) 2012 JD. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class ImageBrowserView;
@interface AppDelegate : NSObject <NSApplicationDelegate>
{
    NSArray *_dataArray;
    
    BOOL _isShowingMore;
}

@property (assign) IBOutlet NSView *mainView;
@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet ImageBrowserView *imageBrowserView;
@property (assign) IBOutlet NSBox *detailsBox;

@property (nonatomic, retain) NSArray *dataArray;
- (IBAction)toggleShowMore:(id)sender;

@end
