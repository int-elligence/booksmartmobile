//
//  AdvancesDetailTabViewController.m
//  BookSmart
//
//  Created by James Pickering on 12/6/13.
//  Copyright (c) 2013 BookSmart. All rights reserved.
//

#import "AdvancesTabViewController.h"

@interface AdvancesTabViewController ()

@property (strong, nonatomic) NSString *combinedTitle;

@end

@implementation AdvancesTabViewController

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
    self.delegate = self;
	[self.navigationItem setTitle:[self.header stringByAppendingString:@" - Details"]];
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    NSDictionary *dict = @{@1: @"Flights", @2: @"Details"};
    NSString *classForVC = NSStringFromClass([viewController class]);
    int i;
    BOOL isError = YES;
    for (i = 1; i <= 2; i++) {
        if ([classForVC rangeOfString:[dict objectForKey:[NSNumber numberWithInt:i]]].location != NSNotFound) {
            isError = NO;
            break;
        }
    }
    if (isError) i = 0;
    self.combinedTitle = @"Header";
    switch (i) {
        case 0:
            NSLog(@"Error");
            break;
        case 1:
            self.combinedTitle = [self.header stringByAppendingString:@" - Flights"];
            break;
        case 2:
            self.combinedTitle = [self.header stringByAppendingString:@" - Details"];
            break;
    }
    [self.navigationItem setTitle:self.combinedTitle];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
