//
//  MessagesViewController.m
//  Medic Kit
//
//  Created by Pieter-Jan Dries on 21/09/13.
//  Copyright (c) 2013 fousa. All rights reserved.
//

#import "Message.h"
#import "MessagesViewController.h"
#import "MessageDetailViewController.h"
#import "MessageCell.h"

@interface MessagesViewController () {
    NSMutableArray* messages;
    NSDateFormatter* outputFormatter;
}

@end

@implementation MessagesViewController

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

    messages = [NSMutableArray new];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"MM/dd/yyyy HH:mm a"];
    NSDate *date = [formatter dateFromString:@"9/22/2013 8:15 PM"];
    
    Message *message = [Message new];
    message.title = @"Hay fever warning.";
    message.message = @"The hay fever season is starting. We noticed that your Zyrtec medication is going to expire. Please check your stock.";
    message.receivedDate = date;
    message.isRead = false;
    
    [messages addObject:message];
    
    NSDate *date1 = [formatter dateFromString:@"9/22/2013 7:15 PM"];
    
    Message *message1 = [Message new];
    message1.title = @"Savings - Generic Medicins.";
    message1.message = @"We noticed that you are using product X. You can buy generic product Y which saves you 15,50 €.";
    message1.receivedDate = date1;
    message1.isRead = false;
    
    [messages addObject:message1];
    
    NSDate *date2 = [formatter dateFromString:@"9/21/2013 9:15 AM"];
    Message *message2 = [Message new];
    message2.title = @"Dafalgan running low.";
    message2.message = @"We noticed that you are running low on dafalgan. Don't forget to add it to your shopping list.";
    message2.receivedDate = date2;
    message2.isRead = true;
    
    [messages addObject:message2];
    
    outputFormatter = [[NSDateFormatter alloc]init];
    [outputFormatter setDateFormat:@"dd/MM/yyyy "];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"Detail"]) {
        MessageDetailViewController *destination = [segue destinationViewController];
        destination.message = [messages objectAtIndex:self.tableView.indexPathForSelectedRow.row];
        destination.message.isRead = YES;
    }
}


#pragma mark - Table

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [messages count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    MessageCell *cell = (MessageCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    Message *med = [messages objectAtIndex:indexPath.row];
    
    cell.textLabel.text = med.title;
    cell.detailTextLabel.text = [outputFormatter stringFromDate:med.receivedDate];
    cell.read = med.isRead;
    
    return cell;
}

@end
