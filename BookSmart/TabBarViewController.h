//
//  TabBarViewController.h
//  BookSmart
//
//  Created by James Pickering on 12/4/13.
//  Copyright (c) 2013 BookSmart. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Socket.h"

@interface TabBarViewController : UITabBarController

@property (strong, nonatomic) NSString *username;
@property (strong, nonatomic) NSString *password;
@property (strong, nonatomic) NSString *fullname;

@end
