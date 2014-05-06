//
//  SomeViewController.h
//  ABHorizontalTableViewProj
//
//  Created by Adithya Bhat on 10/02/12.
//  Copyright (c) 2012 Robosoft Technologies Pvt. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ABHorizontalTableView.h"
#import "CustomCell.h"

@interface SomeViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property (retain, nonatomic) IBOutlet ABHorizontalTableView *ibTableView;
@property (retain, nonatomic) NSMutableArray *source;
@property (retain, nonatomic) IBOutlet CustomCell *ibCustomCell;

@end
