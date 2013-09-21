//
//  WizardPeriodViewController.m
//  Medic Kit
//
//  Created by Jelle Vandebeeck on 20/09/13.
//  Copyright (c) 2013 fousa. All rights reserved.
//

#import "WizardPeriodViewController.h"

@interface WizardPeriodViewController () {
    
    NSNumber *amountMorning;
    NSNumber *amountNoon;
    NSNumber *amountAfternoon;
    NSNumber *amountEvening;
    
    __weak IBOutlet UILabel *morningLabel;
    __weak IBOutlet UILabel *noonLabel;
    __weak IBOutlet UILabel *afternoonLabel;
    __weak IBOutlet UILabel *eveningLabel;
}

@end

@implementation WizardPeriodViewController

#pragma mark - load

-(void)viewDidLoad {
    amountMorning = 0;
    amountNoon = 0;
    amountAfternoon = 0;
    amountEvening = 0;
}

- (void)viewWillAppear:(BOOL)animated {
    
    self.title = _medicine.name;

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(didPressCancel:)];
}

-(void) reloadLabels {
    morningLabel.text = [NSString stringWithFormat:@"%@", amountMorning];
    noonLabel.text = [NSString stringWithFormat:@"%@", amountNoon];
    afternoonLabel.text = [NSString stringWithFormat:@"%@", amountAfternoon];
    eveningLabel.text = [NSString stringWithFormat:@"%@", amountEvening];
}

#pragma mark - Actions

- (IBAction)didPressCancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)morningStep:(UIStepper*)sender {
    amountMorning = [NSNumber numberWithDouble:[sender value]];
    [self reloadLabels];
}
- (IBAction)noonStep:(UIStepper*)sender {
    amountNoon = [NSNumber numberWithDouble:[sender value]];
    [self reloadLabels];
}
- (IBAction)afternoonStep:(UIStepper*)sender {
    amountAfternoon = [NSNumber numberWithDouble:[sender value]];
    [self reloadLabels];
}
- (IBAction)eveningStep:(UIStepper*)sender {
    amountEvening =  [NSNumber numberWithDouble:[sender value]];
    [self reloadLabels];
}

@end
