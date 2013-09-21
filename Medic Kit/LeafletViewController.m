//
//  LeafletViewController.m
//  Medic Kit
//
//  Created by Pieter-Jan Dries on 21/09/13.
//  Copyright (c) 2013 fousa. All rights reserved.
//

#import "LeafletViewController.h"

@interface LeafletViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webview;

@end

@implementation LeafletViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _webview.scalesPageToFit =  YES;
    NSURL *url = [NSURL URLWithString:_url];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [_webview loadRequest:requestObj];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
