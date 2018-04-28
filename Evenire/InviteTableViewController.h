//
//  InviteTableViewController.h
//  Evenire
//
//  Created by swati wasal on 17/07/17.
//  Copyright © 2017 swatiwasal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HostingTable+CoreDataClass.h"
#import "createFunc.h"
#import "DetailViewController2.h"
@interface InviteTableViewController : UITableViewController<UISearchResultsUpdating,UISearchResultsUpdating,UITableViewDelegate,UITableViewDataSource,UITableViewDelegate,NSFetchedResultsControllerDelegate>

@property HostingTable *HostingTable1;

@end
