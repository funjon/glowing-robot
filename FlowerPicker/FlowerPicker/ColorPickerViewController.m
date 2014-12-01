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

@end

@implementation ColorPickerViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.colorPicks = [self getDictionary];

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
    if([self isSelected: key])
        self.colorPicks[key] = @NO;
    else
        self.colorPicks[key] = @YES;
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
