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

/* properties
 // Images
 // For disabled, set image to $image-disabled
 @property (strong, nonatomic) IBOutlet UIImageView *imageWinter;
 @property (strong, nonatomic) IBOutlet UIImageView *imageSpring;
 @property (strong, nonatomic) IBOutlet UIImageView *imageSummer;
 @property (strong, nonatomic) IBOutlet UIImageView *imageFall;
 
 @property (strong, nonatomic) IBOutlet UIImageView *imageRed;
 @property (strong, nonatomic) IBOutlet UIImageView *imageOrange;
 @property (strong, nonatomic) IBOutlet UIImageView *imageYellow;
 @property (strong, nonatomic) IBOutlet UIImageView *imageTurquoise;
 @property (strong, nonatomic) IBOutlet UIImageView *imageGreen;
 @property (strong, nonatomic) IBOutlet UIImageView *imageBlue;
 @property (strong, nonatomic) IBOutlet UIImageView *imagePurple;
 @property (strong, nonatomic) IBOutlet UIImageView *imageWhite;
 @property (strong, nonatomic) IBOutlet UIImageView *imagePink;
 @property (strong, nonatomic) IBOutlet UIImageView *imageBrown;
 
 // Labels
 @property (strong, nonatomic) IBOutlet UILabel *flowerName;
 @property (strong, nonatomic) IBOutlet UIImageView *flowerImage;
 @property (strong, nonatomic) IBOutlet UILabel *dozenCost;
 @property (strong, nonatomic) IBOutlet UILabel *bouquetCost;
 
 * Remote properties - to set via segue

 @property (strong, nonatomic) NSString* segueFlowerName;
 @property (strong, nonatomic) NSString* segueFlowerImage;
 @property (strong, nonatomic) NSString* segueDozenCost;
 @property (strong, nonatomic) NSString* segueBouquetCost;
 
 // We will iterate through these two arrays to figure out which ones
 @property (strong, nonatomic) NSArray* segueColorImages;
 @property (strong, nonatomic) NSArray* segueSeasonImages;

*/

@implementation FlowerDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Flower data
    self.flowerName.text = self.segueFlowerName;
    self.flowerImage.image = [UIImage imageNamed:self.segueFlowerImage];
    self.dozenCost.text = [NSString stringWithFormat:@"$%.2f", (float)self.segueDozenCost];
    self.bouquetCost.text = [NSString stringWithFormat:@"$%.2f", (float)self.segueBouquetCost];
    
//    // Set all the seasons and colors to disabled
//    self.imageWinter.image = [UIImage imageNamed:@"winter-disabled"];
//    self.imageSpring.image = [UIImage imageNamed:@"spring-disabled"];
//    self.imageSummer.image = [UIImage imageNamed:@"summer-disabled"];
//    self.imageFall.image = [UIImage imageNamed:@"fall-disabled"];
//    
//    self.imageRed.image = [UIImage imageNamed]
    
    // Parse the season dictionary
    for (NSString* season in self.segueSeasonImages.allKeys) {
        NSLog(@"Looking at season %@, value is %@",season, [[self segueSeasonImages] objectForKey:season]);
        
        if ([season isEqualToString:@"winter"] && [[[self segueSeasonImages] objectForKey:season] boolValue]) {
            NSLog(@"Enabling season %@", season);
            self.imageWinter.image = [UIImage imageNamed:season];
            self.imageWinter.alpha = 1;
        }
        if ([season isEqualToString:@"spring"] && [[[self segueSeasonImages] objectForKey:season] boolValue]) {
            NSLog(@"Enabling season %@", season);
            self.imageSpring.image = [UIImage imageNamed:season];
            self.imageSpring.alpha = 1;
        }
        if ([season isEqualToString:@"summer"] && [[[self segueSeasonImages] objectForKey:season] boolValue]) {
            NSLog(@"Enabling season %@", season);
            self.imageSummer.image = [UIImage imageNamed:season];
            self.imageSummer.alpha = 1;
        }
        if ([season isEqualToString:@"fall"] && [[[self segueSeasonImages] objectForKey:season] boolValue]) {
            NSLog(@"Enabling season %@", season);
            self.imageFall.image = [UIImage imageNamed:season];
            self.imageFall.alpha = 1;
        }
    }
    
    // Parse the colorsForType array
    for (NSString* color in self.segueColorImages) {
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
