//
//  InviteTableViewController.m
//  Evenire
//
//  Created by swati wasal on 17/07/17.
//  Copyright © 2017 swatiwasal. All rights reserved.
//

#import "InviteTableViewController.h"
#import "InviteTableViewCell.h"
#import "CreateViewController.h"
#import "buttonTableViewCell.h"
#import "AppDelegate.h"
@import UserNotifications;
static createFunc *createFun;
static AppDelegate *appdel1;
static NSManagedObjectContext *context2;
static NSPersistentContainer *container2;

#define storyboard [UIStoryboard storyboardWithName:@"Main" bundle:nil]

@interface InviteTableViewController (){
UISearchController *searchController;
UITableViewController *resultController;
    NSMutableArray *eventArray;
    NSMutableString *searchString;
    NSMutableArray *searchResultArray;
    buttonTableViewCell *btnCell;
    NSFetchedResultsController *controller;

}
@end

@implementation InviteTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    eventArray=[[NSMutableArray alloc]init];
    
    createFun=[createFunc sharedCreateFunc];
    
    
    
    resultController =[[UITableViewController alloc]init];
    
    resultController.tableView.delegate=self;
    resultController.tableView.dataSource=self;
    
    
    searchController =[[UISearchController alloc]initWithSearchResultsController:resultController];
    
    self.tableView.tableHeaderView=searchController.searchBar;
    self.definesPresentationContext = YES;
    
    searchController.searchResultsUpdater=self;
    
    self.navigationItem.rightBarButtonItem=self.editButtonItem;
    
    self.navigationItem.title=@"Invites";
}


-(void)setEditing:(BOOL)editing animated:(BOOL)animated{
    
    [super setEditing:editing animated:animated];
    
    
    
    
    
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView==self.tableView)
    {
        
        if (indexPath.section==1) {
            
            return UITableViewCellEditingStyleDelete;
            
        }
        
    }
    return UITableViewCellEditingStyleNone;
    
}


