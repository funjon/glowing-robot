//
//  FloristsWebViewController.m
//  FlowerPicker
//
//  Created by Alvin Lee on 11/19/14.
//  Copyright (c) 2014 CDGL. All rights reserved.
//

#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

#import "FloristsWebViewController.h"
#import "FloristAnnotation.h"


@interface FloristsWebViewController () <CLLocationManagerDelegate> {
    CLPlacemark* currentPlacemark;
}

@property (nonatomic, weak) IBOutlet MKMapView *mapView;
@property (nonatomic, strong) FloristAnnotation *annotation;
@property (nonatomic) CLLocationCoordinate2D userLocation;
@property (nonatomic, strong) CLLocationManager* locationManager;

@end

@implementation FloristsWebViewController

@synthesize locationManager;

-(void)viewDidLoad {
    [super viewDidLoad];
    self.locationManager = [[CLLocationManager alloc ] init];
    self.locationManager.delegate = self;
    
    if ([self.locationManager respondsToSelector:@selector(requestAlwaysAuthorization)]) {
        [self.locationManager requestWhenInUseAuthorization];
    }
    
    self.mapView.delegate = self;
    self.mapView.showsUserLocation = YES;
    
    //MKCoordinateRegion myMapView = MKCoordinateRegionMakeWithDistance(self.userLocation, 20*1609.34, 20*1609.34);
    
    //MKCoordinateRegion adjustedMapView = [self.mapView regionThatFits:myMapView];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    
    // adjust the map to zoom/center to the annotations we want to show
    [self.mapView setRegion:self.boundingRegion];
    
    if (self.mapItemList.count == 1)
    {
        MKMapItem *mapItem = [self.mapItemList objectAtIndex:0];
        
        self.title = mapItem.name;
        
        // add the single annotation to our map
        FloristAnnotation *annotation = [[FloristAnnotation alloc] init];
        annotation.coordinate = mapItem.placemark.location.coordinate;
        annotation.Title = mapItem.name;
        annotation.Subtitle = mapItem.placemark.addressDictionary[@"Street"];
        annotation.url = mapItem.url;
        [self.mapView addAnnotation:annotation];
        
        // we have only one annotation, select it's callout
        [self.mapView selectAnnotation:[self.mapView.annotations objectAtIndex:0] animated:YES];
        
        
        // center the region around this map item's coordinate
        self.mapView.centerCoordinate = mapItem.placemark.coordinate;
    }
    //
    // Currently not using button to show all annotations
    //************************************************************
    else
    {
        self.title = @"All Places";
        
        // add all the found annotations to the map
        for (MKMapItem *item in self.mapItemList)
        {
            FloristAnnotation *annotation = [[FloristAnnotation alloc] init];
            annotation.coordinate = item.placemark.location.coordinate;
            annotation.title = item.name;
            annotation.url = item.url;
            [self.mapView addAnnotation:annotation];
        }
    }
    //************************************************************
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self.mapView removeAnnotations:self.mapView.annotations];
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
    NSLog(@"tap event");
    
    [self performSegueWithIdentifier:@"AnnotationDetail" sender:view];
}


- (NSUInteger)supportedInterfaceOrientations
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        return UIInterfaceOrientationMaskAll;
    else
        return UIInterfaceOrientationMaskAllButUpsideDown;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"AnnotationDetail"]) {
        NSLog(@"called");
    
    }


}



#pragma mark - MKMapViewDelegate

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    MKPinAnnotationView *annotationView = nil;
    if ([annotation isKindOfClass:[FloristAnnotation class]])
    {
        annotationView = (MKPinAnnotationView *)[self.mapView dequeueReusableAnnotationViewWithIdentifier:@"Pin"];
        if (annotationView == nil)
        {
            annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"Pin"];
            annotationView.canShowCallout = YES;
            annotationView.animatesDrop = YES;
            
            // Add a detail button to the callout.
            UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            annotationView.rightCalloutAccessoryView = rightButton;
            
        }
    }
    return annotationView;
}

@end
