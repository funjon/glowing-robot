//
//  FlowerTableViewController.m
//  FlowerPicker
//
//  Created by Jonathan Disher on 12/6/14.
//  Copyright (c) 2014 CDGL. All rights reserved.
//

#import "FlowerTableViewController.h"

@interface FlowerTableViewController ()

// Static shared containers
@property ColorTracker* colorTracker;
@property FlowerContainer* flowerDb;

// Local objects for managing the list
@property NSMutableDictionary* selectedFlowers;
@property NSArray* colorSectionTitles;

// Search results
@property NSMutableArray* searchResults;

@end

@implementation FlowerTableViewController

@synthesize colorTracker = _colorTracker;
@synthesize flowerDb = _flowerDb;

@synthesize selectedFlowers = _selectedFlowers;
@synthesize colorSectionTitles = _colorSectionTitles;

@synthesize searchResults = _searchResults;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Get the ColorTracker and FlowerContainer objects
    _colorTracker = [ColorTracker sharedManager];
    _flowerDb = [FlowerContainer sharedManager];
    _searchResults = [[NSMutableArray alloc] init];
}

// Need to have a -viewWillAppear so we reload data every time (go back to color picker, add/subtract, need to update data)
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // Get the list of enabled colors
    if ([[_colorTracker getActiveColors] count] == 0) {
        _colorSectionTitles = [[NSArray alloc] initWithArray:[_colorTracker allColors]];
    } else {
        _colorSectionTitles = [[NSArray alloc] initWithArray:[_colorTracker getActiveColors]];
    }
        
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
    if (self.searchDisplayController.isActive) { return 1; }
    else { return [_colorSectionTitles count]; }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.searchDisplayController.isActive) {
        NSLog(@"[numberOfRowsInSection] I have %lu searchResults to display", [_searchResults count]);
        return [_searchResults count];
    } else {
        // Return the number of rows in the section.
        NSString* sectionTitle = [[_colorSectionTitles objectAtIndex:section] capitalizedString];
        NSArray* sectionFlowers = [_selectedFlowers objectForKey:sectionTitle];
        NSLog(@"[numberOfRowsInSection] I have %lu flowers to display in this section", [sectionFlowers count]);
        return [sectionFlowers count];
    }
}

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (self.searchDisplayController.isActive) { return @"Search Results"; }
    else { return [[_colorSectionTitles objectAtIndex:section] capitalizedString]; }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 78;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // Cell bootstrapping data
    static NSString *cellIdentifier = @"FlowerInfoCell";

    FlowerInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if( cell == nil ){
        cell  = [[FlowerInfoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }

    NSString* flowerName;
    NSString* flowerImage;
    
    if (self.searchDisplayController.isActive) {
        NSLog(@"Trying to populate a default cell");
        NSLog(@"There are %lu results in searchResults", [_searchResults count]);
        if ([_searchResults count]) { flowerName = [_searchResults objectAtIndex:indexPath.row]; }
        cell.textLabel.text = flowerName;
    } else {
        // Data we need for our cell
        NSString* sectionTitle = [[_colorSectionTitles objectAtIndex:indexPath.section] capitalizedString];
        NSArray* sectionFlowers = [_selectedFlowers objectForKey:sectionTitle];
        
        flowerName = [sectionFlowers objectAtIndex:indexPath.row];
        flowerImage = [[_flowerDb getFlower:flowerName] imageName];
        cell.flowerName.text = flowerName;
        cell.flowerImage.image = [UIImage imageNamed:flowerImage];
    }
    

    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 1;
}

-(void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope {
    // Temporary dict to dedupe results
    NSMutableDictionary* tempDict = [[NSMutableDictionary alloc] init];
    
    // Walk through the array of flower names, and if the searchtext matches any of the following, include it:
    // -> flowerName
    // -> type
    // -> color

    for (NSString* flowerName in [_flowerDb getFlowerNames]) {
        NSString* fColor = [[[_flowerDb getFlower:flowerName] color] lowercaseString];
        NSString* fType = [[[_flowerDb getFlower:flowerName] type] lowercaseString];
 
        // Check flowerName first
        if ([[flowerName lowercaseString] rangeOfString:[searchText lowercaseString]].location != NSNotFound) {
            [tempDict setObject:@"YES" forKey:flowerName];
        }
        // Check color
        if ([fColor rangeOfString:[searchText lowercaseString]].location != NSNotFound) {
            [tempDict setObject:@"YES" forKey:flowerName];
        }
        // Check type
        if ([fType rangeOfString:[searchText lowercaseString]].location != NSNotFound) {
            [tempDict setObject:@"YES" forKey:flowerName];
        }
    }
    
    // Now collapse the keys into the searchResults array
    [_searchResults removeAllObjects];
    [_searchResults addObjectsFromArray:[tempDict allKeys]];
}
                      
-(BOOL)searchDisplayController:(UISearchDisplayController*) controller shouldReloadTableForSearchString:(NSString*)searchString {
    [self filterContentForSearchText:searchString scope:@"ALL"];
    return YES;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showItemDetail"]) {
        // Get the current row
        NSIndexPath* indexPath = [self.tableView indexPathForSelectedRow];
        
        // Get the target viewController
        FlowerDetailsViewController* dvc = segue.destinationViewController;
        
        NSString* flowerName;
        if (self.searchDisplayController.isActive) {
            // Get data we need for the selected cell
            NSString* sectionTitle = [[_colorSectionTitles objectAtIndex:indexPath.section] capitalizedString];
            NSArray* sectionFlowers = [_selectedFlowers objectForKey:sectionTitle];
            
            flowerName = [sectionFlowers objectAtIndex:indexPath.row];
        } else {
            if ([_searchResults count]) {
                flowerName = [_searchResults objectAtIndex:indexPath.row];
            }
            \
        }
        
        // Pass the flower object over to the dvc, let the dvc unpack it.
        dvc.segueFlower = [_flowerDb getFlower:flowerName];
    }
}

@end
