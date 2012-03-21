//
//  BuildingPickerViewController.m
//  GrizSpace
//
//  Created by William Lyon on 3/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BuildingPickerViewController.h"
#import "MapViewController.h"
@interface BuildingPickerViewController ()

@end

@implementation BuildingPickerViewController
@synthesize searchBar = _searchBar;
@synthesize buildings = _buildings;

@synthesize delegate;

//@synthesize database;

-(void) setBuildings:(NSMutableArray *)buildings
{
    _buildings = buildings;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
   // NSArray *myArray = [NSArray arrayWithObjects:@"Main Hall", nil];//@"Aber Hall", @"Adams Center", @"Art Annex", @"Chemistry Building", @"Corbin Hall", @"Craig Hall", @"Davidson Honors College", @"Duniway Hall", @"Forestry", @"Grizzly Pool", @"Hoyt Athletic Complex", @"Jesse Hall", @"Liberal Arts", @"Main Hall", @"Music", nil];
   // [self setBuildings:myArray];
  //  [self setBuildings:[database getAllBuildings]];
    
    DBAccess *dbAccess = [[DBAccess alloc] init];
    
    self.buildings = [dbAccess getAllBuildings];
    
    [dbAccess closeDatabase];
    
 //   self.searchController = [[UISearchDisplayController alloc] initWithSearchBar:self.searchBar contentsController:self];
//    self.searchController.searchResultsDataSource = self;
//    self.searchController.searchResultsDelegate = self;
    

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [self setSearchBar:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

/*
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}
*/

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    NSLog(@"Number of buildings: %d", [self.buildings count]);
    
    if (tableView == self.tableView)
    {
        return [self.buildings count];
    }
    
    NSMutableArray *flattenedArray = [[NSMutableArray alloc] initWithCapacity:1];
    for (NSMutableArray *theArray in self.buildings)
    {
        for (int i=0; i<[theArray count]; i++)
        {
            [flattenedArray addObject:[theArray objectAtIndex:i]];
        }
    }
    /*
NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name beginswith[c] %@", self.searchBar.text];
self.filteredBuildings = [flattenedArray filteredArrayUsingPredicate:predicate];
return self.filteredBuildings.count;


*/
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Building";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    cell.textLabel.text = [[self.buildings objectAtIndex:indexPath.row] name];
    
    cell.detailTextLabel.text = [[self.buildings objectAtIndex:indexPath.row] idBuilding];
    return cell;
    }
    
/*
    cell.textLabel.text = [[self.filteredBuildings objectAtIndex:indexPath.row] getName];
    
    cell.detailTextLabel.text = [[self.filteredBuildings objectAtIndex:indexPath.row] getID];
    
    return cell;
}
*/
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
    
    //sets the correct tab index
    [self.tabBarController setSelectedIndex:0];
    
    //get handle for nav controller
    UINavigationController *tmpNC = [self.tabBarController.viewControllers objectAtIndex:0];
    
    //get handle for map view controller
    MapViewController *mView = [tmpNC.viewControllers objectAtIndex:0];
    
    //set the appropriate delegate for the action
    self.delegate = mView;
    
    //call delegate action
    [delegate showBuildingAnnotation:1];    
    
    
}

@end
