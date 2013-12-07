//
//  LoginViewController.m
//  BookSmart
//
//  Created by James Pickering on 12/4/13.
//  Copyright (c) 2013 BookSmart. All rights reserved.
//

#import "LoginViewController.h"
#import "ContractsViewController.h"
#import "TabBarViewController.h"

@interface LoginViewController ()

- (IBAction)login:(id)sender;

@property (nonatomic) Socket *sock;

@property (strong, nonatomic) IBOutlet UITextField *usernameField;
@property (strong, nonatomic) IBOutlet UITextField *passwordField;

@property (strong, nonatomic) NSString *loginData;

@end

@implementation LoginViewController

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
	self.sock = [[Socket alloc] init];
    
    self.sock.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)login:(id)sender
{
    //[self.sock sendRequest:[NSString stringWithFormat:@"LOGIN:%@:%@", self.usernameField.text, self.passwordField.text]];
    [self.sock sendRequest:@"GRANTED:jamespickering:nsr10ojif:"];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"loginSuccessful"]) {
        NSArray *loginDataArr = [[NSArray alloc] init];
        loginDataArr = [self.loginData componentsSeparatedByString:@":"];
        TabBarViewController *tabBarController = [segue destinationViewController];
        [tabBarController setFullname:[loginDataArr objectAtIndex:3]];
    }
}

- (void)recievedDataFromServer:(NSString *)data withProtocol:(int)protocol
{
    switch (protocol) {
        case 0:
            NSLog(@"Error");
            break;
        case 1:
            
            // Should be in the form:
            // GRANTED:[USERNAME]:[PASSWORD]:[FULLNAME]
            self.loginData = data;
            [self performSegueWithIdentifier:@"loginSuccessful" sender:self];
            break;
        case 2:
            NSLog(@"Access Denied");
            break;
            
        default:
            NSLog(@"Other");
            break;
    }
}

@end
