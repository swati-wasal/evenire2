//
//  EditProfileViewController.h
//  Evenire
//
//  Created by swati wasal on 24/07/17.
//  Copyright © 2017 swatiwasal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditProfileViewController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *imgView;
- (IBAction)chooseImg:(UIButton *)sender;

@end
