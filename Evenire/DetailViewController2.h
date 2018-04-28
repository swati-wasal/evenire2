//
//  DetailViewController2.h
//  Evenire
//
//  Created by swati wasal on 04/10/17.
//  Copyright © 2017 swatiwasal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HostingTable+CoreDataProperties.h"
#import "AppDelegate.h"
static AppDelegate *appD;

@interface DetailViewController2 : UIViewController
@property HostingTable *hostingTable;
@property (strong, nonatomic) IBOutlet UILabel *eventTitle;
@property (strong, nonatomic) IBOutlet UIImageView *eventImg;
@property (strong, nonatomic) IBOutlet UILabel *eventDate;
@property (strong, nonatomic) IBOutlet UILabel *eventTime;
@property (strong, nonatomic) IBOutlet UILabel *eventVenue;
@property (strong, nonatomic) IBOutlet UILabel *eventDetail;

@end

