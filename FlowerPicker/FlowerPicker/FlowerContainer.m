//
//  FlowerContainer.m
//  FlowerPicker
//
//  Created by Jonathan Disher on 12/1/14.
//  Copyright (c) 2014 CDGL. All rights reserved.
//

#import "FlowerContainer.h"

@implementation FlowerContainer

@synthesize flowerDb = _flowerDb;

// Dealloc method
-(void)dealloc {
    [_flowerDb removeAllObjects];
}

-(NSArray*)getFlowersWithColor:(NSString *)color {
    // Create a temporary array of results
    NSMutableArray* _tempAry = [[NSMutableArray alloc] init];
    NSArray* _fixedAry;
    
    for (Flower* f in _flowerDb) {
        if ([[[f displayName] lowercaseString] containsString:[color lowercaseString]]) {
            [_tempAry addObject:[f displayName]];
        }
    }
    
    _fixedAry = [[NSArray alloc] initWithArray:_tempAry];
    
    // Return it
    return _fixedAry;
}

-(NSArray*)getColorsForType:(NSString*)type {
    // Create a temporary array of results
    NSMutableArray* _tempAry = [[NSMutableArray alloc] init];
    NSArray* _fixedAry;
    
    for (Flower* f in _flowerDb) {
        if ([[[f type] lowercaseString] containsString:[type lowercaseString]]) {
            [_tempAry addObject:[f color]];
        }
    }
    
    _fixedAry = [[NSArray alloc] initWithArray:_tempAry];
    
    // Return it
    return _fixedAry;
}

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

#pragma mark Singleton Methods

+(id)sharedManager {
    static FlowerContainer* sharedFlowerContainer = nil;
    @synchronized(self) {
        if (sharedFlowerContainer == nil) {
            sharedFlowerContainer = [[self alloc] init];
        }
    }
    return sharedFlowerContainer;
}

- (id)init {
    if (self = [super init]) {
        _flowerDb = [[NSMutableArray alloc] init];
    }
    return self;
}

@end
