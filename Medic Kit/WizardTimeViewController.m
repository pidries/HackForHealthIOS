//
//  WizardTimeViewController.m
//  Medic Kit
//
//  Created by Jelle Vandebeeck on 20/09/13.
//  Copyright (c) 2013 fousa. All rights reserved.
//

#import "WizardTimeViewController.h"

@interface WizardTimeViewController ()

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UIView *contentView;

@property (weak, nonatomic) IBOutlet UISwitch *sliderTillEmpty;

@end

@implementation WizardTimeViewController

- (void)viewWillAppear:(BOOL)animated {
    
    self.title = _medicine.name;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(didPressCancel:)];
}

-(void)viewDidLoad {
    
    _scrollView.contentSize = CGSizeMake(_contentView.frame.size.width, _contentView.frame.size.height);
    CGFloat topOffset = self.navigationController.navigationBar.frame.size.height + [[UIApplication sharedApplication] statusBarFrame].size.height;
    _scrollView.contentInset = UIEdgeInsetsMake(-topOffset, 0.0, 0.0, 0.0);
}

#pragma mark - Actions

- (IBAction)didPressCancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)didPressNext:(id)sender {
    if (!_sliderTillEmpty.isOn)
        [self performSegueWithIdentifier:@"toEndDate" sender:sender];
    else
        [self performSegueWithIdentifier:@"toFamily" sender:sender];
}

@end
