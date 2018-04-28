//
//  buttonTableViewCell.h
//  Evenire
//
//  Created by swati wasal on 25/08/17.
//  Copyright © 2017 swatiwasal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface buttonTableViewCell : UITableViewCell

- (IBAction)btn:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *btn;

@end
