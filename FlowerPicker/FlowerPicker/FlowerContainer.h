//
//  FlowerContainer.h
//  FlowerPicker
//
//  Created by Jonathan Disher on 12/1/14.
//  Copyright (c) 2014 CDGL. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Flower.h"

@interface FlowerContainer : NSObject

// Get methods
-(Flower*)getFlower:(NSString*)withName;
-(NSArray*)getArray;
-(NSUInteger)count;

// Set methods
-(void)addFlower:(Flower*)flower withName:(NSString*)name;

@end
