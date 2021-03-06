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
    
    //notifications
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didAddMedicin:) name:kDidAddMedicinNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didFakeDafalgan:) name:kFakeDafalganNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didEnterBackground:) name:kDidEnterBackgroundNotification object:nil];
    
    [self createCrapData];
    
    formatter =  [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"dd/MM/yyyy HH:mm"];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(didPressAdd:)];
}


#pragma mark - Notifications

- (void)didAddMedicin:(NSNotification *)notification {
    [[[UIAlertView alloc] initWithTitle:@"Plan" message:@"Do you want to plan the medicin take in?" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil] show];
}

- (void)didEnterBackground:(NSNotification *)notification {
    [self createCrapData];
    [self.tableView reloadData];
}

- (void)didFakeDafalgan:(NSNotification *)notification {
    
    NSDateFormatter *formatter2 = [[NSDateFormatter alloc]init];
    [formatter2 setDateFormat:@"MM/dd/yyyy HH:mm"];
    NSDate *date = [formatter2 dateFromString:@"9/24/2013 8:15"];
    
    Medicine *med = [Medicine new];
    med.name = @"Dafalgan Forte";
    med.description = @"Painkiller";
    med.nextIntake = date;
    med.price = 25;
    Packaging *package = [Packaging new];
    package.id = [NSNumber numberWithInt:12345];
    package.description = @"Dafalgan tab Forte 50x 1 g";
    package.image = [UIImage imageNamed:@"1.jpg"];
    package.leafletNL = @"http://bijsluiters.fagg-afmps.be/registrationSearchServlet?key=BE259551&leafletType=leafletNL";
    med.package = package;
    
    [medicines addObject:med];
    
    date = [formatter2 dateFromString:@"9/24/2013 17:30"];
    
    Medicine *med2 = [Medicine new];
    med2.name = @"Dafalgan Forte";
    med2.description = @"Painkiller";
    med2.nextIntake = date;
    med2.price = 25;
    package = [Packaging new];
    package.id = [NSNumber numberWithInt:12345];
    package.description = @"Dafalgan tab Forte 30x 2 g";
    package.image = [UIImage imageNamed:@"1.jpg"];
    package.leafletNL = @"http://bijsluiters.fagg-afmps.be/registrationSearchServlet?key=BE259551&leafletType=leafletNL";
    med2.package = package;
    
    [medicines insertObject:med2 atIndex:0];
    
    [self.tableView reloadData];
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

-(void) createCrapData {
    
    medicines = [NSMutableArray new];
    
    NSDateFormatter *formatter2 = [[NSDateFormatter alloc]init];
    [formatter2 setDateFormat:@"MM/dd/yyyy HH:mm a"];
    NSDate *date = [formatter2 dateFromString:@"9/22/2013 7:15 PM"];
    
    Medicine *med = [Medicine new];
    med.name = @"Dafalgan Forte";
    med.description = @"Painkiller";
    med.nextIntake = date;
    med.price = 25;
    Packaging *package = [Packaging new];
    package.id = [NSNumber numberWithInt:12345];
    package.description = @"Dafalgan tab Forte 50x 1 g";
    package.image = [UIImage imageNamed:@"1.jpg"];
    package.leafletNL = @"http://bijsluiters.fagg-afmps.be/registrationSearchServlet?key=BE259551&leafletType=leafletNL";
    med.package = package;
    
//    [medicines addObject:med];
    
    NSDate *date2 = [formatter2 dateFromString:@"9/23/2013 8:00 AM"];
    
    Medicine *med2 = [Medicine new];
    med2.name = @"Orofar Lidocaine 1/1";
    med2.description = @"Painkiller";
    med2.nextIntake = date2;
    med2.price = 10;
    Packaging *package2 = [Packaging new];
    package2.id = [NSNumber numberWithInt:12345];
    package2.description = @"Orofar Lidocaine 1/1 36 pearls Mint";
    package2.image = [UIImage imageNamed:@"2.jpg"];
    package2.leafletNL = @"http://bijsluiters.fagg-afmps.be/registrationSearchServlet?key=BE229214&leafletType=leafletNL";
    med2.package = package2;
    
//    [medicines addObject:med2];
    
    NSDate *date3 = [formatter2 dateFromString:@"9/24/2013 13:30 PM"];
    
    Medicine *med3 = [Medicine new];
    med3.name = @"Sinutab Forte";
    med3.description = @"Painkiller";
    med3.nextIntake = date3;
    med3.price = 15;
    Packaging *package3 = [Packaging new];
    package3.id = [NSNumber numberWithInt:12345];
    package3.description = @"Sinutab Forte 20x tablets 500/60 mg";
    package3.image = [UIImage imageNamed:@"3.jpg"];
    package3.leafletNL = @"http://bijsluiters.fagg-afmps.be/registrationSearchServlet?key=BE240186&leafletType=leafletNL";
    med3.package = package3;
    
    [medicines addObject:med3];
    
    NSDate *date4 = [formatter2 dateFromString:@"9/24/2013 8:30 AM"];
    
    Medicine *med4 = [Medicine new];
    med4.id = @"dummy";
    med4.name = @"Zyrtec 10 mg";
    med4.description = @"Anti-histaminicum";
    med4.nextIntake = date4;
    med4.price = 20;
    Packaging *package4 = [Packaging new];
    package4.id = [NSNumber numberWithInt:869347];
    package4.description = @"Zyrtec 10 mg tablet";
    package4.image = [UIImage imageNamed:@"4.jpg"];
    package4.leafletNL = @"http://bijsluiters.fagg-afmps.be/DownloadLeafletServlet?id=11547";
    med4.package = package4;
    
//    [medicines addObject:med4];
    
    NSDate *date5 = [formatter2 dateFromString:@"9/24/2013 8:30 AM"];
    
    Medicine *med5 = [Medicine new];
    med5.id = @"0869347";
    med5.name = @"Seretide diskus 50/500 mg";
    med5.description = @"Painkiller";
    med5.nextIntake = date5;
    med5.price = 35;
    Packaging *package5 = [Packaging new];
    package5.id = [NSNumber numberWithInt:869347];
    package5.description = @"Seretide diskus 50/500 mg inhalation powder";
    package5.image = [UIImage imageNamed:@"5.jpg"];
    package5.leafletNL = @"http://bijsluiters.fagg-afmps.be/DownloadLeafletServlet?id=4680";
    med5.package = package5;
//    [medicines addObject:med5];

}

@end
