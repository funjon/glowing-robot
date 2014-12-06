//
//  FlowerContainer.h
//  FlowerPicker
//
//  Created by Jonathan Disher on 12/1/14.
//  Copyright (c) 2014 CDGL. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Flower.h"

@interface FlowerContainer : NSObject {
    NSMutableArray* flowerDb;
}

@property (nonatomic, retain) NSMutableArray* flowerDb;


// Get methods
-(Flower*)getFlower:(NSString*)withName;
-(NSArray*)getFlowersWithColor:(NSString*)color;
-(NSArray*)getColorsForType:(NSString*)type;
-(NSArray*)getFlowerNames;
-(NSUInteger)count;

// Set methods
-(void)addFlower:(Flower*)flower withName:(NSString*)name;

// Class method to make this a singleton
+(id)sharedManager;

@end
