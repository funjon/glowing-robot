//
//  ColorSelection.m
//  FlowerPicker
//
//  Created by rob garcelon on 11/29/14.
//  Copyright (c) 2014 CDGL. All rights reserved.
//

#import "ColorSelection.h"

@interface ColorSelection( )


@end


@implementation ColorSelection

-(instancetype)init{

    self = [super init];
    
    if( self ){
        _selectedColors = [[NSMutableDictionary alloc]init];
        _selectedColors = @{@"Red"      : @NO,
                            @"Yellow"   : @NO,
                            @"Turquoise": @NO,
                            @"Purple"   : @NO,
                            @"Pink"     : @NO,
                            @"Orange"   : @NO,
                            @"Green"    : @NO,
                            @"Blue"     : @NO,
                            @"White"    : @NO,
                            @"Brown"    : @NO};
    }
    return self;
}


// setters
-(void)selectColor:(NSString *)key{
    if([self.selectedColors objectForKey: key] == 0){
        [self.selectedColors setObject: [NSNumber numberWithBool:1]
                                forKey: key];
    }
    else{
        [self.selectedColors setObject: [NSNumber numberWithBool:0]
                                                      forKey: key];
    }
}

// getter
-(BOOL)isSelected:(NSString *)key{
    return [self.selectedColors objectForKey:key];
}

@end
