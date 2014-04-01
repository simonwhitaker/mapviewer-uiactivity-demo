//
//  GSMapActivity.m
//  MapViewer
//
//  Created by Simon Whitaker on 16/01/2013.
//  Copyright (c) 2013 Goo Software Ltd. All rights reserved.
//

#import <MapKit/MapKit.h>
#import "GSMapActivity.h"

@interface GSMapActivity()

@property (nonatomic, copy) NSArray *mapItems;

@end

@implementation GSMapActivity

- (NSString *)activityType {
    // Unique string that identifies this activity to the OS
    return @"uk.co.goosoftware.GSMapActivity";
}

- (NSString *)activityTitle {
    // The label that appears under the activity icon in the "share sheet"
    return @"Open in Maps";
}

- (UIImage *)activityImage {
    // The icon that appears in the "share sheet". NB: it's a mask, like UITabBar button images.
    return [UIImage imageNamed:@"map-icon.png"];
}

- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems {

    // Given an array of NSObjects, returns YES if at least one of them can be handled by this activity
    for (id obj in activityItems) {
        if ([obj isKindOfClass:[MKMapItem class]]) {
            return YES;
        }
    }
    return NO;

}

- (void)prepareWithActivityItems:(NSArray *)activityItems {
    // Iterate through the activity items, filtering out the MKMapItem objects
    NSMutableArray *mapItems = [NSMutableArray array];
    for (id obj in activityItems) {
        if ([obj isKindOfClass:[MKMapItem class]]) {
            [mapItems addObject:obj];
        }
    }
    self.mapItems = mapItems;
}

- (void)performActivity {
    // Open the map items in Maps
    [MKMapItem openMapsWithItems:self.mapItems launchOptions:nil];
    
    [self activityDidFinish:YES];
}

@end
