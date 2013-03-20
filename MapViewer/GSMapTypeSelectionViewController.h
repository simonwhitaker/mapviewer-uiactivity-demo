//
//  GSMapTypeSelectionViewController.h
//  MapViewer
//
//  Created by Simon Whitaker on 20/03/2013.
//  Copyright (c) 2013 Goo Software Ltd. All rights reserved.
//

#import <MapKit/MapKit.h>
#import <UIKit/UIKit.h>

@protocol GSMapTypeSelectionViewControllerDelegate;

@interface GSMapTypeSelectionViewController : UIViewController

@property (nonatomic, weak) id<GSMapTypeSelectionViewControllerDelegate> delegate;

@end

@protocol GSMapTypeSelectionViewControllerDelegate <NSObject>

- (void)viewController:(GSMapTypeSelectionViewController*)viewController didSelectMapType:(MKMapType)mapType;

@end