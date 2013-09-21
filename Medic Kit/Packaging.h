//
//  Packaging.h
//  Medic Kit
//
//  Created by Koen Bex on 21/09/13.
//  Copyright (c) 2013 fousa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Packaging : NSObject

@property (strong, nonatomic) NSNumber* id;
@property (strong, nonatomic) NSNumber* amount;
@property (strong, nonatomic) NSNumber* price;
@property (strong, nonatomic) UIImage* image;

@property (strong, nonatomic) NSString* description;
@property (strong, nonatomic) NSString* galenicForm;
@property (strong, nonatomic) NSString* leafletNL;

@end
