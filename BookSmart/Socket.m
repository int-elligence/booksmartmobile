//
//  Socket.m
//  Chat
//
//  Created by James Pickering on 10/3/13.
//  Copyright (c) 2013 James Pickering. All rights reserved.
//

#import "Socket.h"

#define ACCESS_GRANTED 0
#define ACCESS_DENIED 1
#define PEOPLE 2
#define MESSAGE 3

@interface Socket ()

@property (nonatomic, retain) NSURLConnection *connection;
@property (nonatomic, retain) NSMutableArray *connectionData;
@property (nonatomic, strong) NSDictionary *protocol;

@end

@implementation Socket

- (id)init{
    self = [super init];
    if (self) {
        self.connectionData = [[NSMutableArray alloc] init];
        self.protocol = @{@1 : @"GRANTED", @2 : @"DENIED"};
    }
    return self;
}

- (void)sendRequest:(NSString *)message {
    NSLog(@"Connection");
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]
                                    initWithURL:[NSURL
                                                 URLWithString:@"http://69.137.137.204/booksmart/dummy.php"]];
    
    [request setHTTPMethod:@"POST"];
    [request setValue:@"text/xml"
   forHTTPHeaderField:@"Content-type"];
    
    NSString *xmlString = message;
    
    [request setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[xmlString length]] forHTTPHeaderField:@"Content-length"];
    
    [request setHTTPBody:[xmlString dataUsingEncoding:NSUTF8StringEncoding]];
    
    self.connection = [[NSURLConnection alloc]
                       initWithRequest:request
                       delegate:self];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)d{
    NSString *dstr = [[NSString alloc] initWithData:d encoding:NSUTF8StringEncoding];
    int i;
    BOOL isError = YES;
    NSLog(@"Prot: %@", [self.protocol objectForKey:[NSNumber numberWithInt:1]]);
    for (i = 1; i <= [self.protocol count]; i++) {
        if ([dstr rangeOfString:[self.protocol objectForKey:[NSNumber numberWithInt:i]]].location != NSNotFound) {
            isError = NO;
            break;
        }
    }
    if (isError) i = 0;
    [self.delegate recievedDataFromServer:[[NSString alloc] initWithData:d encoding:NSUTF8StringEncoding] withProtocol:i];
}

@end
