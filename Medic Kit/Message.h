//
//  Message.h
//  Medic Kit
//
//  Created by Pieter-Jan Dries on 21/09/13.
//  Copyright (c) 2013 fousa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Message : NSObject

@property (strong, nonatomic) NSString* title;
@property (strong, nonatomic) NSString* message;
@property (assign, nonatomic) Boolean isRead;
@property (strong, nonatomic) NSDate* receivedDate;

@end
