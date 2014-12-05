//
//  ColorTracker.m
//  FlowerPicker
//
//  Created by Jonathan Disher on 11/26/14.
//  Copyright (c) 2014 CDGL. All rights reserved.
//

#import "ColorTracker.h"

@implementation ColorTracker

@synthesize colors = _colors;
@synthesize colorCounts = _colorCounts;

-(BOOL)setColor:(NSString*)color to:(NSString*)state {
    if (!_colors[color]) { return false; } // Return false if this color doesn't exist
    if (![state containsString:@"on"] && ![state containsString:@"off"]) { return false; } // Return false if we try to set a state other than on or off
    // any other failure cases would go here. Duplicating state to current value is okay.

    // We have passed through failure cases - set the state and return true
    [_colors setValue:state forKey:color];
    return true;
}

-(NSArray*)getActiveColors {
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
    [_colors setValue:@"off" forKey:color];
    NSInteger count = [[_colorCounts objectForKey:color] integerValue];
    count++;
    [_colorCounts setObject:[NSNumber numberWithInteger:count] forKey:color];
}

// See if a color is active
-(BOOL)isActive:(NSString*)color {
    if ([[_colors objectForKey:color] containsString:@"on"]) { return true; }
    return false;
}

-(NSInteger)countForcolor:(NSString *)color {
    return [[_colorCounts objectForKey:color] integerValue];
}

-(NSArray*)allColors {
    return [_colors copy];
}

#pragma mark Singleton Methods

+(id)sharedManager {
    static ColorTracker* sharedColorTracker = nil;
    @synchronized(self) {
        if (sharedColorTracker == nil) {
            sharedColorTracker = [[self alloc] init];
        }
    }
    return sharedColorTracker;
}

- (id)init {
    if (self = [super init]) {
        _colors = [[NSMutableDictionary alloc] init];
        _colorCounts = [[NSMutableDictionary alloc] init];
    }
    return self;
}

@end
