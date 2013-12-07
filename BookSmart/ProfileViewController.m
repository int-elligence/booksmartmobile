//
//  ProfileViewController.m
//  BookSmart
//
//  Created by Elliot Anderson on 12/4/13.
//  Copyright (c) 2013 BookSmart. All rights reserved.
//

#import "ProfileViewController.h"
#import "TabBarViewController.h"
#import "NavigationViewController.h"
#import "Socket.h"

@interface ProfileViewController ()

@property (nonatomic) Socket *sock;

@property (strong, nonatomic) NSMutableArray *artists;
@property (strong, nonatomic) NSMutableArray *uShows;

@end

@implementation ProfileViewController

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
    
    self.sock = [[Socket alloc] init];
    
    self.artists = [[NSMutableArray alloc] initWithArray:@[@"Krewella", @"Porter Robinson", @"Flosstradamus", @"Snoop Dog"]];
    self.uShows = [[NSMutableArray alloc] initWithArray:@[@"Krewella - 5/29, Philadelphia PA", @"Krewella - 5/30, Atlantic City NJ", @"Krewella - 6/1, Boston MA"]];
    // Retrieve fullname from TabBarViewController
    
    /*TabBarViewController *tabBar = (TabBarViewController *)self.tabBarController;
    [self setTitle:tabBar.fullname];
    [self.navigationController setTitle:tabBar.fullname];*/
    
    // Set title of view to fullname
    
    //[self.tabBarController.navigationItem setTitle:tabBar.fullname];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    // Returning the header for each setion
    
    NSString *title = [[NSString alloc] init];
    if (section == 0) {
        
        // active Offers section
        
        title = @"Artists";
    }
    else {
        
        // accepted Offers section
        
        title = @"Shows";
    }
    return title;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger rows;
    if (section == 0) {
        rows = [self.artists count];
    }
    else {
        rows = [self.uShows count];
    }
    return rows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *tableID = @"ReuseCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:tableID];
        if (indexPath.section == 0) {
            
            cell.textLabel.text = [self.artists objectAtIndex:indexPath.row];
        }
        else {
            
            cell.textLabel.text = [self.uShows objectAtIndex:indexPath.row];
        }
    }
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

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
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

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
