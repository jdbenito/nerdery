//
//  ImageBrowserCell.h
//  ImageBrowserViewTest
//
//  Created by JD on 2012-10-22.
//  Copyright (c) 2012 JD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Quartz/Quartz.h>

@interface ImageBrowserCell : IKImageBrowserCell {
    BOOL _isShowingOverlay;
}

@property (readonly) BOOL isShowingOverlay;

- (void)setShowOverlay:(BOOL)boolValue_;
@end
