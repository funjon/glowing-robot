//
//  ListsTableViewController.m
//  FlowerPicker
//
//  Created by Alvin Lee on 11/19/14.
//  Copyright (c) 2014 CDGL. All rights reserved.
//

#import "ListsTableViewController.h"
#import "Flower.h"
#import "FlowerInfoCell.h"

@interface ListsTableViewController ()

@end

@implementation ListsTableViewController
{
    NSMutableArray *flowerNames;
    NSMutableArray *flowerTypes;
    NSMutableArray *flowerColors;
    NSMutableArray *flowerDozCosts;
    NSMutableArray *flowerBoqCosts;
    NSMutableArray *flowerImageNames;
    
    NSMutableArray *Flowers;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"flowerData" ofType:@"plist"];
    
    // get data from plist
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    // NSArray *values = [dict allValues];
    NSArray *keys = [dict allKeys];

    Flowers = [[NSMutableArray alloc] initWithCapacity:(dict.count)];

    Flower *flowerObject = [Flower new];
    int i = 0;
    for (NSString *key in keys){
        NSDictionary *tempDict = [[NSDictionary alloc] initWithDictionary: [dict objectForKey: key]];
       
        //
        // no assigning done below  --------------------------------------------
        //
        flowerObject.displayName = [tempDict objectForKey:@"displayName"];
        flowerObject.type = [tempDict objectForKey: @"type"];
        flowerObject.color = [tempDict objectForKey: @"color"];
        flowerObject.dozCost = [tempDict objectForKey: @"dozCost"];
        flowerObject.boqCost = [tempDict objectForKey: @"boqCost"];
        flowerObject.imageName = [tempDict objectForKey: @"imageName"];
        [Flowers insertObject:flowerObject atIndex:i];
        i++;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [Flowers count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"FlowerInfoCell";
    FlowerInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if( cell == nil ){
        cell  = [[FlowerInfoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    

    
    Flower *flowerObject = [Flowers objectAtIndex:indexPath.row];
    
   // NSLog(@"MY FLOWER: %@", flowerObject);
    cell.ColorAndType.text = flowerObject.displayName;
    return cell;
}



- (NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [flowerNames count];
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
