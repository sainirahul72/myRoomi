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
    self.propertyLocation = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"",@"latitude",@"",@"longitude", nil];
    
    mapView.showsUserLocation = YES;
    mapView.delegate=self;
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
#ifdef __IPHONE_8_0
    if(IS_OS_8_OR_LATER) {
        // Use one or the other, not both. Depending on what you put in info.plist
        // [self.locationManager requestWhenInUseAuthorization];
        [self.locationManager requestAlwaysAuthorization];
    }
#endif
    [self.locationManager startUpdatingLocation];
    
    mapView.showsUserLocation = YES;
    [mapView setMapType:MKMapTypeStandard];
    [mapView setZoomEnabled:YES];
    [mapView setScrollEnabled:YES];
    
    
    // Do any additional setup after loading the view.
}


-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:YES];
    
    self.locationManager.distanceFilter = kCLDistanceFilterNone;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [self.locationManager startUpdatingLocation];
    [self deviceLocation];
    [self.propertyLocation setValue:[self deviceLat] forKey:@"latitude"];
    [self.propertyLocation setValue:[self deviceLon] forKey:@"longitude"];
    self.propertyDictionary = [[NSMutableDictionary alloc] initWithObjectsAndKeys:self.propertyLocation,@"location",self.propertyType,@"property_type", nil];
    //View Area
    MKCoordinateRegion region = { { 0.0, 0.0 }, { 0.0, 0.0 } };
    region.center.latitude = self.locationManager.location.coordinate.latitude;
    region.center.longitude = self.locationManager.location.coordinate.longitude;
    region.span.longitudeDelta = 0.005f;
    region.span.longitudeDelta = 0.005f;
    [mapView setRegion:region animated:YES];
    
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 3000, 3000);
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
}
- (NSString *)deviceLocation {
    return [NSString stringWithFormat:@"latitude: %f longitude: %f", self.locationManager.location.coordinate.latitude, self.locationManager.location.coordinate.longitude];
    
}
- (NSString *)deviceLat {
    return [NSString stringWithFormat:@"%f", self.locationManager.location.coordinate.latitude];
}
- (NSString *)deviceLon {
    return [NSString stringWithFormat:@"%f", self.locationManager.location.coordinate.longitude];
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

//- (void)mapView:(MKMapView *)mapView
//didUpdateUserLocation:
//(MKUserLocation *)userLocation
//{
//    self.mapView.centerCoordinate = userLocation.location.coordinate;
//}

//- (void)zoomIn: (id)sender
//{
//    MKUserLocation *userLocation = mapView.userLocation;
//    MKCoordinateRegion region =
//    MKCoordinateRegionMakeWithDistance (
//                                        userLocation.location.coordinate, 50, 50);
//    [mapView setRegion:region animated:NO];
//}
//
//- (void)zoomOut: (id)sender
//{
//    MKUserLocation *userLocation = mapView.userLocation;
//    MKCoordinateRegion region =
//    MKCoordinateRegionMakeWithDistance (
//                                        userLocation.location.coordinate, -50, -50);
//    [mapView setRegion:region animated:NO];
//}
//
//- (void) changeMapType: (id)sender
//{
//    if (mapView.mapType == MKMapTypeStandard)
//        mapView.mapType = MKMapTypeSatellite;
//    else
//        mapView.mapType = MKMapTypeStandard;
//}



//    CLLocationCoordinate2D annotationCoord;
//
//    annotationCoord.latitude = 47.640071;
//    annotationCoord.longitude = -122.129598;
//
//    MKPointAnnotation *annotationPoint = [[MKPointAnnotation alloc] init];
//    annotationPoint.coordinate = annotationCoord;
//    annotationPoint.title = @"Microsoft";
//    annotationPoint.subtitle = @"Microsoft's headquarters";
//    [mapView addAnnotation:annotationPoint];

//    UIBarButtonItem *zoomIn =
//    [[UIBarButtonItem alloc]
//     initWithTitle: @"Zoom In"
//     style:UIBarButtonItemStylePlain
//     target: self
//     action:@selector(zoomIn:)];
//
//    UIBarButtonItem *zoomOut =
//    [[UIBarButtonItem alloc]
//     initWithTitle: @"Zoom Out"
//     style:UIBarButtonItemStylePlain
//     target: self
//     action:@selector(zoomOut:)];
//
//    UIBarButtonItem *typeButton =
//    [[UIBarButtonItem alloc]
//     initWithTitle: @"Map Type"
//     style:UIBarButtonItemStylePlain
//     target: self
//     action:@selector(changeMapType:)];
//
//    NSArray *buttons = [[NSArray alloc]
//                        initWithObjects:zoomIn, typeButton, zoomOut,nil];
//
//    toolBar.items = buttons;

@end
