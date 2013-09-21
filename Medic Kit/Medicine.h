//
//  Medicine.h
//  Medic Kit
//
//  Created by Koen Bex on 21/09/13.
//  Copyright (c) 2013 fousa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Packaging.h"

@interface Medicine : NSObject

@property (strong, nonatomic) NSString* id;
@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* description;
@property (strong, nonatomic) Packaging* package;
@property (strong, nonatomic) NSDate* nextIntake;

@end
