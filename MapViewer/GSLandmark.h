//
//  GSLandmark.h
//  MapViewer
//
//  Created by Simon Whitaker on 20/03/2013.
//  Copyright (c) 2013 Goo Software Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface GSLandmark : NSObject

@property (nonatomic) CGFloat latitude;
@property (nonatomic) CGFloat longitude;
@property (nonatomic) NSString *name;
@property (nonatomic, readonly) MKMapItem *mapItem;

+ (instancetype)landmarkWithName:(NSString*)name latitude:(CGFloat)latitude longitude:(CGFloat)longitude;

@end
