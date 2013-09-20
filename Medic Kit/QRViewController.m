//
//  QRViewController.m
//  Medic Kit
//
//  Created by Jelle Vandebeeck on 20/09/13.
//  Copyright (c) 2013 fousa. All rights reserved.
//

#import "QRViewController.h"

@interface QRViewController ()
@end

@implementation QRViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.title = @"Scan the medicin code";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(didPressCancel:)];
}

#pragma mark - Actions

- (IBAction)didPressCancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
