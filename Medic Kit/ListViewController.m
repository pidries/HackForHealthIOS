//
//  ListViewController.m
//  Medic Kit
//
//  Created by Jelle Vandebeeck on 20/09/13.
//  Copyright (c) 2013 fousa. All rights reserved.
//

#import "ListViewController.h"
#import "QRViewController.h"
#import "Medicine.h"
#import "DetailViewController.h"
#import "WizardPeriodViewController.h"

@interface ListViewController () <UIAlertViewDelegate> {
    NSMutableArray* medicines;
    NSDateFormatter *formatter;
}

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didAddMedicin:) name:kDidAddMedicinNotification object:nil];
    
    medicines = [NSMutableArray new];
    
    NSDateFormatter *formatter2 = [[NSDateFormatter alloc]init];
    [formatter2 setDateFormat:@"MM/dd/yyyy HH:mm a"];
    NSDate *date = [formatter2 dateFromString:@"9/22/2013 7:15 PM"];
    
    Medicine *med = [Medicine new];
    med.name = @"Dafalgan";
    med.description = @"Painkiller";
    med.nextIntake = date;
    Packaging *package = [Packaging new];
    package.id = [NSNumber numberWithInt:12345];
    package.description = @"Dafalgan tab Forte 50x 1 g";
    package.image = [UIImage imageNamed:@"1.jpg"];
    med.package = package;
    
    [medicines addObject:med];
    
    NSDate *date2 = [formatter2 dateFromString:@"9/23/2013 8:00 AM"];
    
    Medicine *med2 = [Medicine new];
    med2.name = @"Perdolan";
    med2.description = @"Painkiller";
    med2.nextIntake = date2;
    Packaging *package2 = [Packaging new];
    package2.id = [NSNumber numberWithInt:12345];
    package2.description = @"PERDOLAN Compositum: 30 tablets";
    package2.image = [UIImage imageNamed:@"2.jpg"];
    med2.package = package2;
    
    [medicines addObject:med2];
    
    NSDate *date3 = [formatter2 dateFromString:@"9/23/2013 8:30 AM"];
    
    Medicine *med3 = [Medicine new];
    med3.name = @"Sinutab";
    med3.description = @"Painkiller";
    med3.nextIntake = date3;
    Packaging *package3 = [Packaging new];
    package3.id = [NSNumber numberWithInt:12345];
    package3.description = @"Sinutab Forte 20x tablets 500/60 mg";
    UIImageView *myImageView = [[UIImageView alloc] init];
    package3.image = [UIImage imageNamed:@"3.jpg"];
    med3.package = package3;
    
    [medicines addObject:med3];
    
    formatter =  [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"dd/MM/yyyy HH:mm"];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.title = @"Medicine cabinet";
    
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

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"Detail"]) {
        DetailViewController *destination = [segue destinationViewController];
        destination.medicine = [medicines objectAtIndex:self.tableView.indexPathForSelectedRow.row];
    }
    else if ([segue.identifier isEqualToString:@"Add"]) {
        UINavigationController *destination = [segue destinationViewController];
        QRViewController *child = destination.childViewControllers[0];
        child.medicines = medicines;
    }
    else if ([segue.identifier isEqualToString:@"Plan"]) {
        UINavigationController *destination = [segue destinationViewController];
        WizardPeriodViewController *child = destination.childViewControllers[0];
        child.medicine = medicines.lastObject;
    }
}

#pragma mark - Table

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [medicines count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    Medicine *med = [medicines objectAtIndex:indexPath.row];
    
    cell.textLabel.text = med.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@%@", @"Next intake: ", [formatter stringFromDate:med.nextIntake]];
    
    return cell;
}

@end
