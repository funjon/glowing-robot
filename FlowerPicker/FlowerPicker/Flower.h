//
//  Flower.h
//  FlowerPicker
//
//  Created by Jonathan Disher on 11/24/14.
//  Copyright (c) 2014 CDGL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Flower : NSObject

-(NSString*)displayName;
-(NSString*)type;
-(NSString*)color;
-(NSString*)imageName;
-(int)dozCost;
-(int)boqCost;
-(NSDictionary*)season;

-(void)setDisplayName:(NSString*)dn;
-(void)setType:(NSString*)t;
-(void)setColor:(NSString*)c;
-(void)setImageName:(NSString*)img;
-(void)setDozCost:(int)dc;
-(void)setBoqCost:(int)bc;
-(void)setSeason:(NSString*)sea to:(BOOL)value;

@end
