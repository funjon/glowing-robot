//
//  Flower.m
//  FlowerPicker
//
//  Created by Jonathan Disher on 11/24/14.
//  Copyright (c) 2014 CDGL. All rights reserved.
//

#import "Flower.h"

@interface Flower()

@property NSString* displayName;
@property NSString* type;
@property NSString* color; // Should this be an enum?
@property NSString* imageName;
@property int dozCost;
@property int boqCost;
@property NSDictionary* season;

@end

@implementation Flower

@synthesize displayName = _displayName;
@synthesize type = _type;
@synthesize color = _color;
@synthesize imageName = _imageName;
@synthesize dozCost = _dozCost;
@synthesize boqCost = _boqCost;
@synthesize season = _season;


@end
