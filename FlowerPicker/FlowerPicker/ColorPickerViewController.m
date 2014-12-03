//
//  ColorPickerViewController.m
//  FlowerPicker
//
//  Created by Alvin Lee on 11/19/14.
//  Copyright (c) 2014 CDGL. All rights reserved.
//

#import "ColorPickerViewController.h"

@interface ColorPickerViewController ()

@property ColorTracker* colorTracker;
@property FlowerContainer* flowerDb;
@end

@implementation ColorPickerViewController

@synthesize colorTracker = _colorTracker;
@synthesize flowerDb = _flowerDb;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    // Get the color tracker object, and load from the plist.
    if (!_colorTracker) {
        NSLog(@"Getting colorTracker object");
        _colorTracker = [ColorTracker sharedManager];
        
        // Init the flowerDb
        NSString* path = [[NSBundle mainBundle] pathForResource:@"flowerData" ofType:@"plist"];
        
        // get data from plist
        NSDictionary* dict = [[NSDictionary alloc] initWithContentsOfFile:path];
        NSArray *keys = [dict allKeys];
        
        NSLog(@"Loaded %lu flowers from plist", [keys count]);
        
        // Get the flowerbox singleton
        _flowerDb = [FlowerContainer sharedManager];
        
        for (NSString* key in keys) {
            Flower* newFlower = [[Flower alloc] init];
            [newFlower setDisplayName:[[dict objectForKey:key] objectForKey:@"displayName"]];
            [newFlower setColor:[[dict objectForKey:key] objectForKey:@"color"]];
            [newFlower setType:[[dict objectForKey:key] objectForKey:@"type"]];
            [newFlower setDozCost:(NSUInteger)[[dict objectForKey:key] objectForKey:@"dozCost"]];
            [newFlower setBoqCost:(NSUInteger)[[dict objectForKey:key] objectForKey:@"boqCost"]];
            [newFlower setImageName:[[dict objectForKey:key] objectForKey:@"imageName"]];
            [newFlower setSeason:[[dict objectForKey:key] objectForKey:@"season"]];
            
            // Make sure the color is present in the colorTracker
            [_colorTracker addAvailableColor:[newFlower color]];
            
//            NSLog(@"Loaded flower %@ with color %@ and imagename %@ and costs $%lu $%lu", [newFlower displayName], [newFlower color], [newFlower imageName], [newFlower dozCost], [newFlower boqCost]);
            // Add the new flower to the container
            [_flowerDb addFlower:newFlower withName:[newFlower displayName]];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)colorPick:(UIButton *)sender {
    [self selectColor: sender.currentTitle];
}

-(void)selectColor:(NSString *)key{
    if([_colorTracker isActive:key]) { [_colorTracker setColor:key to:@"off"]; }
    else                             { [_colorTracker setColor:key to:@"on"]; }
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
