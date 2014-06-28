//
//  DHLoadingIndicatorView.m
//  LoadingIndicatorExample
//
//  Created by David House on 6/23/14.
//  Copyright (c) 2014 Random Accident. All rights reserved.
//

#import "DHLoadingIndicatorView.h"

@interface DHLoadingIndicatorView()

#pragma mark - Properties
@property (nonatomic,strong) NSArray *indicatorContainerCenterConstraints;
@property (nonatomic,strong) NSArray *indicatorContainerSizeConstraints;
@property (nonatomic,strong) NSArray *innerFrameCenterConstraints;
@property (nonatomic,strong) NSArray *innerFrameSizeConstraints;

@end

@implementation DHLoadingIndicatorView

#pragma mark - Initializer
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self assignDefaults];
        [self createSubclasses];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self assignDefaults];
        [self createSubclasses];
    }
    return self;
}

#pragma mark - Property setters
- (void)setInnerMargin:(NSNumber *)innerMargin
{
    _innerMargin = innerMargin;
    [self setNeedsLayout];
}

- (void)setTextOrientation:(DHLoadingIndicatorViewTextOrientation)textOrientation
{
    _textOrientation = textOrientation;
    [self setNeedsLayout];
}

- (void)setInnerFrameMargin:(NSNumber *)innerFrameMargin
{
    _innerFrameMargin = innerFrameMargin;
    [self setNeedsLayout];
}

#pragma mark - Private Methods
- (void)assignDefaults
{
    _innerMargin = @0;
    _innerFrameMargin = @10;
    _textOrientation = DHLoadingIndicatorViewTextOrientationRight;
}

