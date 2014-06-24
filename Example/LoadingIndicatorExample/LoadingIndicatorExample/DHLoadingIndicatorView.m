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
@property (nonatomic,strong) UIActivityIndicatorView *activityIndicator;
@property (nonatomic,strong) UILabel *indicatorLabel;
@property (nonatomic,strong) UIView *indicatorContainer;

@end

@implementation DHLoadingIndicatorView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createSubclasses];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self createSubclasses];
    }
    return self;
}


#pragma mark - Private Methods
- (void)createSubclasses
{
    self.activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    self.indicatorLabel = [[UILabel alloc] init];
    self.indicatorLabel.text = @"Loading...";
    self.indicatorContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 120, 20)];
    [self.indicatorContainer addSubview:self.activityIndicator];
    self.activityIndicator.frame = CGRectMake(0, 0, 20, 20);
    [self.activityIndicator startAnimating];
    [self.indicatorContainer addSubview:self.indicatorLabel];
    self.indicatorLabel.frame = CGRectMake(21, 0, 100, 20);
    
    [self addSubview:self.indicatorContainer];
    [self.indicatorContainer setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    NSLayoutConstraint *xConstraint = [NSLayoutConstraint constraintWithItem:self.indicatorContainer attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
    NSLayoutConstraint *yConstraint = [NSLayoutConstraint constraintWithItem:self.indicatorContainer attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0];
    NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:self.indicatorContainer attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1.0 constant:120];
    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:self.indicatorContainer attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1.0 constant:20];
    
    [self addConstraints:@[xConstraint,yConstraint]];
    [self.indicatorContainer addConstraints:@[widthConstraint,heightConstraint]];
}

@end
