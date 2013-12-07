//
//  OffersViewController.m
//  BookSmart
//
//  Created by Elliot Anderson on 12/4/13.
//  Copyright (c) 2013 BookSmart. All rights reserved.
//

#import "OffersViewController.h"

@interface OffersViewController ()

// @properties for active offers

@property (strong, nonatomic) NSMutableArray *activeOffers;
@property (strong, nonatomic) NSMutableArray *activeOffersDescription;
@property (strong, nonatomic) NSMutableArray *activeImages;

// @properties for accepted offers

@property (strong, nonatomic) NSMutableArray *acceptedOffers;
@property (strong, nonatomic) NSMutableArray *acceptedOffersDescription;
@property (strong, nonatomic) NSMutableArray *acceptedImages;

@property (nonatomic) Socket *socketObj;

@end

@implementation OffersViewController

@synthesize socketObj;

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
    
    socketObj = [[Socket alloc] init];
    
    socketObj.delegate = self;
    
    // Set up active Offers
    
    self.activeOffers = [[NSMutableArray alloc] initWithArray:@[@"Krewella"]];
    self.activeOffersDescription = [[NSMutableArray alloc] initWithArray:@[@"Philadelphia, PA 6/7/13"]];
    self.activeImages = [[NSMutableArray alloc] initWithArray:@[@"Krewella.png"]];
    
    // Set up accepted Offers
    
    self.acceptedOffers = [[NSMutableArray alloc] initWithArray:@[@"Krewella", @"Porter Robinson", @"Krewella", @"Snoop Dog"]];
    self.acceptedOffersDescription = [[NSMutableArray alloc] initWithArray:@[@"Boulder, CO 6/5/13", @"State College, PA 6/6/13", @"Pittsburg, PA 6/9/13", @"San Fransisco, PA 6/9/13"]];
    self.activeImages = [[NSMutableArray alloc] initWithArray:@[@"Snoop.png"]];

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

- (void)recievedDataFromServer:(NSString *)data withProtocol:(int)protocol
{
    switch (protocol) {
        case 0:
            NSLog(@"Error");
            break;
        case 1:
            break;
            
        default:
            break;
    }
}

#pragma mark - Table view data source

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    // Returning the header for each setion
    
    NSString *title = [[NSString alloc] init];
    if (section == 0) {
        
        // active Offers section
        
        title = @"Active Offers";
    }
    else {
        
        // accepted Offers section
        
        title = @"Accepted Offers";
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
    // Returning number of rows in each section
    
    NSInteger numberOfRows;
    if (section == 0) {
        
        // active Offers section
        
        numberOfRows = [self.activeOffers count];
    }
    else {
        
        // accepted Offers section
        
        numberOfRows = [self.acceptedOffers count];
    }
    return numberOfRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Returning the cells
    
    static NSString *tableID = @"ReuseCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:tableID];
        if (indexPath.section == 0) {
            
            // active Offers section
            
            cell.textLabel.text = [self.activeOffers objectAtIndex:indexPath.row];
            cell.detailTextLabel.text = [self.activeOffersDescription objectAtIndex:indexPath.row];
            //cell.imageView.image = [UIImage imageNamed:@"Krewella.png"];
        }
        else {
            
            // accepted Offers section
            
            cell.textLabel.text = [self.acceptedOffers objectAtIndex:indexPath.row];
            cell.detailTextLabel.text = [self.acceptedOffersDescription objectAtIndex:indexPath.row];
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
