//
//  DetailViewController2.m
//  Evenire
//
//  Created by swati wasal on 04/10/17.
//  Copyright © 2017 swatiwasal. All rights reserved.
//

#import "DetailViewController2.h"
static NSManagedObjectContext *context=nil;
static NSPersistentContainer *container=nil;



@interface DetailViewController2 ()

@end

@implementation DetailViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    appD=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    //starts accessing the CoreData Stack
    
    container= appD.persistentContainer;
    
    context=container.viewContext;
    

    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    NSData *imageData=self.hostingTable.eventImage;
    if(imageData==nil){
        self.eventImg.image=[UIImage imageNamed:@"noimage"];
    }
    else{
        self.eventImg.image=[UIImage imageWithData:imageData];
    }
    self.eventTitle.text=self.hostingTable.eventTitle;
    self.eventVenue.text=self.hostingTable.venue;
    
    NSDateFormatter *dateFormatter1 = [[NSDateFormatter alloc] init];
    dateFormatter1.dateFormat = @"dd-MM-yyyy";
    self.eventDate.text=[dateFormatter1 stringFromDate:self.hostingTable.date];
    
    NSDateFormatter *dateFormatter2 = [[NSDateFormatter alloc] init];
    dateFormatter2.dateFormat = @"hh:mm a";
    self.eventTime.text=[dateFormatter2 stringFromDate:self.hostingTable.time];
    
    self.eventDetail.text=self.hostingTable.eventDetail;
    
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
