//
//  PropertyLocation.h
//  MyRommi
//
//  Created by Rahul Saini on 4/12/15.
//  Copyright (c) 2015 Rahul Saini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "PropertyLocation.h"

#define IS_OS_8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)

@interface PropertyLocation : UIViewController<MKMapViewDelegate,CLLocationManagerDelegate>
{
    MKMapView *mapView;
    UIToolbar *toolBar;
}
@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) IBOutlet UIToolbar *toolBar;
@property(nonatomic, retain) CLLocationManager *locationManager;
@property (nonatomic, strong) NSMutableDictionary *propertyType;
@end
