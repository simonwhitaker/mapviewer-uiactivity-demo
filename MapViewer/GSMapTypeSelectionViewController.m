//
//  GSMapTypeSelectionViewController.m
//  MapViewer
//
//  Created by Simon Whitaker on 20/03/2013.
//  Copyright (c) 2013 Goo Software Ltd. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "GSMapTypeSelectionViewController.h"

@interface GSMapTypeSelectionViewController ()

@end

@implementation GSMapTypeSelectionViewController

- (id)init {
    self = [super init];
    if (self) {
        [self setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    }
    return self;
}

- (void)loadView {
    UIView *rootView = [[UIView alloc] init];
    [rootView setAutoresizingMask:UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth];
    [rootView setBackgroundColor:[UIColor colorWithWhite:0.0 alpha:0.800]];
    
    UIView *backgroundView = [[UIView alloc] initWithFrame:CGRectMake(10, 170, 300, 120)];
    [backgroundView setBackgroundColor:[UIColor lightGrayColor]];
    [[backgroundView layer] setCornerRadius:10.0];
    [[backgroundView layer] setBorderColor:[[UIColor whiteColor] CGColor]];
    [[backgroundView layer] setBorderWidth:2.0];
    [[backgroundView layer] setShadowOffset:CGSizeMake(1.0, 2.0)];
    [[backgroundView layer] setShadowColor:[[UIColor blackColor] CGColor]];
    [[backgroundView layer] setShadowOpacity:0.8];
    [[backgroundView layer] setShadowRadius:2.0];
    [rootView addSubview:backgroundView];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 280, 30)];
    [label setText:@"Choose a map type"];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setFont:[UIFont boldSystemFontOfSize:18.0]];
    [label setTextColor:[UIColor whiteColor]];
    [label setTextAlignment:NSTextAlignmentCenter];
    [backgroundView addSubview:label];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"Standard" forState:UIControlStateNormal];
    [button setTag:MKMapTypeStandard];
    [button setFrame:CGRectMake(10, 60, 130, 50)];
    [button addTarget:self action:@selector(GS_handleButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [backgroundView addSubview:button];
    
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"Satellite" forState:UIControlStateNormal];
    [button setTag:MKMapTypeSatellite];
    [button setFrame:CGRectMake(160, 60, 130, 50)];
    [button addTarget:self action:@selector(GS_handleButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [backgroundView addSubview:button];
    
    [self setView:rootView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)GS_handleButtonTap:(UIButton*)sender {
    
    if ([[self delegate] respondsToSelector:@selector(viewController:didSelectMapType:)]) {
        [[self delegate] viewController:self didSelectMapType:[sender tag]];
    }
    
}

@end
