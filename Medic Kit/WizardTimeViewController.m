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

@end

@implementation WizardTimeViewController

- (void)viewWillAppear:(BOOL)animated {
    
    self.title = @"Add plan step 2";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(didPressCancel:)];
}

-(void)viewDidLoad {
    
    _scrollView.contentSize = CGSizeMake(_contentView.frame.size.width, _contentView.frame.size.height);
}

#pragma mark - Actions

- (IBAction)didPressCancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
