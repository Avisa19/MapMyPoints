//
//  ViewController.m
//  MapMyPints
//
//  Created by Avisa Poshtkouhi on 7/25/20.
//  Copyright © 2020 Avisa Poshtkouhi. All rights reserved.
//

#import "MapKit/MapKit.h"
#import "ViewController.h"


@interface ViewController () <MKMapViewDelegate ,CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) MKPointAnnotation* luciAnno;
@property (strong, nonatomic) MKPointAnnotation* wiclAnno;
@property (strong, nonatomic) MKPointAnnotation* gradientAnno;
@property (strong, nonatomic) MKPointAnnotation* currentAnno;
@property (weak, nonatomic) IBOutlet UISwitch *switchFieid;
@property (strong, nonatomic) CLLocationManager* locationManager;
@property (nonatomic, assign) BOOL isMapMoving;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.switchFieid.on = NO;
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    [self.switchFieid isEnabled];
    [self.locationManager requestWhenInUseAuthorization];
    [self addAnnotation];
    self.isMapMoving = NO;
}
- (IBAction)luciTapped:(id)sender {
    [self centerMap:self.luciAnno];
}
- (IBAction)wiclTapped:(id)sender {
    [self centerMap:self.wiclAnno];
}
- (IBAction)gradientTapped:(id)sender {
    [self centerMap:self.gradientAnno];
}
- (IBAction)switchChanged:(id)sender {
    
    if (self.switchFieid.isOn) {
        self.mapView.showsUserLocation = YES;
        [self.locationManager startUpdatingLocation];
    } else {
        self.mapView.showsUserLocation = NO;
        [self.locationManager stopUpdatingLocation];
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    self.currentAnno.coordinate = locations.lastObject.coordinate;
    if (self.isMapMoving == NO) {
        [self centerMap:self.currentAnno];
    }
}


- (void) centerMap:(MKPointAnnotation *)centerPoint {
    [self.mapView setCenterCoordinate:centerPoint.coordinate animated:YES];
}

- (void)mapView:(MKMapView *)mapView regionWillChangeAnimated:(BOOL)animated {
    self.isMapMoving = YES;
}

- (void) addAnnotation {
    
    self.luciAnno = [[MKPointAnnotation alloc] init];
    self.luciAnno.coordinate = CLLocationCoordinate2DMake(33.6432094, -117.8439953);
    self.luciAnno.title = @"Laboratory for ubiqoutose Computing and Interaction";
    
    
    self.wiclAnno = [[MKPointAnnotation alloc] init];
    self.wiclAnno.coordinate = CLLocationCoordinate2DMake(37.7749, -122.4194);
    self.wiclAnno.title = @"Westmont Inspired Computing Lab";
    
    self.gradientAnno = [[MKPointAnnotation alloc] init];
    self.gradientAnno.coordinate = CLLocationCoordinate2DMake(40.677623, -73.993583);
    self.gradientAnno.title = @"Gradient LLC";
    
    self.currentAnno = [[MKPointAnnotation alloc] init];
    self.currentAnno.coordinate = CLLocationCoordinate2DMake(0.0, 0.0);
    self.currentAnno.title = @"My Location";
    
    [self.mapView addAnnotations:@[self.luciAnno, self.wiclAnno, self.gradientAnno]];
}

@end
