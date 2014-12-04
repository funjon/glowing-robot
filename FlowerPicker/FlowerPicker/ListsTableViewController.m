//
//  ListsTableViewController.m
//  FlowerPicker
//
//  Created by Alvin Lee on 11/19/14.
//  Copyright (c) 2014 CDGL. All rights reserved.
//

#import "ListsTableViewController.h"

@interface ListsTableViewController ()

// Static shared containers
@property ColorTracker* colorTracker;
@property FlowerContainer* flowerDb;

// Local objects for managing the list
@property NSMutableDictionary* selectedFlowers;
@property NSArray* colorSectionTitles;

//maria's changes
//Maria: Not sure if this is what we need to add but this is what i did.
// FlowerImage Info:
// -location: x: 8 y: 1
// -size: 75 x 75

@end

@implementation ListsTableViewController

@synthesize colorTracker = _colorTracker;
@synthesize flowerDb = _flowerDb;

@synthesize selectedFlowers = _selectedFlowers;
@synthesize colorSectionTitles = _colorSectionTitles;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    // Get the ColorTracker and FlowerContainer objects
    _colorTracker = [ColorTracker sharedManager];
    _flowerDb = [FlowerContainer sharedManager];
    
    
}

// Need to have a -viewWillAppear so we reload data every time (go back to color picker, add/subtract, need to update data)
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    // Get the list of enabled colors
    _colorSectionTitles = [_colorTracker getActiveColors];
    
    for (NSString* color in _colorSectionTitles) {
        // Add the flowers for each color to _selectedFlowers
        
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return [_colorSectionTitles count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"FlowerInfoCell";
    FlowerInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if( cell == nil ){
        cell  = [[FlowerInfoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    

    
//    Flower *flowerObject = [Flowers objectAtIndex:indexPath.row];
    
   // NSLog(@"MY FLOWER: %@", flowerObject);
//    cell.ColorAndType.text = flowerObject.displayName;
    return cell;
}



- (NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 0;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
