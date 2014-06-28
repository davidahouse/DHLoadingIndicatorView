//
//  DHLoadingIndicatorView.h
//  DHLoadingIndicatorView
//
//  Created by David House on 6/23/14.
//  Copyright (c) 2014 David House <davidahouse@gmail.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to
//  deal in the Software without restriction, including without limitation the
//  rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
//  sell copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
//  DEALINGS IN THE SOFTWARE.
//
#import <UIKit/UIKit.h>

/** DHLoadingIndicatorViewTextOrientation specifies the orientation of the
    text portion of the loading view.
 */
typedef NS_ENUM(NSUInteger, DHLoadingIndicatorViewTextOrientation) {
    DHLoadingIndicatorViewTextOrientationNone,
    DHLoadingIndicatorViewTextOrientationRight,
    DHLoadingIndicatorViewTextOrientationLeft,
    DHLoadingIndicatorViewTextOrientationTop,
    DHLoadingIndicatorViewTextOrientationBottom
};

/** The DHLoadingIndicatorView provides a view that displays an activity indicator
 and optional text in an easy to create view.
 */
@interface DHLoadingIndicatorView : UIView

#pragma mark - Content Views
/** 
 The activity indicator subview. Use this to change the display of the indicator.
 */
@property (nonatomic,strong) UIActivityIndicatorView *activityIndicator;

/**
 The indicator label subview. This label is positioned based on the textOrientation property. You
 can set any of the other properties to control the look of the label.
 */
@property (nonatomic,strong) UILabel *indicatorLabel;

/**
 The container subview that wraps the activity indicator and text.
 */
@property (nonatomic,strong) UIView *indicatorContainer;

/**
 The optional frame subview that goes around the activity indicator and text. This subview defaults to hidden.
 */
@property (nonatomic,strong) UIView *innerFrame;

#pragma mark - Properties
/**
 The innerMargin between the activity indicator and indicator label
 */
@property (nonatomic,strong) NSNumber *innerMargin;

/**
 The innerFrameMargin controls the size of the innerFrame
 */
@property (nonatomic,strong) NSNumber *innerFrameMargin;

/**
 The text orientation of the indicator label.
 */
@property (nonatomic,assign) DHLoadingIndicatorViewTextOrientation textOrientation;

@end
