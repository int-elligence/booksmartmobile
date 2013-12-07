//
//  AdvancesViewController.m
//  BookSmart
//
//  Created by Elliot Anderson on 12/4/13.
//  Copyright (c) 2013 BookSmart. All rights reserved.
//

#import "AdvancesViewController.h"
#import "AdvancesTabViewController.h"

@interface AdvancesViewController ()

// @properties for complete advances

@property (strong, nonatomic) NSMutableArray *completeAdvances;
@property (strong, nonatomic) NSMutableArray *completeAdvancesDescription;
@property (strong, nonatomic) NSMutableArray *completeImages;

// @properties for incomplete advances

@property (strong, nonatomic) NSMutableArray *incompleteAdvances;
@property (strong, nonatomic) NSMutableArray *incompleteAdvancesDescription;
@property (strong, nonatomic) NSMutableArray *incompleteImages;
@property (strong, nonatomic) NSString *cellT;

// Socket Object

@property (nonatomic) Socket *socketObj;

- (void)sendMessage:(NSString *)message;

@end

@implementation AdvancesViewController

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
    
    // Set up socket delegate
    
    socketObj = [[Socket alloc] init];
    
    socketObj.delegate = self;
    
    // Set up complete advances
    
    self.completeAdvances = [[NSMutableArray alloc] initWithArray:@[@"Krewella"]];
    self.completeAdvancesDescription = [[NSMutableArray alloc] initWithArray:@[@"Boulder, CO 5/29/13"]];
    self.completeImages = [[NSMutableArray alloc] initWithArray:@[@"Krewella.png"]];
    
    // Set up incomplete advances
    
    self.incompleteAdvances = [[NSMutableArray alloc] initWithArray:@[@"Snoop Dog"]];
    self.incompleteAdvancesDescription = [[NSMutableArray alloc] initWithArray:@[@"Orlando, FL 5/10/13"]];
    self.completeImages = [[NSMutableArray alloc] initWithArray:@[@"Snoop.png"]];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)sendMessage:(NSString *)message
{
    [socketObj sendRequest:message];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Returning two sections.
    
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Returning number of rows in each section
    
    NSInteger numberOfRows;
    if (section == 0) {
        
        // Complete advances section
        
        numberOfRows = [self.completeAdvances count];
    }
    else {
        
        // Incomplete advances section
        
        numberOfRows = [self.incompleteAdvances count];
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
            
            // Complete advances section
            
            cell.textLabel.text = [self.completeAdvances objectAtIndex:indexPath.row];
            cell.detailTextLabel.text = [self.completeAdvancesDescription objectAtIndex:indexPath.row];
            //cell.imageView.image = [UIImage imageNamed:@"Krewella.png"];
        }
        else {
            
            // Incomplete advances section
            
            cell.textLabel.text = [self.incompleteAdvances objectAtIndex:indexPath.row];
            cell.detailTextLabel.text = [self.incompleteAdvancesDescription objectAtIndex:indexPath.row];
        }
    }
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    // Returning the header for each setion
    
    NSString *title = [[NSString alloc] init];
    if (section == 0) {
        
        // Complete advances section
        
        title = @"Complete Advances";
    }
    else {
        
        // Incomplete advances section
        
        title = @"Incomplete Advances";
    }
    return title;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
    self.cellT = selectedCell.textLabel.text;
    NSLog(@"New Title: %@", selectedCell.textLabel.text);
    [self performSegueWithIdentifier:@"advdet" sender:self];
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


// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Navigation
 
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    AdvancesTabViewController *vc = [segue destinationViewController];
    [vc setHeader:self.cellT];
}

- (void)recievedDataFromServer:(NSString *)data withProtocol:(int)protocol{
    NSLog(@"Data: %@", data);
    NSLog(@"Protocol: %d", protocol);
}


@end
