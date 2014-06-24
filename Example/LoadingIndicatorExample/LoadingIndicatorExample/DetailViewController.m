//
//  DetailViewController.m
//  LoadingIndicatorExample
//
//  Created by David House on 6/24/14.
//  Copyright (c) 2014 Random Accident. All rights reserved.
//

#import "DetailViewController.h"
#import <DHLoadingIndicatorView/DHLoadingIndicatorView.h>

@interface DetailViewController ()

#pragma mark - Properties
@property (weak, nonatomic) IBOutlet DHLoadingIndicatorView *indicatorView;

@end

@implementation DetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = self.exampleTitle;
    switch ( self.exampleIndex ) {
        case 0:
        {
            self.indicatorView.textOrientation = DHLoadingIndicatorViewTextOrientationRight;
        }
            break;
        case 1:
        {
            self.indicatorView.textOrientation = DHLoadingIndicatorViewTextOrientationLeft;
        }
            break;
        case 2:
        {
            self.indicatorView.textOrientation = DHLoadingIndicatorViewTextOrientationTop;
        }
            break;
        case 3:
        {
            self.indicatorView.textOrientation = DHLoadingIndicatorViewTextOrientationBottom;
        }
            break;
        case 4:
        {
            self.indicatorView.textOrientation = DHLoadingIndicatorViewTextOrientationNone;
        }
            break;
        case 5:
        {
            self.indicatorView.textOrientation = DHLoadingIndicatorViewTextOrientationRight;
            self.indicatorView.innerMargin = @12;
        }
            break;
        case 6:
        {
            self.indicatorView.textOrientation = DHLoadingIndicatorViewTextOrientationRight;
            self.indicatorView.indicatorLabel.textColor = [UIColor greenColor];
        }
            break;
        case 7:
        {
            self.indicatorView.textOrientation = DHLoadingIndicatorViewTextOrientationRight;
            self.indicatorView.indicatorLabel.font = [UIFont italicSystemFontOfSize:18];
        }
            break;
        case 8:
        {
            self.indicatorView.innerFrame.hidden = NO;
            self.indicatorView.innerFrame.backgroundColor = [UIColor darkGrayColor];
            self.indicatorView.innerFrame.alpha = 0.5;
            self.indicatorView.innerFrame.layer.cornerRadius = 10;
            break;
        }
        case 9:
        {
            self.indicatorView.innerFrame.hidden = NO;
            self.indicatorView.innerFrame.backgroundColor = [UIColor darkGrayColor];
            self.indicatorView.innerFrame.alpha = 0.3;
            self.indicatorView.innerFrame.layer.cornerRadius = 10;
            self.indicatorView.innerFrameMargin = @75;
            break;
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
