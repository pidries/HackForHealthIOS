//
//  WizardPeriodViewController.m
//  Medic Kit
//
//  Created by Jelle Vandebeeck on 20/09/13.
//  Copyright (c) 2013 fousa. All rights reserved.
//

#import "WizardPeriodViewController.h"

@interface WizardPeriodViewController () {
    
    int amountMorning;
    int amountNoon;
    int amountAfternoon;
    int amountEvening;
    
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
    
    self.title = @"Add plan step 1";

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(didPressCancel:)];
}

-(void) reloadLabels {
    morningLabel.text = [NSString stringWithFormat:@"%d", amountMorning];
    noonLabel.text = [NSString stringWithFormat:@"%d", amountNoon];
    afternoonLabel.text = [NSString stringWithFormat:@"%d", amountAfternoon];
    eveningLabel.text = [NSString stringWithFormat:@"%d", amountEvening];
}

#pragma mark - Actions

- (IBAction)didPressCancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)morningStep:(UIStepper*)sender {
    amountMorning = [sender value];
    [self reloadLabels];
}
- (IBAction)noonStep:(UIStepper*)sender {
    amountNoon = [sender value];
    [self reloadLabels];
}
- (IBAction)afternoonStep:(UIStepper*)sender {
    amountAfternoon = [sender value];
    [self reloadLabels];
}
- (IBAction)eveningStep:(UIStepper*)sender {
    amountEvening =  [sender value];
    [self reloadLabels];
}

@end
