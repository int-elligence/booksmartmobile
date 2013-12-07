//
//  ContractsViewController.h
//  BookSmart
//
//  Created by Elliot Anderson on 12/4/13.
//  Copyright (c) 2013 BookSmart. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Socket.h"

@interface ContractsViewController : UIViewController

@property (nonatomic) Socket *sock;
@property (strong, nonatomic) NSString *username;

@end
