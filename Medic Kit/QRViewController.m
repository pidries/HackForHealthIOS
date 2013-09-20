//
//  QRViewController.m
//  Medic Kit
//
//  Created by Jelle Vandebeeck on 20/09/13.
//  Copyright (c) 2013 fousa. All rights reserved.
//

#import "QRViewController.h"
#import "AddDetailViewController.h"

#import "ZBarCameraSimulator.h"
#import "ZBarReaderView.h"
#import "ZBarSymbol.h"

@interface QRViewController () <ZBarReaderViewDelegate> {
    __weak IBOutlet UIView *_readerContainerView;
}
@end

@implementation QRViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    medickit.readerView.frame = _readerContainerView.bounds;
    [_readerContainerView addSubview:medickit.readerView];
    
#ifdef DEBUG
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapQRReaderView:)];
    [medickit.readerView addGestureRecognizer:gesture];
#endif
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.title = @"Scan code";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(didPressCancel:)];
    
    medickit.readerView.readerDelegate = self;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    medickit.readerView.readerDelegate = nil;
}

#pragma mark - Actions

- (IBAction)didPressCancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Gestures

- (void)didTapQRReaderView:(UIGestureRecognizer *)gesture {
    [self performSegueWithIdentifier:@"Detail" sender:@"123"];
}

#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"Detail"]) {
        ((AddDetailViewController *)segue.destinationViewController).number = sender;
    }
}

#pragma mark - Reader

- (void)readerView:(ZBarReaderView *)readerView didReadSymbols:(ZBarSymbolSet *)symbols fromImage:(UIImage *)image {
    for (ZBarSymbol *symbol in symbols) {
        if (symbol.type == ZBAR_QRCODE) {
            [self performSegueWithIdentifier:@"Detail" sender:symbol.data];
        }
        break;
    }
}

@end
