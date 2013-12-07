//
//  AdvanceDetailsViewController.m
//  BookSmart
//
//  Created by James Pickering on 12/5/13.
//  Copyright (c) 2013 BookSmart. All rights reserved.
//

#import "AdvancesFlightsViewController.h"

@interface AdvancesFlightsViewController ()

@property (strong, nonatomic) NSMutableArray *incomingFlights;
@property (strong, nonatomic) NSMutableArray *outgoingFlights;

@end

@implementation AdvancesFlightsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationItem setTitle:self.header];
    self.incomingFlights = [[NSMutableArray alloc] initWithArray:@[@"Flight Number 1", @"Flight Number 2"]];
    self.outgoingFlights = [[NSMutableArray alloc] initWithArray:@[@"Flight Number 1", @"Flight Number 2", @"Flight number 3", @"Flight Number 4"]];
	// Do any additional setup after loading the view.
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
        
        numberOfRows = [self.incomingFlights count];
    }
    else {
        
        // Incomplete advances section
        
        numberOfRows = [self.outgoingFlights count];
    }
    NSLog(@"Rows: %ld", (long)numberOfRows);
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
            
            cell.textLabel.text = [self.incomingFlights objectAtIndex:indexPath.row];
        }
        else {
            
            // Incomplete advances section
            
            cell.textLabel.text = [self.outgoingFlights objectAtIndex:indexPath.row];
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
        
        title = @"Incoming";
    }
    else {
        
        // Incomplete advances section
        
        title = @"Outgoing";
    }
    return title;
}


@end
