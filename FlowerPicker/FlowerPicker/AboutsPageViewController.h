//
//  AboutsPageViewController.h
//  FlowerPicker
//
//  Created by Alvin Lee on 11/19/14.
//  Copyright (c) 2014 CDGL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AboutsPageViewController : UIViewController


@property (weak, nonatomic) IBOutlet UILabel *AboutFlowers;

@property (weak, nonatomic) IBOutlet UITextView *Description;

- (IBAction)DaisyButton:(id)sender;
- (IBAction)HydrangeasButton:(id)sender;
- (IBAction)MumButton:(id)sender;
- (IBAction)CallaButton:(id)sender;
- (IBAction)DelphiniumsButton:(id)sender;
- (IBAction)IrisButton:(id)sender;
- (IBAction)AlstroemeriaButton:(id)sender;
- (IBAction)OrchidsButton:(id)sender;
- (IBAction)SunflowersButton:(id)sender;
- (IBAction)RoseButton:(id)sender;
- (IBAction)SnapdragonsButton:(id)sender;
- (IBAction)LiliesButton:(id)sender;


@end
