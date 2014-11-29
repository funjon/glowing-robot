//
//  ColorSelection.h
//  FlowerPicker
//
//  Created by rob garcelon on 11/29/14.
//  Copyright (c) 2014 CDGL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ColorSelection : NSObject

@property NSMutableDictionary* selectedColors;

// setter
-(void)selectColor:(NSString *)key;

// getter
-(BOOL)isSelected:(NSString *)key;

@end
