//
//  CreateViewController.h
//  Evenire
//
//  Created by swati wasal on 20/07/17.
//  Copyright © 2017 swatiwasal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HostingTable+CoreDataClass.h"
#import "AppDelegate.h"
#import <EventKit/EventKit.h>
#import <UserNotifications/UserNotifications.h>

static AppDelegate *appD;
static NSManagedObjectContext *context=nil;
static NSPersistentContainer *container=nil;


@interface CreateViewController : UIViewController<UITextFieldDelegate,UITextViewDelegate,UIImagePickerControllerDelegate,UIScrollViewDelegate>
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UITextField *dateTextField;

@property (strong, nonatomic) IBOutlet UITextField *timeTextField;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *topDistCons;
- (IBAction)datePicker:(id)sender;
- (IBAction)cancelActn:(id)sender;
- (IBAction)doneActn:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *backgroundBtn;
@property (strong, nonatomic) IBOutlet UITextField *eventTitle;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *topDisCons2;
- (IBAction)timePicker:(id)sender;
- (IBAction)cancelActn1:(id)sender;
- (IBAction)doneActn1:(id)sender;
- (IBAction)cameraBtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *imgView;

@property (strong, nonatomic) IBOutlet UITextField *venue;
- (IBAction)saveActn:(id)sender;

@property (strong, nonatomic) IBOutlet UIDatePicker *timePicker;
@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (strong, nonatomic) IBOutlet UITextView *detail;


@property HostingTable *recievedEvent;

@end
