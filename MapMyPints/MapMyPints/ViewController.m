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

- (void) addAnnotation {
    self.luciAnno = [[MKPointAnnotation alloc] init];
    self.luciAnno.coordinate = CLLocationCoordinate2DMake(33.6432094, -117.843995);
    
    self.wiclAnno = [[MKPointAnnotation alloc] init];
    self.gradientAnno = [[MKPointAnnotation alloc] init];
}

@end
