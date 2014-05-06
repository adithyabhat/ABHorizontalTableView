//
//  CustomCell.m
//  ABHorizontalTableViewProj
//
//  Created by Adithya Bhat on 10/02/12.
//  Copyright (c) 2012 Robosoft Technologies Pvt. Ltd. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell
@synthesize ibImageVew;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {
    [ibImageVew release];
    [super dealloc];
}
@end
