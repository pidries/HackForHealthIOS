//
//  ListViewController.m
//  Medic Kit
//
//  Created by Jelle Vandebeeck on 20/09/13.
//  Copyright (c) 2013 fousa. All rights reserved.
//

#import "ListViewController.h"
#import "Medicine.h"

@interface ListViewController () <UIAlertViewDelegate>

@property NSArray* medicines;

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didAddMedicin:) name:kDidAddMedicinNotification object:nil];
    
    Medicine *med = [Medicine new];
    med.name = @"Dafalgan";
    med.description = @"Painkiller";
    Packaging *package = [Packaging new];
    package.id = [NSNumber numberWithInt:12345];
    package.description = @"Dafalgan tab Forte 50x 1 g";
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.title = @"Medic Kit";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(didPressAdd:)];
}

#pragma mark - Notifications

- (void)didAddMedicin:(NSNotification *)notification {
    [[[UIAlertView alloc] initWithTitle:@"Plan" message:@"Do you want to plan the medicin take in?" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil] show];
}

#pragma mark - Notifications

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) {
        [self performSegueWithIdentifier:@"Plan" sender:nil];
    }
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
