//
//  DetailViewController.m
//  Medic Kit
//
//  Created by Jelle Vandebeeck on 20/09/13.
//  Copyright (c) 2013 fousa. All rights reserved.
//

#import "DetailViewController.h"
#import "LeafletViewController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *medicineImage;
@property (weak, nonatomic) IBOutlet UILabel *medicineLabel;
@property (weak, nonatomic) IBOutlet UILabel *medicineTitle;
@end

@implementation DetailViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.title = _medicine.name;
    _medicineTitle.text = _medicine.name;
    _medicineLabel.text = _medicine.package.description;
    _medicineImage.image = _medicine.package.image;
    
    
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"Leaflet"]) {
        LeafletViewController *destination = [segue destinationViewController];
        destination.url = _medicine.package.leafletNL;
    }
}

@end
