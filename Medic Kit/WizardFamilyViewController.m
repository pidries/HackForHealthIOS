//
//  WizardFamilyViewController.m
//  Medic Kit
//
//  Created by Jelle Vandebeeck on 20/09/13.
//  Copyright (c) 2013 fousa. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "WizardFamilyViewController.h"

@interface WizardFamilyViewController () {
}
@end

@implementation WizardFamilyViewController

- (void)viewWillAppear:(BOOL)animated {
    
    self.title = _medicine.name;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(didPressCancel:)];
}

#pragma mark - Actions

- (IBAction)didPressCancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Table

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"Rachel Brown";
            cell.imageView.image = [UIImage imageNamed:@"rachel.png"];
            break;
        case 1:
            cell.textLabel.text = @"Monica Geller";
            cell.imageView.image = [UIImage imageNamed:@"monica.png"];
            break;
        case 2:
            cell.textLabel.text = @"Ross Geller";
            cell.imageView.image = [UIImage imageNamed:@"ross.png"];
            break;
        case 3:
            cell.textLabel.text = @"Chandler Bing";
            cell.imageView.image = [UIImage imageNamed:@"chandler.png"];
            break;
        default:
            break;
    }
    cell.imageView.layer.masksToBounds = YES;
    cell.imageView.layer.cornerRadius = 22.5;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
