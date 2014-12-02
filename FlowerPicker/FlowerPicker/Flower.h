//
//  Flower.h
//  FlowerPicker
//
//  Created by Jonathan Disher on 11/24/14.
//  Copyright (c) 2014 CDGL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Flower : NSObject

// Get methods
-(NSString*)displayName;
-(NSString*)type;
-(NSString*)color;
-(NSString*)imageName;
-(NSUInteger)dozCost;
-(NSUInteger)boqCost;
-(NSDictionary*)season;
-(BOOL)season: (NSString*)s; // Overload to allow getting specific season

// Set methods
-(void)setDisplayName:(NSString*)dn;
-(void)setType:(NSString*)t;
-(void)setColor:(NSString*)c;
-(void)setImageName:(NSString*)img;
-(void)setDozCost:(NSUInteger)dc;
-(void)setBoqCost:(NSUInteger)bc;
-(void)setSeason:(NSDictionary*)s;

@end
