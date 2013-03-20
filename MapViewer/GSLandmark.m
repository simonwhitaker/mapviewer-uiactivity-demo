//
//  GSLandmark.m
//  MapViewer
//
//  Created by Simon Whitaker on 20/03/2013.
//  Copyright (c) 2013 Goo Software Ltd. All rights reserved.
//

#import <AddressBook/AddressBook.h>

#import "GSLandmark.h"

@implementation GSLandmark

+ (instancetype)landmarkWithName:(NSString*)name latitude:(CGFloat)latitude longitude:(CGFloat)longitude {
    
    GSLandmark *landmark = [[GSLandmark alloc] init];
    [landmark setName:name];
    [landmark setLatitude:latitude];
    [landmark setLongitude:longitude];
    
    return landmark;
    
}

- (MKMapItem *)mapItem {

    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake([self latitude], [self longitude]);
    NSDictionary *addressDictionary = @{ (__bridge NSString*)kABPersonAddressStreetKey: [self name] };
    return [[MKMapItem alloc] initWithPlacemark:[[MKPlacemark alloc] initWithCoordinate:coordinate addressDictionary:addressDictionary]];

}

@end