- (void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    
    searchString=searchController.searchBar.text;
    if ([searchString isEqualToString:@""]) {
        
        [resultController.tableView reloadData];
        
    }else{
        
        
        
        NSPredicate * predicate=[NSPredicate predicateWithFormat:@" SELF.eventTitle contains [cd] %@",searchString];
        searchResultArray=[eventArray filteredArrayUsingPredicate:predicate];
        
        
        [resultController.tableView reloadData];
        
        
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView==self.tableView) {
        if (indexPath.section==0) {
            return 55;
        }
        else{
            return 140;
        }
        
    }
    else{
        return 140;
    }
}
-(void)viewWillAppear:(BOOL)animated{
    
    
    eventArray=[[createFun getAllEvents]mutableCopy];
    
    if([eventArray isKindOfClass:[NSMutableArray class]]){
        // This is a nsmutable array
        NSLog(@"this is  mutable");
    }
    else
    {
        NSLog(@"event array is not mutable");
    }
    //reload data of the table view
    [self.tableView reloadData];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (tableView==self.tableView) {
        return 2;
    }
    else
        return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView==self.tableView) {
        if (section==1) {
            return eventArray.count;
        }
        else{
            return 1;
        }
    }
    else{
        
        
        return searchResultArray.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //loading the custom cell to tableView
    
    UITableViewCell *cell;
    InviteTableViewCell *customCell;
    
    if (tableView==self.tableView)
    {
        
        if (indexPath.section==1) {
            customCell =[tableView dequeueReusableCellWithIdentifier:@"customCell1"];
            
            if (customCell==nil) {
                
                //   loading the tableview from xib  file
                
                NSBundle *bundle=[NSBundle mainBundle];
                NSArray *obArr=[bundle loadNibNamed:@"InviteTableViewCell" owner:nil options:nil];
                
                customCell=[obArr objectAtIndex:0];
                
                
            }
            
            HostingTable *hostingTable= [eventArray objectAtIndex:indexPath.row];
            NSDateFormatter *dateformate=[[NSDateFormatter alloc]init];
            [dateformate setDateFormat:@"dd-MM-yyyy"]; // Date formater
            NSString *date = [dateformate stringFromDate:hostingTable.date];
            
            customCell.eventTitle.text=hostingTable.eventTitle;
            customCell.date.text=date;
            customCell.venue.text=hostingTable.venue;
            
            NSData *imageData=hostingTable.eventImage;
            if(imageData==nil){
                customCell.img.image=[UIImage imageNamed:@"noimage"];
            }
            else{
                customCell.img.image=[UIImage imageWithData:imageData];
            }
            
            
            return customCell;
            
            
        }
        else{
            
            if (tableView==self.tableView) {
                
                
                btnCell =[tableView dequeueReusableCellWithIdentifier:@"buttonTableViewCell"];
                
                if (btnCell==nil) {
                    
                    //   loading the tableview from xib  file
                    
                    NSBundle *bundle=[NSBundle mainBundle];
                    NSArray *obArr=[bundle loadNibNamed:@"buttonTableViewCell" owner:nil options:nil];
                    
                    btnCell=[obArr objectAtIndex:0];
                    
                    btnCell.btn.tag = indexPath.row;
                    [btnCell.btn addTarget:self action:@selector(pushButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
                    
                    
                    
                }
                
                return btnCell;
                
            }
        }
    }
    else{
        
        
        
        //   loading the tableview from xib  file
        
        NSBundle *bundle=[NSBundle mainBundle];
        NSArray *obArr=[bundle loadNibNamed:@"HostTableViewCell" owner:nil options:nil];
        
        customCell=[obArr objectAtIndex:0];
        if (customCell==nil) {
            customCell =[tableView dequeueReusableCellWithIdentifier:@"customCell1"];
            
            
            
        }
        
        HostingTable *host;
        
        host =[searchResultArray objectAtIndex:indexPath.row];
        NSDateFormatter *dateformate=[[NSDateFormatter alloc]init];
        [dateformate setDateFormat:@"dd-MM-yyyy"]; // Date formater
        NSString *date = [dateformate stringFromDate:host.date];
        
        customCell.eventTitle.text=host.eventTitle;
        customCell.date.text=date;
        customCell.venue.text=host.venue;
        
        NSData *imageData=host.eventImage;
        if(imageData==nil){
            customCell.img.image=[UIImage imageNamed:@"noimage"];
        }
        else{
            customCell.img.image=[UIImage imageWithData:imageData];
        }
        
        return customCell;
        
        
    }
    
    
    return cell;
}
-(void)pushButtonClicked:(id)sender
{
    CreateViewController *cvc = [storyboard instantiateViewControllerWithIdentifier:@"CreateViewController"];
    
    [self.navigationController pushViewController:cvc animated:YES];
    
    
    
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView==self.tableView)
    {
        
        if (indexPath.section==1) {
            
            DetailViewController2 *dvc = [storyboard instantiateViewControllerWithIdentifier:@"DetailViewController2"];
            
            dvc.hostingTable=[eventArray objectAtIndex:indexPath.row];
            [self.navigationController pushViewController:dvc animated:YES];
        }
    }
    else
    {
        DetailViewController2 *dvc = [storyboard instantiateViewControllerWithIdentifier:@"DetailViewController2"];
        
        dvc.hostingTable=[searchResultArray objectAtIndex:indexPath.row];
        [self.navigationController pushViewController:dvc animated:YES];
    }
    
}
/*
 -(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath*)indexPath {
 if (tableView==self.tableView)
 {
 
 if (indexPath.section==1) {
 
 
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 NSManagedObject *managedObject = [self.controll objectAtIndexPath:indexPath];
 [self.managedObjectContext deleteObject:managedObject];
 [self.managedObjectContext save:nil];
 }
 }
 }
 }
 */


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        appdel1=(AppDelegate *)[UIApplication sharedApplication].delegate;
        container2= appdel1.persistentContainer;
        
        context2=container2.viewContext;
        
        [context2 deleteObject:[eventArray objectAtIndex:indexPath.row]];
        
        
        
        
        
        NSError *error;
        
        [context2 save:&error];
        
        if (error==nil) {
            
            NSLog(@"Deletion Successful");
            
        }
        
        
        
        [eventArray removeObjectAtIndex:indexPath.row];
        
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        [tableView setEditing:NO animated:YES];
        
        
        
        
        
    } //else if (editingStyle == UITableViewCellEditingStyleInsert) {
    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    // }
}


/*
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}






#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}

*/
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
