//
//  NKTHorizontalTableView.m
//  NKTHorizontalTableView
//
//  Created by Adithya Bhat on 08/02/12.
//

#import "ABHorizontalTableView.h"
#import <objc/runtime.h>


@implementation ABHorizontalTableView

@synthesize tableViewController = _tableViewController;


- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self) {
        [self rotateTableView];
    }
    return self;
}

- (void)setTableViewController:(id<UITableViewDataSource,UITableViewDelegate>)inTableViewController
{
    if (_tableViewController == inTableViewController)
        return;
    
    _tableViewController = inTableViewController;
    self.dataSource = self;                                     //Setting the datasource    
    [self reloadData];
}

- (void)rotateTableView
{
    CGRect frame = self.frame;                                  //Rotate tableview by -90 degrees
    self.transform = CGAffineTransformMakeRotation(-M_PI/2.0);
    self.frame = frame;
}

- (BOOL)respondsToSelector:(SEL)selector
{
    BOOL result = [super respondsToSelector:selector];     //If aSelector is "required" function then responds to selector returns 1. Result returned will be 1. Thus the required functions have to be defined in this class. If its not then forwardInvocation will be called; which will call [super forwardInvocation] and return an Exception! 
    
    //In this case isRequiredMethod is NO! Implies when respondsToSelector is called for some "required" protocol method methodDescription is assigned to nil. 
    struct objc_method_description methodDescription = methodDescription =protocol_getMethodDescription(@protocol(UITableViewDataSource),                                                                                                      selector, NO, YES);

    if(methodDescription.name != nil) {
        //methodDescription.name != nil in 2 cases; 
        //1:Method is "required" function, but is not defined in this class.
        //2:Method is "optional" function.
        result = [self.tableViewController respondsToSelector:selector];
    }
    return result;
}

//Forward Invocation gets called when a function is expeceted to be defined in the class is not defined. Forward invocation is usually called automatically. If the responds to selector function returns YES, and if the function called is then not available in that class; forward invocation gets called.
- (void)forwardInvocation:(NSInvocation *)invocation
{    
    struct objc_method_description methodDescription = methodDescription = protocol_getMethodDescription(@protocol(UITableViewDataSource),[invocation selector], NO, YES);
        
    if (methodDescription.name != nil) {
        [invocation invokeWithTarget:self.tableViewController];
    }
    else {
        [super forwardInvocation:invocation];
    }
}


#pragma mark - Table view datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.tableViewController tableView:self numberOfRowsInSection:section];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableViewController tableView:tableView cellForRowAtIndexPath:indexPath];
    cell.contentView.transform = CGAffineTransformMakeRotation(M_PI/2.0);
    return cell;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    NSArray* visibleTableCellsIndexPaths=[self indexPathsForVisibleRows];
    for (NSIndexPath* aCellsIndex in visibleTableCellsIndexPaths)
    {
        UITableViewCell* cellForIndexPath=[self cellForRowAtIndexPath:aCellsIndex];
        CGFloat heightOfRow = [self.delegate tableView:self heightForRowAtIndexPath:aCellsIndex];
        CGRect frame = CGRectMake(cellForIndexPath.frame.origin.x,cellForIndexPath.frame.origin.y, self.frame.size.height, heightOfRow);
        cellForIndexPath.frame = frame;
    }
}

@end
