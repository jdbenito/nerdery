//
//  ImageBrowserView.h
//  ImageBrowserViewTest
//
//  Created by JD on 2012-10-22.
//  Copyright (c) 2012 JD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Quartz/Quartz.h>

@interface ImageBrowserView : IKImageBrowserView {

@private
    NSUInteger _lastMouseOverIndex;
}

@end
