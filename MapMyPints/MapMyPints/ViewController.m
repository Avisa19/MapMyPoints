//
//  ViewController.m
//  MapMyPints
//
//  Created by Avisa Poshtkouhi on 7/25/20.
//  Copyright © 2020 Avisa Poshtkouhi. All rights reserved.
//

#import "MapKit/MapKit.h"
#import "ViewController.h"


@interface ViewController ()

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) MKPointAnnotation* luciAnno;
@property (strong, nonatomic) MKPointAnnotation* wiclAnno;
@property (strong, nonatomic) MKPointAnnotation* gradientAnno;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addAnnotation];
}
- (IBAction)luciTapped:(id)sender {
}
- (IBAction)wiclTapped:(id)sender {
}
- (IBAction)gradientTapped:(id)sender {
}

- (void) centerMap:(MKPointAnnotation *)centerPoint {
    [self.mapView setCenterCoordinate:centerPoint.coordinate];
}

- (void) addAnnotation {
    
    self.luciAnno = [[MKPointAnnotation alloc] init];
    self.luciAnno.coordinate = CLLocationCoordinate2DMake(33.6432094, -117.8439953);
    self.luciAnno.title = @"Laboratory for ubiqoutose Computing and Interaction";
    
    
    self.wiclAnno = [[MKPointAnnotation alloc] init];
    self.wiclAnno.coordinate = CLLocationCoordinate2DMake(34.448795, -119.6646337);
    self.wiclAnno.title = @"Westmont Inspired Computing Lab";
    
    self.gradientAnno = [[MKPointAnnotation alloc] init];
    self.gradientAnno.coordinate = CLLocationCoordinate2DMake(40.677623, -73.993583);
    self.gradientAnno.title = @"Gradient LLC";
    
    [self.mapView addAnnotations:@[self.luciAnno, self.wiclAnno, self.gradientAnno]];
}

@end
