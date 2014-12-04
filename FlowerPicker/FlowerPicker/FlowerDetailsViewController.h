//
//  FlowerDetailsViewController.h
//  FlowerPicker
//
//  Created by Alvin Lee on 11/19/14.
//  Copyright (c) 2014 CDGL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Flower.h"

@interface FlowerDetailsViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *FlowerName;
// FlowerImage Info:
// -location: x: 85 y: 142
// -size: 220 x 230
@property (strong, nonatomic) IBOutlet UIImageView *FlowerImage;
@property (strong, nonatomic) IBOutlet UILabel *FlowerColors;
@property (strong, nonatomic) IBOutlet UILabel *FlowerCosts;
@property (strong, nonatomic) IBOutlet UILabel *season;
@property (strong, nonatomic) IBOutlet UILabel *dozCost;
@property (strong, nonatomic) IBOutlet UILabel *boqCost;


// @property Flower Object?

@end
