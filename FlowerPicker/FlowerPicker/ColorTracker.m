//
//  ColorTracker.m
//  FlowerPicker
//
//  Created by Jonathan Disher on 11/26/14.
//  Copyright (c) 2014 CDGL. All rights reserved.
//

#import "ColorTracker.h"

@interface ColorTracker()

// Internal data
@property NSMutableDictionary* colors;

@end

@implementation ColorTracker

@synthesize colors = _colors;

/* methods
 // Add an available color, build available colors when we load the flowers from plist
 -(void)addAvailableColor:(NSString*)color;
*/

-(BOOL)setColor:(NSString*)color to:(NSString*)state {
    // Make sure this is properly instantiated
    if (!_colors) { _colors = [[NSMutableDictionary alloc] init]; }

    if (!_colors[color]) { return false; } // Return false if this color doesn't exist
    if (![state containsString:@"on"] && ![state containsString:@"off"]) { return false; } // Return false if we try to set a state other than on or off
    // any other failure cases would go here. Duplicating state to current value is okay.

    // We have passed through failure cases - set the state and return true
    [_colors setValue:state forKey:color];
    return true;
}

-(NSArray*)getActiveColors {
    // Make sure this is properly instantiated
    if (!_colors) { _colors = [[NSMutableDictionary alloc] init]; }

    NSMutableArray* _tempAry = [[NSMutableArray alloc] init];
    for (NSString* color in [_colors allKeys]) {
        if ([[_colors objectForKey:color] containsString:@"on"]) {
            [_tempAry addObject:color];
        }
    }
    
    return _tempAry;
}

// Colors default to off
-(void)addAvailableColor:(NSString *)color {
    // Make sure this is properly instantiated
    if (!_colors) { _colors = [[NSMutableDictionary alloc] init]; }
    
    [_colors setValue:@"off" forKey:color];
}

// See if a color is active
-(BOOL)isActive:(NSString*)color {
    if ([[_colors objectForKey:color] containsString:@"on"]) { return true; }
    return false;
}

@end
