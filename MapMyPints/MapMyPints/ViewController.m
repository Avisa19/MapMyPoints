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
    [self centerMap:self.luciAnno];
}
- (IBAction)wiclTapped:(id)sender {
    [self centerMap:self.wiclAnno];
}
- (IBAction)gradientTapped:(id)sender {
    [self centerMap:self.gradientAnno];
}

- (void) centerMap:(MKPointAnnotation *)centerPoint {
    [self.mapView setCenterCoordinate:centerPoint.coordinate animated:YES];
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
    
    [self.mapView addAnnotations:@[self.luciAnno, self.wiclAnno, self.gradientAnno]];
}

@end
