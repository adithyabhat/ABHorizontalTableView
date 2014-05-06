//
//  ABHorizontalTableView
//
//  Created by Adithya Bhat on 08/02/12.
//

/*****************************************************************
 The view creates a horizontal tableview. Just use this class
 as class of the tableview. The implementinf controller must conform
 to NKTHorizontalTableViewDelegate protocol. 
 
 **************** NOTE ****************
 Among assigning the delegate and datasource, only the delegate
 is to be assigned. DO NOT ASSIGN ANYTHING TO THE DATASOURCE.
 Initialize the tableviewcontroller member to the controller
 which makes use of it. It is used to make forward invocation.
 
 https://github.com/andrewgubanov/OrientedTableView project used
 as reference.
 *****************************************************************/


#import <Foundation/Foundation.h>


@interface ABHorizontalTableView : UITableView <UITableViewDataSource>
{
    id<UITableViewDataSource,UITableViewDelegate> _tableViewController;     //Used for forward invocation. This has to be intialized to the controller making use of this class.
}

@property (nonatomic, retain) id<UITableViewDataSource,UITableViewDelegate> tableViewController;

- (void)rotateTableView;


@end
