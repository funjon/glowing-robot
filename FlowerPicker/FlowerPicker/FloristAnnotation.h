//
//  FloristAnnotation.h
//  FlowerPicker
//
//  Created by rob garcelon on 12/6/14.
//  Copyright (c) 2014 CDGL. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface FloristAnnotation : NSObject <MKAnnotation>

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, retain) NSString *Title;
@property (nonatomic, retain) NSString *Subtitle;
@property (nonatomic, retain) NSURL *url;

@end

