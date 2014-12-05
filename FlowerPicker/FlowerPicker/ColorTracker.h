//
//  ColorTracker.h
//  FlowerPicker
//
//  Created by Jonathan Disher on 11/26/14.
//  Copyright (c) 2014 CDGL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ColorTracker : NSObject {
    NSMutableDictionary* colors;
    NSMutableDictionary* colorCounts;
}

@property (nonatomic, retain) NSMutableDictionary* colors;
@property (nonatomic, retain) NSMutableDictionary* colorCounts;

// Set a color on or off
// returns true if successful (or if currently set to that state
// returns false if failure (usually due to color not found)
-(BOOL)setColor:(NSString*)color to:(NSString*)state;

// Get an NSArray of active colors
-(NSArray*)getActiveColors;

// Add an available color, build available colors when we load the flowers from plist
-(void)addAvailableColor:(NSString*)color;

// See if a color is active
-(BOOL)isActive:(NSString*)color;

// Find out how many flowers of a color are registered
-(NSInteger)countForcolor:(NSString*)color;

// List all colors registered
-(NSArray*)allColors;

// Class method to make this a singleton
+(id)sharedManager;

@end
