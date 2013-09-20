//
//  ListViewController.m
//  Medic Kit
//
//  Created by Jelle Vandebeeck on 20/09/13.
//  Copyright (c) 2013 fousa. All rights reserved.
//

#import "ListViewController.h"

@interface ListViewController ()

@end

@implementation ListViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.title = @"Medic Kit";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(didPressAdd:)];
}

#pragma mark - Actions

- (IBAction)didPressAdd:(id)sender {
    [self performSegueWithIdentifier:@"Add" sender:nil];
}

#pragma mark - Table

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = @"Dafalgan";
    cell.detailTextLabel.text = @"Volgende inname: 21 sept. 2013 om 12:00";
    
    return cell;
}

@end
