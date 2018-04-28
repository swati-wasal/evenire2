//
//  DetailViewController.m
//  Evenire
//
//  Created by swati wasal on 23/07/17.
//  Copyright © 2017 swatiwasal. All rights reserved.
//

#import "DetailViewController.h"
static NSManagedObjectContext *context=nil;
static NSPersistentContainer *container=nil;


@interface DetailViewController ()

@end

@implementation DetailViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    appD=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    //starts accessing the CoreData Stack
    
    container= appD.persistentContainer;
    
    context=container.viewContext;
    
    
    
    //starts accessing the CoreData Stack
    
    
    NSFetchRequest *request=[NSFetchRequest fetchRequestWithEntityName:@"HostingTable"];
    
    
    request.predicate=[NSPredicate predicateWithFormat:@"eventTitle == %@",self.tranStr];
    
    
    NSArray *dataArr= [context executeFetchRequest:request error:nil];
    
    
    HostingTable *retDataTable=[dataArr objectAtIndex:0];
    NSData *imageData=retDataTable.eventImage;
    if(imageData==nil){
        self.eventImg.image=[UIImage imageNamed:@"noimage"];
    }
    else{
        self.eventImg.image=[UIImage imageWithData:imageData];
    }
  //  self.imgView.image = [UIImage imageWithData:retDataTable.imgData];
    self.eventTitle.text = retDataTable.eventTitle;
    self.eventVenue.text=retDataTable.venue;
    
    NSDateFormatter *dateFormatter1 = [[NSDateFormatter alloc] init];
    dateFormatter1.dateFormat = @"dd-MM-yyyy";
    self.eventDate.text=[dateFormatter1 stringFromDate:retDataTable.date];
    
    NSDateFormatter *dateFormatter2 = [[NSDateFormatter alloc] init];
    dateFormatter2.dateFormat = @"hh:mm a";
    self.eventTime.text=[dateFormatter2 stringFromDate:retDataTable.time];
    
    self.eventDetail.text=retDataTable.eventDetail;
    
    
    

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

@end
