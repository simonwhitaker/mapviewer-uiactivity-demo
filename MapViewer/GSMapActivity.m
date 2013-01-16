//
//  GSMapActivity.m
//  MapViewer
//
//  Created by Simon Whitaker on 16/01/2013.
//  Copyright (c) 2013 Goo Software Ltd. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import "GSMapActivity.h"

@implementation GSMapActivity

- (NSString *)activityType // default returns nil. subclass may override to return custom activity type that is reported to completion handler
{
    return NSStringFromClass([self class]);
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
        if ([obj isKindOfClass:[CLLocation class]]) {
            count++;
        }
    }
    
    // Show our activity if we are given exactly one location object
    return count == 1;
}

- (void)prepareWithActivityItems:(NSArray *)activityItems // override to extract items and set up your HI. default does nothing
{
    for (id obj in activityItems) {
        if ([obj isKindOfClass:[CLLocation class]]) {
            CLLocation *location = (CLLocation*)obj;
            NSString *url = [NSString stringWithFormat:@"http://maps.apple.com/?ll=%.6f,%.6f&z=4", location.coordinate.latitude, location.coordinate.longitude];
            NSLog(@"Opening URL: %@", url);
            
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
            
            // Don't process any additional objects. We can only display one.
            break;
        }
    }
}

@end
