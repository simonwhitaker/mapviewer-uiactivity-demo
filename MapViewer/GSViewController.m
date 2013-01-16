//
//  GSViewController.m
//  MapViewer
//
//  Created by Simon Whitaker on 16/01/2013.
//  Copyright (c) 2013 Goo Software Ltd. All rights reserved.
//

#import "GSViewController.h"
#import "GSMapActivity.h"

@interface GSViewController ()

@end

@implementation GSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"Map Viewer";
    self.mapView.showsUserLocation = YES;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(handleActionButton:)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)handleActionButton:(id)sender
{
    NSArray *activityItems = @[
        [[CLLocation alloc] initWithLatitude:self.mapView.centerCoordinate.latitude
                                   longitude:self.mapView.centerCoordinate.longitude],
    ];
    
    NSArray *applicationActivities = @[
        [[GSMapActivity alloc] init],
    ];
    
    UIActivityViewController *vc = [[UIActivityViewController alloc] initWithActivityItems:activityItems
                                                                     applicationActivities:applicationActivities];
    [self presentViewController:vc
                       animated:YES
                     completion:NULL];
}

@end
