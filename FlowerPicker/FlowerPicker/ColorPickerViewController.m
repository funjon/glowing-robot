//
//  ColorPickerViewController.m
//  FlowerPicker
//
//  Created by Alvin Lee on 11/19/14.
//  Copyright (c) 2014 CDGL. All rights reserved.
//

#import "ColorPickerViewController.h"

@interface ColorPickerViewController ()

@property NSMutableDictionary *colorPicks;
@property ColorTracker* colorTracker;
@property NSMutableArray* flowerDb;

@end

@implementation ColorPickerViewController

@synthesize colorTracker = _colorTracker;
@synthesize flowerDb = _flowerDb;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.colorPicks = [self getDictionary];
    
    // If it doesn't exist, build the color tracker object. This is also where
    // we will load the data from plist
    if (!_colorTracker) {
        NSLog(@"Creating colorTracker object");
        _colorTracker = [[ColorTracker alloc] init];
        
        // Init the flowerDb
        NSString* path = [[NSBundle mainBundle] pathForResource:@"flowerData" ofType:@"plist"];
        
        // get data from plist
        NSDictionary* dict = [[NSDictionary alloc] initWithContentsOfFile:path];
        NSArray *keys = [dict allKeys];
        
        NSLog(@"Loaded %lu flowers from plist", [keys count]);
        
        // Create the array and populate it
        _flowerDb = [[NSMutableArray alloc] init];
        
        for (NSString* key in keys) {
            Flower* newFlower = [[Flower alloc] init];
            [newFlower setDisplayName:[[dict objectForKey:key] objectForKey:@"displayName"]];
            [newFlower setColor:[[dict objectForKey:key] objectForKey:@"color"]];
            [newFlower setType:[[dict objectForKey:key] objectForKey:@"type"]];
            [newFlower setDozCost:(NSUInteger)[[dict objectForKey:key] objectForKey:@"dozCost"]];
            [newFlower setBoqCost:(NSUInteger)[[dict objectForKey:key] objectForKey:@"boqCost"]];
            [newFlower setImageName:[[dict objectForKey:key] objectForKey:@"imageName"]];
            [newFlower setSeason:[[dict objectForKey:key] objectForKey:@"season"]];
            
//            NSLog(@"Loaded flower %@ with color %@ and imagename %@ and costs $%lu $%lu", [newFlower displayName], [newFlower color], [newFlower imageName], [newFlower dozCost], [newFlower boqCost]);
            [_flowerDb addObject:newFlower];
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


-(NSMutableDictionary*)getDictionary{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]initWithObjectsAndKeys:
                                 @NO, @"Red",
                                 @NO, @"Yellow",
                                 @NO, @"Turquoise",
                                 @NO, @"Purple",
                                 @NO, @"Pink",
                                 @NO, @"Orange",
                                 @NO, @"Green",
                                 @NO, @"Blue",
                                 @NO, @"White",
                                 @NO, @"Brown",
                                 nil];
    return dict;
}


-(void)selectColor:(NSString *)key{
    if([self isSelected: key]) { self.colorPicks[key] = @NO; }
    else                       { self.colorPicks[key] = @YES; }
}


-(BOOL)isSelected:(NSString *)key{
    return [[self.colorPicks objectForKey:key]boolValue];
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
