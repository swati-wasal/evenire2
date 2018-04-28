//
//  ProfileViewController.h
//  Evenire
//
//  Created by swati wasal on 15/07/17.
//  Copyright © 2017 swatiwasal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileViewController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *imgView;
-(IBAction)customBtnPressed:(id)sender;
@end
