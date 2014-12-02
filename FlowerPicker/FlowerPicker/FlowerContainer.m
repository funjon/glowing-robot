//
//  FlowerContainer.m
//  FlowerPicker
//
//  Created by Jonathan Disher on 12/1/14.
//  Copyright (c) 2014 CDGL. All rights reserved.
//

#import "FlowerContainer.h"

@interface FlowerContainer()

@property NSMutableArray* flowerDb;

@end

@implementation FlowerContainer

@synthesize flowerDb = _flowerDb;

// Init method
-(id)init {
    if (self = [super init]) {
        // OK, init things that need to be initialized
        _flowerDb = [[NSMutableArray alloc] init];
        // Strings can be left alone
    }
    return self;
}

// Dealloc method
-(void)dealloc {
    [_flowerDb removeAllObjects];
}

// Todo
/*
 // Get methods
 -(Flower*)getFlower:(NSString*)withName;
 -(NSArray*)getArray;
 -(int)count;
 
 // Set methods
 -(void)addFlower:(Flower*)flower withName:(NSString*)name;
*/

// Returns a flower by name if found, nil otherwise
-(Flower*)getFlower:(NSString*)withName {
    for (Flower* f in _flowerDb) {
        if ([[f displayName] containsString:withName]) { return f; }
    }
    
    return nil;
}

-(NSArray*)getArray {
    return [_flowerDb copy];
}

-(NSUInteger)count { return [_flowerDb count]; }

// Set

-(void)addFlower:(Flower *)flower withName:(NSString *)name {
    // Check to see if it already exists, if so, silently bail out
    for (Flower* f in _flowerDb) { if ([[f displayName] containsString:name]) { return; } }
    
    // Add it if we got here
    [_flowerDb addObject:flower];
}

@end
