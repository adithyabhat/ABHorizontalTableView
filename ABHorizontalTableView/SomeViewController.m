//
//  SomeViewController.m
//  ABHorizontalTableViewProj
//
//  Created by Adithya Bhat on 10/02/12.
//

#import "SomeViewController.h"

@implementation SomeViewController
@synthesize ibTableView;
@synthesize source;
@synthesize ibCustomCell;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.ibTableView.tableViewController = self;
    
    //Source load
    self.source = [[[NSMutableArray alloc] init] autorelease];
    for(int index=0;index<5;index++)
    {
        [self.source addObject:[UIImage imageNamed:[NSString stringWithFormat:@"%d_small.jpg",index+1]]];
    }
}


-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
}

- (void)viewDidUnload
{
    [self setIbTableView:nil];
    [self setIbCustomCell:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)dealloc {
    [source release];
    [ibTableView release];
    [ibCustomCell release];
    [super dealloc];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 29.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CustomCell";
    
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        [[NSBundle mainBundle] loadNibNamed:@"CustomCell" owner:self options:nil];
        cell = self.ibCustomCell;
    }
    
    int index = indexPath.row % 5;
    cell.ibImageVew.image = (UIImage*)[self.source objectAtIndex:index];
//    NSLog(@"Table %@",NSStringFromCGRect(tableView.frame)); 
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.ibTableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
