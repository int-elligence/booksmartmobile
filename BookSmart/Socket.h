//
//  Socket.h
//  Chat
//
//  Created by James Pickering on 10/3/13.
//  Copyright (c) 2013 James Pickering. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SocketDelegate <NSObject>

- (void)recievedDataFromServer:(NSString *)data withProtocol:(int)protocol;

@end

@interface Socket : NSObject <NSStreamDelegate>

- (void)sendRequest:(NSString *)message;

@property (weak) id<SocketDelegate> delegate;

@end
