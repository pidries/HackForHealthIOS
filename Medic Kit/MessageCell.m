//
//  MessageCell.m
//  Medic Kit
//
//  Created by Jelle Vandebeeck on 22/09/13.
//  Copyright (c) 2013 fousa. All rights reserved.
//

#import "MessageCell.h"

#import "Message.h"

@implementation MessageCell

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (!(self = [super initWithCoder:aDecoder])) return nil;
    
    self.textLabel.font = [UIFont systemFontOfSize:16];
    self.detailTextLabel.font = [UIFont systemFontOfSize:10];
    
    self.separatorInset = UIEdgeInsetsMake(0, 15, 0, 0);
    
    return self;
}

- (void)layoutSubviews {
    if (_read) {
        self.textLabel.font = [UIFont systemFontOfSize:16];
        self.imageView.image = [UIImage imageNamed:@"none.png"];
    } else {
        self.textLabel.font = [UIFont boldSystemFontOfSize:16];
        self.imageView.image = [UIImage imageNamed:@"UIUnreadIndicator.png"];
    }
    
    [super layoutSubviews];
    
    self.textLabel.frame = (CGRect) { 23, self.textLabel.frame.origin.y, 210, self.textLabel.frame.size.height };
    self.detailTextLabel.frame = (CGRect) { 230, 17, 60, self.detailTextLabel.frame.size.height };
    self.imageView.frame = (CGRect) { 5, self.imageView.frame.origin.y, self.imageView.frame.size };
}

@end
