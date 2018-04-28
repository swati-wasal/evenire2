//
//  CreateViewController.m
//  Evenire
//
//  Created by swati wasal on 20/07/17.
//  Copyright © 2017 swatiwasal. All rights reserved.
//

#import "CreateViewController.h"
#import "DetailViewController.h"
#import "createFunc.h"
static createFunc *createF;


@interface CreateViewController ()
{
    NSArray *eventArr;
    bool flag;
     UITextField *dtext;
     UITextField *ttext;
    UIImagePickerController *imgPickerVC;
    DetailViewController *dvc;


}
@property NSString *date;
@property NSString *time;
#define storyboard [UIStoryboard storyboardWithName:@"Main" bundle:nil]

@end

@implementation CreateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    flag=0;
    _eventTitle.delegate=self;
    _dateTextField.delegate=self;
    _timeTextField.delegate=self;
    _venue.delegate=self;
    _detail.delegate=self;
    dtext=_dateTextField;
    ttext=_timeTextField;
    imgPickerVC=[[UIImagePickerController alloc]init];
    
    imgPickerVC.delegate=self;
     self.imgView.image=[UIImage imageNamed:@"noimage"];
    appD=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    //starts accessing the CoreData Stack
    
    container= appD.persistentContainer;
    
    context=container.viewContext;
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    [self.view addGestureRecognizer:gestureRecognizer];
    UIColor *borderColor = [UIColor colorWithRed:204.0/255.0 green:204.0/255.0 blue:204.0/255.0 alpha:1.0];
    
    _detail.layer.borderColor = borderColor.CGColor;
    _detail.layer.borderWidth = 0.4;
    _detail.layer.cornerRadius = 5.0;
    
}


- (void) hideKeyboard {
    [_eventTitle resignFirstResponder];
    [_venue resignFirstResponder];
    [_detail resignFirstResponder];
   
}
-(void)viewWillAppear:(BOOL)animated{
    self.eventTitle.text=self.recievedEvent.eventTitle;
    self.dateTextField.text=self.recievedEvent.date;
    self.timeTextField.text=self.recievedEvent.time;
    self.venue.text=self.recievedEvent.venue;
    self.detail.text=self.recievedEvent.eventDetail;
    eventArr=[createF getAllEvents];


  }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    

   if(textField==dtext){
           if (flag==NO) {
               [_eventTitle resignFirstResponder];
               [_venue resignFirstResponder];
               [_detail resignFirstResponder];
               

        self.topDistCons.constant=400;
        [UIView animateWithDuration:0.3 animations:^{
            self.backgroundBtn.alpha=0.5;
        }];
        
        [UIView animateWithDuration:0.5 delay:0.1 usingSpringWithDamping:0 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            [self.view layoutIfNeeded];
            //this will allow the fluidity in changing the layout constraint of its subviews
        } completion:nil];
        flag=1;
    }
        return NO;
    }
    else if (textField==ttext)
    { if (flag==NO) {
        self.topDisCons2.constant=400;
        [UIView animateWithDuration:0.3 animations:^{
            self.backgroundBtn.alpha=0.5;
            [_eventTitle resignFirstResponder];
            [_venue resignFirstResponder];
            [_detail resignFirstResponder];
            
            

        }];
        
        [UIView animateWithDuration:0.5 delay:0.1 usingSpringWithDamping:0 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            [self.view layoutIfNeeded];
            //this will allow the fluidity in changing the layout constraint of its subviews
        } completion:nil];
        flag=1;
    }
        return NO;
    }

    

    return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
    [textField becomeFirstResponder];
    
    
}// became first responder
/* - (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
    
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    
    return YES;
    
    
}*/

-(void)textViewDidBeginEditing:(UITextView *)textView{
    [textView becomeFirstResponder];

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)datePicker:(id)sender {
    UIDatePicker * locDatePick=(UIDatePicker *)sender;
    
    self.date=[NSDateFormatter localizedStringFromDate:locDatePick.date dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterNoStyle];
}

- (IBAction)cancelActn:(id)sender {
    self.topDistCons.constant=1200;   //this is not animatable
    [UIView animateWithDuration:0.3 animations:^{
        [self.view layoutIfNeeded];  //this will allow the fluidity in changing the layout constraint of its subviews
        
        self.backgroundBtn.alpha=0;
        
        flag=0;
    } ];
    

}

- (IBAction)doneActn:(id)sender {
    self.topDistCons.constant=1200;   //this is not animatable
    [UIView animateWithDuration:0.3 animations:^{
        [self.view layoutIfNeeded];  //this will allow the fluidity in changing the layout constraint of its subviews
        
        self.backgroundBtn.alpha=0;
        self.dateTextField.text=self.date;

        flag=0;
    } ];

}
- (IBAction)timePicker:(id)sender {
     [_eventTitle resignFirstResponder];
    UIDatePicker * locDatePick=(UIDatePicker *)sender;
    
    self.time=[NSDateFormatter localizedStringFromDate:locDatePick.date dateStyle:NSDateFormatterNoStyle timeStyle:NSDateFormatterShortStyle];
    
}

- (IBAction)cancelActn1:(id)sender {
    self.topDisCons2.constant=1200;   //this is not animatable
    [UIView animateWithDuration:0.3 animations:^{
        [self.view layoutIfNeeded];  //this will allow the fluidity in changing the layout constraint of its subviews
        
        self.backgroundBtn.alpha=0;
        
        flag=0;
    } ];

}

