//
//  ColorPickerViewController.h
//  FlowerPicker
//
//  Created by Alvin Lee on 11/19/14.
//  Copyright (c) 2014 CDGL. All rights reserved.
//

#import <UIKit/UIKit.h>

// Object to keep track of active colors across views
#import "ColorTracker.h"

/*


 Color Buttons:  120 Width x 80 Height
 
    - First Button(Top Left)  X: 29 Y: 66 .  To get Button under, Same X and add 88.
    - Second Button (Top Right) X:219  Y:66. To get Button Under Same X and add 88.
    - Labels Should just be moved to middle center above and under the buttons.
 
 
 
 */
@interface ColorPickerViewController : UIViewController

@end
