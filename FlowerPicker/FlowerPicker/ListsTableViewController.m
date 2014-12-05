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
    _colorSectionTitles = [[NSArray alloc] initWithArray:[_colorTracker getActiveColors]];
    
    // Clear out any previously selected flowers
    _selectedFlowers = [[NSMutableDictionary alloc] init];
    
    // Get a list of flower names for each color
    for (NSString* color in _colorSectionTitles) {
        NSArray* temp = [[NSArray alloc] initWithArray:[_flowerDb getFlowersWithColor:color]];
        [_selectedFlowers setObject:temp forKey:[color capitalizedString]];
    }

    /*
    // DEBUG
    NSLog(@"_selectedFlowers has %lu entries",[_selectedFlowers count]);
    for (NSString* f in _selectedFlowers) {
        NSLog(@"Selection includes %@",f);
        NSLog(@"Flowers in this section are %@",[_selectedFlowers objectForKey:f]);
    }
    */
    
    // Reload the table
    [self.tableView reloadData];
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
    NSString* sectionTitle = [[_colorSectionTitles objectAtIndex:section] capitalizedString];
    NSArray* sectionFlowers = [_selectedFlowers objectForKey:sectionTitle];
    
    return [sectionFlowers count];
}

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [[_colorSectionTitles objectAtIndex:section] capitalizedString];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // Cell bootstrapping data
    static NSString *cellIdentifier = @"FlowerInfoCell";
    FlowerInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if( cell == nil ){
        cell  = [[FlowerInfoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    // Data we need for our cell
    NSString* sectionTitle = [[_colorSectionTitles objectAtIndex:indexPath.section] capitalizedString];
    NSArray* sectionFlowers = [_selectedFlowers objectForKey:sectionTitle];
    
    NSString* flowerName = [sectionFlowers objectAtIndex:indexPath.row];
    NSString* flowerImage = [[_flowerDb getFlower:flowerName] imageName];
    
    cell.flowerName.text = flowerName;
    cell.flowerImage.image = [UIImage imageNamed:flowerImage];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 1;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showItemDetail"]) {
        // Get the current row
        NSIndexPath* indexPath = [self.tableView indexPathForSelectedRow];
        
        // Get the target viewController
        FlowerDetailsViewController* dvc = segue.destinationViewController;
        
        // Get data we need for the selected cell
        NSString* sectionTitle = [[_colorSectionTitles objectAtIndex:indexPath.section] capitalizedString];
        NSArray* sectionFlowers = [_selectedFlowers objectForKey:sectionTitle];

        NSString* flowerName = [sectionFlowers objectAtIndex:indexPath.row];

        // Pass data over to the dvc
        dvc.segueFlowerName = flowerName;
        dvc.segueFlowerImage = [[_flowerDb getFlower:flowerName] imageName];
        dvc.segueDozenCost = (int)[[_flowerDb getFlower:flowerName] dozCost];
        dvc.segueBouquetCost = (int)[[_flowerDb getFlower:flowerName] boqCost];
        
        // Send the seasons dictionary
        dvc.segueSeasonImages = [[_flowerDb getFlower:flowerName] season];
        
        // Send the color array
        dvc.segueColorImages = [_flowerDb getColorsForType:[[_flowerDb getFlower:flowerName] type]];
    }
}

@end
