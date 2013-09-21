//
//  RemoteClient.m
//  Medic Kit
//
//  Created by Koen Bex on 21/09/13.
//  Copyright (c) 2013 fousa. All rights reserved.
//

#import "RemoteClient.h"

@implementation RemoteClient

+(RemoteClient *) sharedInstance {
    
    static dispatch_once_t once;
    static RemoteClient *_sharedInstance;
    dispatch_once(&once, ^{
        _sharedInstance = [[self alloc] initWithBaseURL:[NSURL URLWithString:@"url"]];
        [_sharedInstance setDefaultHeader:@"Accept" value:@"application/json; version=1.0;"];
        [_sharedInstance setDefaultHeader:@"Content-Type" value:@"application/json"];
        _sharedInstance.parameterEncoding = AFJSONParameterEncoding;
    });
    return _sharedInstance;
    
    return nil;
}

@end
