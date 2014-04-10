//
//  CustomViewController.m
//  focusonline
//
//  Created by Thein Tun Aung on 10/4/14.
//  Copyright (c) 2014 7r48. All rights reserved.
//

#import "CustomViewController.h"
#import "Configuration.h"

@interface CustomViewController ()

@end

@implementation CustomViewController

- (BOOL)shouldAutorotate {
    return YES;
}

-(NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskPortraitUpsideDown;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationPortrait;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait || interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown);
}

- (id)init
{
    statusBarOffset = 0;
    if ([Configuration getOSMajorVersion] >= 7) {
        statusBarOffset = 20;
    }
    
    self = [super init];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    
    // solve iOS 7 issues
    if ([Configuration getOSMajorVersion] >= 7) {
        
        // move all subviews down
        for (UIView *sub in [self.view subviews]) {
            CGRect fr = sub.frame;
            fr.origin.y += statusBarOffset;
            [sub setFrame:fr];
        }
        
        // add background view to status bar
        // - iOS 7 deprecated black styles for status bar
        // - we need to set a black background view as status bar's background
        [self setNeedsStatusBarAppearanceUpdate]; // so that status bar will update
        CGRect bounds = [[UIScreen mainScreen] bounds];
        // use screen's long side to handle rotation
        CGFloat longSide = MAX(bounds.size.width, bounds.size.height);
        UIView *statusBkg = [[UIView alloc] initWithFrame:CGRectMake(0, 0, longSide, statusBarOffset)];
        [statusBkg setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:1]];
        [self.view addSubview:statusBkg];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    if ([Configuration getOSMajorVersion] >= 7)
        return UIStatusBarStyleLightContent;
    else
        return UIStatusBarStyleBlackOpaque; // deprecated from iOS 7
}

@end
