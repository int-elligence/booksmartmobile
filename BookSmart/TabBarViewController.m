//
//  TabBarViewController.m
//  BookSmart
//
//  Created by James Pickering on 12/4/13.
//  Copyright (c) 2013 BookSmart. All rights reserved.
//

#import "TabBarViewController.h"
#import "ProfileViewController.h"

@interface TabBarViewController () <UITabBarControllerDelegate>

@end

@implementation TabBarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    [self.navigationItem setTitle:@"Contracts"];
    
    self.delegate = self;
	
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    NSDictionary *dict = @{@1: @"Profile", @2: @"Offers", @3: @"Advances", @4: @"Contracts", @5: @"More"};
    NSString *classForVC = NSStringFromClass([viewController class]);
    int i;
    BOOL isError = YES;
    for (i = 1; i <= 5; i++) {
        if ([classForVC rangeOfString:[dict objectForKey:[NSNumber numberWithInt:i]]].location != NSNotFound) {
            isError = NO;
            break;
        }
    }
    if (isError) i = 0;
    NSString *newTitle = @"Error";
    switch (i) {
        case 0:
            NSLog(@"Error");
            break;
        case 1:
            newTitle = self.fullname;
            break;
        default:
            newTitle = [dict objectForKey:[NSNumber numberWithInt:i]];
            break;
    }
    [self.navigationItem setTitle:newTitle];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
