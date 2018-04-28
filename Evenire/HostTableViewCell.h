//
//  HostTableViewCell.h
//  Evenire
//
//  Created by swati wasal on 24/08/17.
//  Copyright © 2017 swatiwasal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HostTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *eventTitle;
@property (strong, nonatomic) IBOutlet UILabel *date;

@property (strong, nonatomic) IBOutlet UILabel *venue;
@property (strong, nonatomic) IBOutlet UIImageView *img;
@end
