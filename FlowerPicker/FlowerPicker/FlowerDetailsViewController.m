//
//  FlowerDetailsViewController.m
//  FlowerPicker
//
//  Created by Alvin Lee on 11/19/14.
//  Copyright (c) 2014 CDGL. All rights reserved.
//

#import "FlowerDetailsViewController.h"

@interface FlowerDetailsViewController ()
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

@end

@implementation FlowerDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    Flower *flowerObject = [Flower new];
/*
    flowerObject.displayName = @"Yellow Rose";
    flowerObject.type = @"rose";
    flowerObject.colo
*/
    
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
