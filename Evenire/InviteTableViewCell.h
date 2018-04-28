//
//  InviteTableViewCell.h
//  Evenire
//
//  Created by swati wasal on 06/11/17.
//  Copyright © 2017 swatiwasal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InviteTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *date;
@property (strong, nonatomic) IBOutlet UILabel *venue;
@property (strong, nonatomic) IBOutlet UIImageView *img;
@property (strong, nonatomic) IBOutlet UILabel *eventTitle;

@end
