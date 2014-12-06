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

@end

@implementation FlowerDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Flower data
    self.flowerName.text = self.segueFlowerName;
    self.flowerImage.image = [UIImage imageNamed:self.segueFlowerImage];
    self.dozenCost.text = [NSString stringWithFormat:@"$%.2f", (float)self.segueDozenCost];
    self.bouquetCost.text = [NSString stringWithFormat:@"$%.2f", (float)self.segueBouquetCost];
    
    // Set all the seasons and colors to disabled
    self.imageWinter.image = [UIImage imageNamed:@"winter-disabled"];
    self.imageSpring.image = [UIImage imageNamed:@"spring-disabled"];
    self.imageSummer.image = [UIImage imageNamed:@"summer-disabled"];
    self.imageFall.image = [UIImage imageNamed:@"fall-disabled"];
    
    // Parse the season dictionary
    for (NSString* season in self.segueSeasonImages.allKeys) {
        NSLog(@"Looking at season %@, value is %@",season, [[self segueSeasonImages] objectForKey:season]);
        if ([[[self segueSeasonImages] objectForKey:season] boolValue]) {
            if ([season isEqualToString:@"winter"]) { self.imageWinter.image = [UIImage imageNamed:season]; }
            if ([season isEqualToString:@"spring"]) { self.imageSpring.image = [UIImage imageNamed:season]; }
            if ([season isEqualToString:@"summer"]) { self.imageSummer.image = [UIImage imageNamed:season]; }
            if ([season isEqualToString:@"fall"])   { self.imageFall.image   = [UIImage imageNamed:season]; }
       }
    }
    
    // Parse the colorsForType array
    for (NSString* color in self.segueColorImages) {
        NSLog(@"Available color: %@",color);
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