- (IBAction)doneActn1:(id)sender {
    self.topDisCons2.constant=1200;   //this is not animatable
    [UIView animateWithDuration:0.3 animations:^{
        [self.view layoutIfNeeded];  //this will allow the fluidity in changing the layout constraint of its subviews
        
        self.backgroundBtn.alpha=0;
        self.timeTextField.text=self.time;
        
        flag=0;
    } ];
    

}

- (IBAction)cameraBtn:(id)sender {
    UIAlertController  *actnSheet=[UIAlertController alertControllerWithTitle:@"Source" message:@"Choose image source" preferredStyle:UIAlertControllerStyleActionSheet];
   
       [actnSheet addAction:[UIAlertAction actionWithTitle:@"Gallery" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
           imgPickerVC.allowsEditing = YES;

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






- (IBAction)saveActn:(id)sender {
    
    BOOL flag1=0;
    
    
dvc = [storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];

    
    HostingTable *eventEntity = [NSEntityDescription insertNewObjectForEntityForName:@"HostingTable" inManagedObjectContext:context];
    
    // setting the values to the record in the table
    eventEntity.eventTitle=self.eventTitle.text;
      eventEntity.venue=self.venue.text;
    eventEntity.date=self.datePicker.date;
    eventEntity.time=self.timePicker.date;
    eventEntity.eventDetail=self.detail.text;
    NSData *dataImage = UIImageJPEGRepresentation(self.imgView.image, 0.0);

    eventEntity.eventImage=dataImage;
    
 
    
    
    // For that i need a full DATE And TIME
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [calendar components:NSCalendarUnitDay|NSCalendarUnitMonth|NSCalendarUnitYear fromDate:self.datePicker.date];
    NSDateComponents *timeComponents = [calendar components:NSCalendarUnitHour|NSCalendarUnitMinute fromDate:self.timePicker.date];
    
    NSDateComponents *newComponents = [[NSDateComponents alloc]init];
    newComponents.timeZone = [NSTimeZone systemTimeZone];
    [newComponents setDay:[dateComponents day]];
    [newComponents setMonth:[dateComponents month]];
    [newComponents setYear:[dateComponents year]];
    [newComponents setHour:[timeComponents hour]];
    [newComponents setMinute:[timeComponents minute]];
    
   __block NSDate *combDate = [calendar dateFromComponents:newComponents];
    
    
    
    // Creating the EKEvent to be stored into EKCalender as Calender only takes EKEvent in it.
   __block NSString * locTitle = self.eventTitle.text;
   __block NSString * locLocation = self.venue.text;
   __block NSString * locNotes = self.detail.text;

    
   
    
    EKEventStore *store = [EKEventStore new];
    [store requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError *error) {
        if (!granted) { return; }
        EKEvent *event = [EKEvent eventWithEventStore:store];
        event.title = locTitle;
        event.location = locLocation;
        event.notes = locNotes;
        
        event.startDate = combDate;// event date and time combo
        event.endDate = [event.startDate dateByAddingTimeInterval:24*60*60];  //set 1 hour meeting
        event.calendar = [store defaultCalendarForNewEvents];
        NSError *err = nil;
        [store saveEvent:event span:EKSpanThisEvent commit:YES error:&err];
        //eventId = event.eventIdentifier;  //save the event id if you want to access this later
    }];
    
    
    //--- Adding the Event to the Local Notification
    
    
    UNMutableNotificationContent *content =[UNMutableNotificationContent new];
    
    content.title = [NSString localizedUserNotificationStringForKey:[NSString stringWithFormat:@"Event Reminder!:%@",self.eventTitle.text] arguments:nil];
    content.body = [NSString localizedUserNotificationStringForKey:self.venue.text
                                                         arguments:nil];
    
    content.badge= [NSNumber numberWithInt:1];
    content.sound=[UNNotificationSound defaultSound];
    
    
    // preparing the trigger
    
    NSDateComponents *triggerDate = [[NSCalendar currentCalendar] components:NSCalendarUnitYear + NSCalendarUnitMonth +NSCalendarUnitDay + NSCalendarUnitHour + NSCalendarUnitMinute +
                                     NSCalendarUnitSecond fromDate:combDate];
    
    
    UNCalendarNotificationTrigger *trigger = [UNCalendarNotificationTrigger triggerWithDateMatchingComponents:triggerDate
                                                                                                      repeats:NO];
    
    
    
    //preparing the request
    
    
    // eventId to register the Event for local notification
    UNNotificationRequest *request=[UNNotificationRequest requestWithIdentifier:locTitle content:content trigger:trigger];
    
    
    //we get  the obj of notificationCenter and pass the request
    
    UNUserNotificationCenter *centre =[UNUserNotificationCenter currentNotificationCenter];
    
    [centre addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
        if (error==nil) {
            NSLog(@"The notification is success");
            
        }
    }];
    
    
    
////----- Contiune to with Your code
  
       NSError *error;
    
    [context save:&error];
    
    if (error==nil) {
        flag1=1;
    }
  //  dvc.hostingTable=[eventArr];
     // [self.navigationController popViewControllerAnimated:YES];
    
 //   [self.navigationController pushViewController:dvc animated:YES];
   
  
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
     [self.navigationController popViewControllerAnimated:YES];

   dvc  = segue.destinationViewController;
    dvc.tranStr = self.eventTitle.text;
    

}



@end

