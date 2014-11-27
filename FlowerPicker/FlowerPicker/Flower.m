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
@property NSMutableDictionary* season;

@end

@implementation Flower

@synthesize displayName = _displayName;
@synthesize type = _type;
@synthesize color = _color;
@synthesize imageName = _imageName;
@synthesize dozCost = _dozCost;
@synthesize boqCost = _boqCost;
@synthesize season = _season;

// Init method
-(id)init {
    if (self = [super init]) {
        // OK, init things that need to be initialized
        _season = [[NSMutableDictionary alloc] init];
        // Strings can be left alone
    }
    return self;
}

// Dealloc method
-(void)dealloc {
    [_season removeAllObjects];
}

// Display name methods
-(void)setDisplayName:(NSString *)dn { _displayName = dn; }
-(NSString*)displayName { return _displayName; }

// Flower type
-(void)setType:(NSString *)t { _type = t; }
-(NSString*)type { return _type; }

// Flower color
-(void)setColor:(NSString *)c { _color = c; }
-(NSString*)color { return _color; }

// image filename
-(void)setImageName:(NSString *)img { _imageName = img; }
-(NSString*)imageName { return _imageName; }

// Costs - per dozen
-(void)setDozCost:(int)dc { _dozCost = dc; }
-(int)dozCost { return _dozCost; }

// Costs - per boquet
-(void)setBoqCost:(int)bc { _boqCost = bc; }
-(int)boqCost { return _boqCost; }

// Seasonality
-(void)setSeason:(NSString*)s to:(Boolean)val { val ? [_season setValue:@"true" forKey:s] : [_season setValue:@"false" forKey:s]; }
-(void)setSeason:(NSDictionary*)s { _season = [s mutableCopy]; }
-(NSDictionary*)season { return _season; }
-(BOOL)season: (NSString*)s { if ([[_season objectForKey:s] isEqual: @"true"]) { return true; } else { return false; } }


@end
