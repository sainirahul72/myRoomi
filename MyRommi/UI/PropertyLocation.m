//
//  PropertyLocation.m
//  MyRommi
//
//  Created by Rahul Saini on 4/12/15.
//  Copyright (c) 2015 Rahul Saini. All rights reserved.
//

#import "PropertyLocation.h"
#import "PropertyAddress.h"

@interface PropertyLocation ()
@property (nonatomic, strong) NSMutableDictionary *propertyLocation;
@property (nonatomic, strong) NSMutableDictionary *propertyDictionary;
@end

@implementation PropertyLocation
@synthesize mapView,toolBar;


- (void)viewDidLoad {
    [super viewDidLoad];

#ifdef __IPHONE_8_0
    if(IS_OS_8_OR_LATER) {
        // Use one or the other, not both. Depending on what you put in info.plist
        // [self.locationManager requestWhenInUseAuthorization];
        [self.locationManager requestAlwaysAuthorization];
    }
#endif
    
    self.propertyLocation = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"",@"latitude",@"",@"longitude", nil];
    mapView.showsUserLocation = YES;
    mapView.delegate=self;
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    
    [self.locationManager startUpdatingLocation];
    mapView.showsUserLocation = YES;
    [mapView setMapType:MKMapTypeStandard];
    [mapView setZoomEnabled:YES];
    [mapView setScrollEnabled:YES];
    
    
    /************ tap Geture *************/
    
    UILongPressGestureRecognizer *lpgr = [[UILongPressGestureRecognizer alloc]
                                          initWithTarget:self action:@selector(handleGesture:)];
    //user must press for 1 seconds
    lpgr.minimumPressDuration = 1.0;
    [mapView addGestureRecognizer:lpgr];
    self.locationManager.distanceFilter = kCLDistanceFilterNone;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [self.locationManager startUpdatingLocation];
    [self deviceLocation];
    
    //View Area
    
    MKCoordinateRegion region = { { 0.0, 0.0 }, { 0.0, 0.0 } };
    region.center.latitude = self.locationManager.location.coordinate.latitude;
    region.center.longitude = self.locationManager.location.coordinate.longitude;
    region.span.longitudeDelta = 0.005f;
    region.span.longitudeDelta = 0.005f;
    [mapView setRegion:region animated:YES];
    
    /* --------------- end ---------------*/
    
}


-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:YES];
    
}



 /************** tap Geture handler ***************/

- (void)handleGesture:(UIGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer.state != UIGestureRecognizerStateEnded)
        return;
    CGPoint touchPoint = [gestureRecognizer locationInView:mapView];
    CLLocationCoordinate2D touchMapCoordinate =
    [mapView convertPoint:touchPoint toCoordinateFromView:mapView];
    
    [self.propertyLocation setValue:[NSString stringWithFormat:@"%f", touchMapCoordinate.latitude] forKey:@"latitude"];
    [self.propertyLocation setValue:[NSString stringWithFormat:@"%f", touchMapCoordinate.longitude] forKey:@"longitude"];
    self.propertyDictionary = [[NSMutableDictionary alloc] initWithObjectsAndKeys:self.propertyLocation,@"location",self.propertyType,@"property_type", nil];
    
    MKPointAnnotation *pa = [[MKPointAnnotation alloc] init];
    pa.coordinate = touchMapCoordinate;
    pa.title = @"My Property";
    [mapView removeAnnotations:mapView.annotations];
    [mapView addAnnotation:pa];
    
    CLGeocoder *ceo = [[CLGeocoder alloc]init];
    CLLocation *loc = [[CLLocation alloc]initWithLatitude:touchMapCoordinate.latitude longitude:touchMapCoordinate.longitude]; //insert your coordinates
    
    [ceo reverseGeocodeLocation:loc
              completionHandler:^(NSArray *placemarks, NSError *error) {
                  CLPlacemark *placemark = [placemarks objectAtIndex:0];
                  //String to hold address
                  NSString *locatedAt = [[placemark.addressDictionary valueForKey:@"FormattedAddressLines"] componentsJoinedByString:@", "];
                  self.addressTextField.text = locatedAt;
              }
     
     ];
    
    
    
}

/* ------------------- end ---------------------*/



- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 3000, 3000);
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
}



- (NSString *)deviceLocation {
    return [NSString stringWithFormat:@"latitude: %f longitude: %f", self.locationManager.location.coordinate.latitude, self.locationManager.location.coordinate.longitude];
    
}

- (NSString *)deviceAlt {
    return [NSString stringWithFormat:@"%f", self.locationManager.location.altitude];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)continueButton:(id)sender {
    [self performSegueWithIdentifier:@"propertyAddress" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"propertyAddress"]) {
        PropertyAddress *propertyAddressVC = [segue destinationViewController];
        propertyAddressVC.propertyDictionary = self.propertyDictionary;
    }
}


- (IBAction)zoomIn: (id)sender
{
    MKCoordinateRegion region = self.mapView.region;
    region.span.latitudeDelta /= 3.0;
    region.span.longitudeDelta /= 3.0;
    [self.mapView setRegion:region animated:YES];
}

- (IBAction)zoomOut: (id)sender
{
    MKCoordinateRegion region = self.mapView.region;
    region.span.latitudeDelta  = MIN(region.span.latitudeDelta  * 4.0, 280.0);
    region.span.longitudeDelta = MIN(region.span.longitudeDelta * 4.0, 280.0);
    [self.mapView setRegion:region animated:YES];
}



//- (void) changeMapType: (id)sender
//{
//    if (mapView.mapType == MKMapTypeStandard)
//        mapView.mapType = MKMapTypeSatellite;
//    else
//        mapView.mapType = MKMapTypeStandard;
//}

@end
