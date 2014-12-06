//
//  FlowerDetailsViewController.m
//  FlowerPicker
//
//  Created by Alvin Lee on 11/19/14.
//  Copyright (c) 2014 CDGL. All rights reserved.
//

#import "FlowerDetailsViewController.h"

@interface FlowerDetailsViewController ()
// FlowerImage Info:
// -location: x: 85 y: 142
// -size: 220 x 230

@property FlowerContainer* flowerDb;

@end

@implementation FlowerDetailsViewController

@synthesize flowerDb = _flowerDb;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Get the flowerDB
    _flowerDb = [FlowerContainer sharedManager];
    // Flower data
    self.flowerName.text = [[self segueFlower] displayName];
    self.flowerImage.image = [UIImage imageNamed:[[self segueFlower] imageName]];
    self.dozenCost.text = [NSString stringWithFormat:@"$%.2f", (double)[[self segueFlower] dozCost]];
    self.bouquetCost.text = [NSString stringWithFormat:@"$%.2f", (double)[[self segueFlower] boqCost]];
    
    // Set all the seasons and colors to disabled
    self.imageWinter.image = [UIImage imageNamed:@"winter-disabled"];
    self.imageSpring.image = [UIImage imageNamed:@"spring-disabled"];
    self.imageSummer.image = [UIImage imageNamed:@"summer-disabled"];
    self.imageFall.image = [UIImage imageNamed:@"fall-disabled"];
    
    // Parse the season dictionary
    for (NSString* s in [[[self segueFlower] season] allKeys]) {
//        NSLog(@"Looking at season %@, value is %@", s, [[self segueFlower] season:s] ? @"TRUE" : @"FALSE");
        if ([[self segueFlower] season:s] == true) {
            if ([s isEqualToString:@"winter"]) { self.imageWinter.image = [UIImage imageNamed:s]; }
            if ([s isEqualToString:@"spring"]) { self.imageSpring.image = [UIImage imageNamed:s]; }
            if ([s isEqualToString:@"summer"]) { self.imageSummer.image = [UIImage imageNamed:s]; }
            if ([s isEqualToString:@"fall"])   { self.imageFall.image   = [UIImage imageNamed:s]; }
       }
    }
    
    // Parse the colorsForType array
    NSArray* colorImages = [[NSArray alloc] initWithArray:[_flowerDb getColorsForType:[[self segueFlower] type]]];
    for (NSString* color in colorImages) {
//        NSLog(@"Available color: %@",color);
        if ([color isEqualToString:@"red"])       { self.imageRed.image = [UIImage imageNamed:color];       self.imageRed.alpha = 1;       }
        if ([color isEqualToString:@"orange"])    { self.imageOrange.image = [UIImage imageNamed:color];    self.imageOrange.alpha = 1;    }
        if ([color isEqualToString:@"yellow"])    { self.imageYellow.image = [UIImage imageNamed:color];    self.imageYellow.alpha = 1;    }
        if ([color isEqualToString:@"turquoise"]) { self.imageTurquoise.image = [UIImage imageNamed:color]; self.imageTurquoise.alpha = 1; }
        if ([color isEqualToString:@"green"])     { self.imageGreen.image = [UIImage imageNamed:color];     self.imageGreen.alpha = 1;     }
        if ([color isEqualToString:@"blue"])      { self.imageBlue.image = [UIImage imageNamed:color];      self.imageBlue.alpha = 1;      }
        if ([color isEqualToString:@"purple"])    { self.imagePurple.image = [UIImage imageNamed:color];    self.imagePurple.alpha = 1;    }
        if ([color isEqualToString:@"white"])     { self.imageWhite.image = [UIImage imageNamed:color];     self.imageWhite.alpha = 1;     }
        if ([color isEqualToString:@"pink"])      { self.imagePink.image = [UIImage imageNamed:color];      self.imagePink.alpha = 1;      }
        if ([color isEqualToString:@"brown"])     { self.imageBrown.image = [UIImage imageNamed:color];     self.imageBrown.alpha = 1;     }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
