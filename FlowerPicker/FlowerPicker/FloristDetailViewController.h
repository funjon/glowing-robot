//
//  FloristDetailViewController.h
//  FlowerPicker
//
//  Created by rob garcelon on 12/7/14.
//  Copyright (c) 2014 CDGL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FloristAnnotation.h"

@interface FloristDetailViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *floristName;
@property (strong, nonatomic) IBOutlet UILabel *floristAddress;
@property (strong, nonatomic) IBOutlet UILabel *floristUrl;

@property (strong, nonatomic) FloristAnnotation *florist;

@end
