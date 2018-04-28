//
//  ProfileViewController.m
//  Evenire
//
//  Created by swati wasal on 15/07/17.
//  Copyright © 2017 swatiwasal. All rights reserved.
//

#import "ProfileViewController.h"
#import "EditProfileViewController.h"

@interface ProfileViewController ()
{
    UIImagePickerController *imgPickerVC;
    
}

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    imgPickerVC=[[UIImagePickerController alloc]init];
    imgPickerVC.delegate=self;
    self.navigationItem.title = @"Profile";
    UIBarButtonItem *customBtn=[[UIBarButtonItem alloc] initWithTitle:@"Custom" style:UIBarButtonItemStylePlain target:self action:@selector(customBtnPressed:)];
    [self.navigationItem setRightBarButtonItem:customBtn];
    
}

-(IBAction)customBtnPressed:(id)sender{


    //Your code here
     [self performSegueWithIdentifier:@"editprofileSegue" sender:nil];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)chooseImg:(UIButton *)sender {
    UIAlertController  *actnSheet=[UIAlertController alertControllerWithTitle:@"Source" message:@"Choose image source" preferredStyle:UIAlertControllerStyleActionSheet];
    [actnSheet addAction:[UIAlertAction actionWithTitle:@"Gallery" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        imgPickerVC.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:imgPickerVC animated:YES completion:nil];
        

    
    }]];
    
  
    
    [actnSheet addAction:[UIAlertAction actionWithTitle:@"Camera" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action)
    {
        imgPickerVC.sourceType=UIImagePickerControllerSourceTypeCamera;
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
           {
            imgPickerVC.sourceType=UIImagePickerControllerSourceTypeCamera;
            [self presentViewController:imgPickerVC animated:YES completion:nil];
           }
        
          [self presentViewController:imgPickerVC animated:YES completion:nil];
            }]];
    
    
    
    [actnSheet addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];
    [ self presentViewController:actnSheet animated:YES completion:nil];

}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    
    self.imgView.image=[info valueForKey:@"UIImagePickerControllerOriginalImage"];
    [imgPickerVC dismissViewControllerAnimated:YES completion:nil];
    
}



-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [imgPickerVC dismissViewControllerAnimated:YES completion:nil];
}









@end
