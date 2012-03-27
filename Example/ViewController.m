//
//  ViewController.m
//  ChainedAnimation
//
//  Created by Anders Svendal on 3/27/12.
//  Copyright (c) 2012 Tight Interactive. All rights reserved.
//

#import "ViewController.h"
#import "ChainedAnimation.h"

@interface ViewController ()

@property (nonatomic, strong) UIView *testView;

@end

@implementation ViewController

@synthesize testView=_testView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _testView = [[UIView alloc] initWithFrame:CGRectMake(140.0, 210.0, 40.0, 40.0)];
    _testView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_testView];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)didPressReset:(id)sender {
    NSLog(@"didPressReset");
    [UIView animateWithDuration:0.3 animations:^{
        _testView.center = CGPointMake(160.0, 220.0);
        _testView.transform = CGAffineTransformIdentity;
    }];
}

- (IBAction)didPressScale:(id)sender {
    NSLog(@"didPressScale");
    _testView.transform = CGAffineTransformMakeScale(0.1, 0.1);
    ChainedAnimation *animation = [ChainedAnimation chainedAnimation];
    [animation addStepWithDuration:0.2 animations:^{
        _testView.transform = CGAffineTransformMakeScale(1.4, 1.4);
    }];
    [animation addStepWithDuration:0.08 animations:^{
        _testView.transform = CGAffineTransformMakeScale(0.8, 0.8);
    }];
    [animation addStepWithDuration:0.05 animations:^{
        _testView.transform = CGAffineTransformMakeScale(1.0, 1.0);
    }];
    [animation performAnimation];
}

- (IBAction)didPressMove:(id)sender {
    NSLog(@"didPressMove");
    ChainedAnimation *animation = [ChainedAnimation chainedAnimation];
    [animation addStepWithDuration:0.4 animations:^{
        _testView.center = CGPointMake(100.0, 304.0);
    }];
    [animation addStepWithDuration:1.0 animations:^{
        _testView.center = CGPointMake(300.0, 40.0);
    }];
    [animation performAnimation];
}
@end
