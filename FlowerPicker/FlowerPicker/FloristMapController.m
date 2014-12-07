//
//  FloristMapController.m
//  FlowerPicker
//
//  Created by Jonathan Disher on 12/6/14.
//  Copyright (c) 2014 CDGL. All rights reserved.
//

#import "FloristMapController.h"

@interface FloristMapController () <CLLocationManagerDelegate> {
    CLPlacemark* currentPlacemark;
}

@property (weak, nonatomic) IBOutlet MKMapView* mapView;
@property (nonatomic) CLLocationCoordinate2D userLocation;
@property (strong, nonatomic) CLLocationManager* locationManager;

@end


@implementation FloristMapController

@synthesize locationManager = _locationManager;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _locationManager = [[CLLocationManager alloc] init];
    [_locationManager setDelegate:self];
    
    if ([[self locationManager] respondsToSelector:@selector(requestAlwaysAuthorization)]) {
        [[self locationManager] requestWhenInUseAuthorization];
    }
    
    [[self mapView] setDelegate:self];
    
    [[self mapView] setShowsUserLocation:YES];
    [[self mapView] setUserTrackingMode:MKUserTrackingModeFollow];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
