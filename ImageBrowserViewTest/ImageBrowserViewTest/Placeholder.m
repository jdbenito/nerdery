//
//  Placeholder.m
//  ImageBrowserViewTest
//
//  Created by JD on 2012-10-22.
//  Copyright (c) 2012 JD. All rights reserved.
//

#import "Placeholder.h"
#import <Quartz/Quartz.h>

static Placeholder *sharedPlaceholder = nil;

@implementation Placeholder
+ (Placeholder *)sharedPlaceholder {
    if (sharedPlaceholder == nil) {
        sharedPlaceholder = [Placeholder new];
    }
    return sharedPlaceholder;
}

#pragma mark - IKImageBrowserItem (informal protocol)
- (NSString *)imageUID {
    return NSStringFromClass([self class]);                     // Return a unique string that identifies the data source item.
}

- (NSString *)imageTitle {
    return @"Title";
}

- (NSString *)imageSubtitle {
    return @"Subtitle";
}

- (NSString *) imageRepresentationType {
    return IKImageBrowserNSImageRepresentationType;             // Specify that we will return an NSImage type in -imageRepresentation
}

- (id) imageRepresentation {
    return [NSImage imageNamed:@"sample3d"];     // Return the empty placeholder image
}
@end