//
//  WizardPeriodViewController.m
//  Medic Kit
//
//  Created by Jelle Vandebeeck on 20/09/13.
//  Copyright (c) 2013 fousa. All rights reserved.
//

#import "WizardPeriodViewController.h"

@interface WizardPeriodViewController ()
@end

@implementation WizardPeriodViewController

- (void)viewWillAppear:(BOOL)animated {
    
    self.title = @"Add plan step 1";

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(didPressCancel:)];
}

#pragma mark - Actions

- (IBAction)didPressCancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
