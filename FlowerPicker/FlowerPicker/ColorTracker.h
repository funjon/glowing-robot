//
//  ColorTracker.h
//  FlowerPicker
//
//  Created by Jonathan Disher on 11/26/14.
//  Copyright (c) 2014 CDGL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ColorTracker : NSObject

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

// Class method to make this a singleton
+(id)sharedManager;

@end
