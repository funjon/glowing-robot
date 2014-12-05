//
//  FlowerDetailsViewController.h
//  FlowerPicker
//
//  Created by Alvin Lee on 11/19/14.
//  Copyright (c) 2014 CDGL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlowerContainer.h"
#import "Flower.h"

@interface FlowerDetailsViewController : UIViewController

/*
 * Local properties - for outlets on this view
 */

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

/*
 * Remote properties - to set via segue
 */

@property (strong, nonatomic) NSString* segueFlowerName;
@property (strong, nonatomic) NSString* segueFlowerImage;
@property (nonatomic) NSUInteger segueDozenCost;
@property (nonatomic) NSUInteger segueBouquetCost;

// We will iterate through these two arrays to figure out which ones
@property (strong, nonatomic) NSArray* segueColorImages;
@property (strong, nonatomic) NSDictionary* segueSeasonImages;

@end
