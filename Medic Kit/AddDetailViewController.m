//
//  AddDetailViewController.m
//  Medic Kit
//
//  Created by Jelle Vandebeeck on 20/09/13.
//  Copyright (c) 2013 fousa. All rights reserved.
//

#import "AddDetailViewController.h"

@interface AddDetailViewController () {
    __weak IBOutlet UILabel *_titleLabel;
    __weak IBOutlet UILabel *_descriptionLabel;
}
@end

@implementation AddDetailViewController

- (void)viewWillAppear:(BOOL)animated {
    
    self.title = _medicine.name;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(didPressCancel:)];
}

#pragma mark - Actions

- (IBAction)didPressAdd:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        [[NSNotificationCenter defaultCenter] postNotificationName:kDidAddMedicinNotification object:nil];
    }];
}

- (IBAction)didPressCancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
