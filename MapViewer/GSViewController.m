//
//  GSViewController.m
//  MapViewer
//
//  Created by Simon Whitaker on 16/01/2013.
//  Copyright (c) 2013 Goo Software Ltd. All rights reserved.
//
#import <CoreLocation/CoreLocation.h>

#import "GSViewController.h"
#import "GSMapActivity.h"
#import "GSLandmark.h"

@interface GSViewController () {
    NSArray *_landmarks;
    NSMutableIndexSet *_selectedIndices;
}

@end

@implementation GSViewController

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        _landmarks = @[
           [GSLandmark landmarkWithName:@"British Museum" latitude:51.518858 longitude:-0.126332],
           [GSLandmark landmarkWithName:@"Buckingham Palace" latitude:51.501365 longitude:-0.141889],
           [GSLandmark landmarkWithName:@"Regent's Park" latitude:51.531991 longitude:-0.154297],
        ];
        _selectedIndices = [[NSMutableIndexSet alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"London Landmarks";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(GS_handleActionButton:)];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_landmarks count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    GSLandmark *landmark = [_landmarks objectAtIndex:indexPath.row];
    [[cell textLabel] setText:[landmark name]];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    if ([_selectedIndices containsIndex:indexPath.row]) {
        [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
    } else {
        [cell setAccessoryType:UITableViewCellAccessoryNone];
    }
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    if ([_selectedIndices containsIndex:indexPath.row]) {
        [_selectedIndices removeIndex:indexPath.row];
    } else {
        [_selectedIndices addIndex:indexPath.row];
    }
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    
}

// ---------------------------------------------------------
   #pragma mark - Private methods
// ---------------------------------------------------------

- (void)GS_handleActionButton:(id)sender
{

    NSMutableArray *activityItems = [NSMutableArray array];
    [_landmarks enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if ([_selectedIndices containsIndex:idx]) {
            [activityItems addObject:[(GSLandmark*)obj mapItem]];
        }
    }];
    
    if ([activityItems count] > 0) {
        NSArray *applicationActivities = @[
            [[GSMapActivity alloc] init],
        ];
        
        UIActivityViewController *vc = [[UIActivityViewController
                                         alloc]
                                        initWithActivityItems:activityItems
                                        applicationActivities:applicationActivities];
        [self presentViewController:vc animated:YES completion:NULL];
    }
}

@end
