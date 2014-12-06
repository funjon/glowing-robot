//
//  FloristsTableViewController.h
//  FlowerPicker
//
//  Created by Alvin Lee on 11/19/14.
//  Copyright (c) 2014 CDGL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface FloristsTableViewController : UITableViewController <CLLocationManagerDelegate, UISearchBarDelegate>

@property (nonatomic, strong) NSArray *florists;

@end