- (void)layoutSubviews
{
    // Setup the size of things
    CGSize labelSize = [self.indicatorLabel sizeThatFits:self.indicatorLabel.frame.size];
    CGSize activitySize;
    if ( self.activityIndicator.hidden == YES ) {
        activitySize = CGSizeMake(0, 0);
    }
    else {
        activitySize = CGSizeMake(20, 20);
    }
    
    CGSize indicatorContainerSize;
    switch ( self.textOrientation ) {
        case DHLoadingIndicatorViewTextOrientationNone:
            indicatorContainerSize = activitySize;
            break;
        case DHLoadingIndicatorViewTextOrientationRight:
        case DHLoadingIndicatorViewTextOrientationLeft:
            indicatorContainerSize = CGSizeMake(activitySize.width + labelSize.width + [self.innerMargin intValue], MAX(activitySize.height, labelSize.height));
            break;
        case DHLoadingIndicatorViewTextOrientationTop:
        case DHLoadingIndicatorViewTextOrientationBottom:
            indicatorContainerSize = CGSizeMake(MAX(activitySize.width,labelSize.width), labelSize.height + activitySize.height + [self.innerMargin intValue]);
            break;
    }

    // Now do some layout inside the container
    switch ( self.textOrientation ) {
        case DHLoadingIndicatorViewTextOrientationNone:
            self.activityIndicator.frame = CGRectMake(0, 0, activitySize.width, activitySize.height);
            self.indicatorLabel.frame = CGRectMake(0, 0, 0, 0);
            break;
        case DHLoadingIndicatorViewTextOrientationRight:
            self.activityIndicator.frame = CGRectMake(0, 0, activitySize.width, activitySize.height);
            self.indicatorLabel.frame = CGRectMake(activitySize.width + [self.innerMargin intValue], 0, labelSize.width, labelSize.height);
            break;
        case DHLoadingIndicatorViewTextOrientationLeft:
            self.activityIndicator.frame = CGRectMake(labelSize.width + [self.innerMargin intValue], 0, activitySize.width, activitySize.height);
            self.indicatorLabel.frame = CGRectMake(0, 0, labelSize.width, labelSize.height);
            break;
        case DHLoadingIndicatorViewTextOrientationTop:
            self.activityIndicator.frame = CGRectMake(indicatorContainerSize.width / 2 - (activitySize.width / 2), labelSize.height + [self.innerMargin intValue], activitySize.width, activitySize.height);
            self.indicatorLabel.frame = CGRectMake(0, 0, labelSize.width,labelSize.height);
            break;
        case DHLoadingIndicatorViewTextOrientationBottom:
            self.activityIndicator.frame = CGRectMake(indicatorContainerSize.width / 2 - (activitySize.width / 2), 0, activitySize.width, activitySize.height);
            self.indicatorLabel.frame = CGRectMake(0, activitySize.height + [self.innerMargin intValue], labelSize.width,labelSize.height);
            break;
    }
    
    // Clear the constraints and rebuild them
    if ( self.indicatorContainerCenterConstraints ) {
        [self removeConstraints:self.indicatorContainerCenterConstraints];
        self.indicatorContainerCenterConstraints = nil;
    }
    
    if ( self.indicatorContainerSizeConstraints ) {
        [self.indicatorContainer removeConstraints:self.indicatorContainerSizeConstraints];
        self.indicatorContainerSizeConstraints = nil;
    }
    
    NSLayoutConstraint *xConstraint = [NSLayoutConstraint constraintWithItem:self.indicatorContainer attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
    NSLayoutConstraint *yConstraint = [NSLayoutConstraint constraintWithItem:self.indicatorContainer attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0];
    NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:self.indicatorContainer attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1.0 constant:indicatorContainerSize.width];
    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:self.indicatorContainer attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1.0 constant:indicatorContainerSize.height];
    
    self.indicatorContainerSizeConstraints = @[widthConstraint,heightConstraint];
    self.indicatorContainerCenterConstraints = @[xConstraint,yConstraint];
    
    [self addConstraints:@[xConstraint,yConstraint]];
    [self.indicatorContainer addConstraints:@[widthConstraint,heightConstraint]];
    
    // Now the inner frame
    if ( self.innerFrameCenterConstraints ) {
        [self removeConstraints:self.innerFrameCenterConstraints];
        self.innerFrameCenterConstraints = nil;
    }
    
    if ( self.innerFrameSizeConstraints ) {
        [self.innerFrame removeConstraints:self.innerFrameSizeConstraints];
        self.innerFrameSizeConstraints = nil;
    }

    CGSize innerFrameSize = CGSizeMake(indicatorContainerSize.width + ([self.innerFrameMargin intValue] * 2), indicatorContainerSize.height + ([self.innerFrameMargin intValue] * 2));
    
    NSLayoutConstraint *xInnerFrameConstraint = [NSLayoutConstraint constraintWithItem:self.innerFrame attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
    NSLayoutConstraint *yInnerFrameConstraint = [NSLayoutConstraint constraintWithItem:self.innerFrame attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0];
    NSLayoutConstraint *widthInnerFrameConstraint = [NSLayoutConstraint constraintWithItem:self.innerFrame attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1.0 constant:innerFrameSize.width];
    NSLayoutConstraint *heightInnerFrameConstraint = [NSLayoutConstraint constraintWithItem:self.innerFrame attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1.0 constant:innerFrameSize.height];
    
    self.innerFrameSizeConstraints = @[widthInnerFrameConstraint,heightInnerFrameConstraint];
    self.innerFrameCenterConstraints = @[xInnerFrameConstraint,yInnerFrameConstraint];
    
    [self addConstraints:@[xInnerFrameConstraint,yInnerFrameConstraint]];
    [self.innerFrame addConstraints:@[widthInnerFrameConstraint,heightInnerFrameConstraint]];
    
    [super layoutSubviews];
}

- (void)createSubclasses
{
    self.innerFrame = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    [self.innerFrame setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.innerFrame.hidden = YES;
    [self addSubview:self.innerFrame];

    self.activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [self.activityIndicator startAnimating];
    self.indicatorLabel = [[UILabel alloc] init];
    self.indicatorLabel.text = @"Loading...";
    self.indicatorContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    [self.indicatorContainer addSubview:self.activityIndicator];
    [self.indicatorContainer addSubview:self.indicatorLabel];
    [self addSubview:self.indicatorContainer];
    [self.indicatorContainer setTranslatesAutoresizingMaskIntoConstraints:NO];
}

@end
