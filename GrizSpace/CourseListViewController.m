//
//  CourseListViewController.m
//  GrizSpace
//
//  Created by William Lyon on 3/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CourseListViewController.h"
#import "GrizSpaceDataObjects.h"
#import "AppDelegateProtocol.h"

@interface CourseListViewController ()

@end

@implementation CourseListViewController
@synthesize courses = _courses;
@synthesize dayTimes = _dayTimes;


- (GrizSpaceDataObjects*) theAppDataObject;
{
	id<AppDelegateProtocol> theDelegate = (id<AppDelegateProtocol>) [UIApplication sharedApplication].delegate;
	GrizSpaceDataObjects* theDataObject;
	theDataObject = (GrizSpaceDataObjects*) theDelegate.theAppDataObject;
	return theDataObject;
}

-(void) setCourses:(NSArray *)courses
{
    _courses = courses;
}

-(void) setDayTimes:(NSArray *)dayTimes
{
    _dayTimes = dayTimes;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        
        GrizSpaceDataObjects* theDataObject = [self theAppDataObject];
        
        //set reference to the course detail controler.
        theDataObject.myCourseListViewController = self;
    }
    
    
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSArray *myCourses = [NSArray arrayWithObjects:@"CSCI 491", @"CSCI 576", @"CSCI 511", @"ECON 591", @"ECON 221", nil];
    
    NSArray *myDayTimes = [NSArray arrayWithObjects:@"MWF   8:10-9:00     SS 362", @"MWF  9:10-10:00   SS 355", @"TTh  8:30-10     GBB 121", @"TTh     12:40-2:00      LA 411", @"MWF  3:10-4:00   SS 341",nil];
    
    [self setCourses:myCourses];
    [self setDayTimes:myDayTimes];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
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
    return [self.courses count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Course";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    
    cell.textLabel.text = [self.courses objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [self.dayTimes objectAtIndex:indexPath.row];
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
      //  [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


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
-(void) SelectRowAtIndex: (int)rowIndex
{

    GrizSpaceDataObjects* theDataObject = [self theAppDataObject];
    //[self.navigationController pushViewController: theDataObject.courseDVC animated:YES];
    
    //[theDataObject.clvc.tableView cellForRowAtIndexPath:ip];
    
    
    //[theDataObject.clvc.tableView selectRowAtIndexPath:ip animated:YES scrollPosition:UITableViewRowAnimationAutomatic];
    
    //NSIndexPath* ip = [NSIndexPath indexPathForRow:2 inSection:0];
    //UITableViewCell* tmpTVC = [self.tableView cellForRowAtIndexPath:ip];
    
    //[tmpTVC 
    
    //[self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:0];
    
    /*
    CourseDetailVewController *detailViewController = [[CourseDetailVewController alloc] initWithNibName:@"CourseDetailViewController" bundle:nil];
    
    UINavigationController* navBar = [[UINavigationController alloc] initWithRootViewController:detailViewController];
    [self.navigationController presentModalViewController:navBar animated:YES];
    */
    
   // [self.navigationController pushViewController: animated:<#(BOOL)#>
    //[self.navigationController pushViewController: theDataObject.clvc animated:YES]; 
    // ...
    // Pass the selected object to the new view controller.
    //[self.navigationController pushViewController:detailViewController animated:YES];
    
    NSLog(@"in select row: %i", rowIndex);
}

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
}

@end
