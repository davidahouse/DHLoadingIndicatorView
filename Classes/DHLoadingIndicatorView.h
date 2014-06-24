//
//  DHLoadingIndicatorView.h
//  LoadingIndicatorExample
//
//  Created by David House on 6/23/14.
//  Copyright (c) 2014 Random Accident. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, DHLoadingIndicatorViewTextOrientation) {
    DHLoadingIndicatorViewTextOrientationNone,
    DHLoadingIndicatorViewTextOrientationRight,
    DHLoadingIndicatorViewTextOrientationLeft,
    DHLoadingIndicatorViewTextOrientationTop,
    DHLoadingIndicatorViewTextOrientationBottom
};

@interface DHLoadingIndicatorView : UIView

#pragma mark - Content Views
@property (nonatomic,strong) UIActivityIndicatorView *activityIndicator;
@property (nonatomic,strong) UILabel *indicatorLabel;
@property (nonatomic,strong) UIView *indicatorContainer;
@property (nonatomic,strong) UIView *innerFrame;

#pragma mark - Properties
@property (nonatomic,strong) NSNumber *innerMargin;
@property (nonatomic,strong) NSNumber *innerFrameMargin;
@property (nonatomic,assign) DHLoadingIndicatorViewTextOrientation textOrientation;

@end
