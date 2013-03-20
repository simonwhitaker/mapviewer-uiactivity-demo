//
//  GSMapActivity.m
//  MapViewer
//
//  Created by Simon Whitaker on 16/01/2013.
//  Copyright (c) 2013 Goo Software Ltd. All rights reserved.
//

#import <MapKit/MapKit.h>

#import "GSMapActivity.h"

@implementation GSMapActivity

- (NSString *)activityType // default returns nil. subclass may override to return custom activity type that is reported to completion handler
{
    return @"uk.co.goosoftware.GSMapActivity";
}

- (NSString *)activityTitle // default returns nil. subclass must override and must return non-nil value
{
    return @"Open in Maps";
}

- (UIImage *)activityImage // default returns nil. subclass must override and must return non-nil value
{
    return [UIImage imageNamed:@"map-icon.png"];
}

- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems // override this to return availability of activity based on items. default returns NO
{
    NSUInteger count = 0;
    for (id obj in activityItems) {
        if ([obj isKindOfClass:[MKMapItem class]]) {
            count++;
        }
    }
    
    // Show our activity if we are given at least one usable object
    return count > 0;
}

- (void)prepareWithActivityItems:(NSArray *)activityItems // override to extract items and set up your HI. default does nothing
{
    NSMutableArray *mapItems = [NSMutableArray array];
    
    for (id obj in activityItems) {
        if ([obj isKindOfClass:[MKMapItem class]]) {
            [mapItems addObject:obj];
        }
    }
    
    [MKMapItem openMapsWithItems:mapItems launchOptions:nil];
}

@end
