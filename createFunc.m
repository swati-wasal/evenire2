//
//  createFunc.m
//  Evenire
//
//  Created by swati wasal on 07/08/17.
//  Copyright © 2017 swatiwasal. All rights reserved.
//

#import "createFunc.h"
static AppDelegate *appD;
static NSManagedObjectContext *context=nil;


@implementation createFunc

+(id)sharedCreateFunc{
    
    static createFunc *createF=nil;
    
    if (createF==nil) {
        
        createF =[[createFunc alloc]init];
        
        return createF;
        
    }
    return  createF;
    
}

-(NSMutableArray *)getAllEvents{
    
    appD=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    //starts accessing the CoreData Stack
    
    NSPersistentContainer *container= appD.persistentContainer;
    
    context=container.viewContext;
    
    //fectchRequest
    
    NSFetchRequest *request=[NSFetchRequest fetchRequestWithEntityName:@"HostingTable"];
    
    
    NSMutableArray *eventArr= [context executeFetchRequest:request error:nil];
    
    
    return eventArr;
    
    
    
    
    
    
    
}


 -(BOOL)addEventsToTable:(NSDictionary *)eventInfo{
    
    BOOL flag=0;
    createFunc *eventEntity = [NSEntityDescription insertNewObjectForEntityForName:@"HostingTable" inManagedObjectContext:context];
    
    // setting the values to the record in the table
    
    
    eventEntity.eventTitle=eventInfo[@"eventTitle"];
    eventEntity.eventDetail=eventInfo[@"eventDetail"];
    eventEntity.venue=eventInfo[@"venue"];
     eventEntity.time=eventInfo[@"time"];
    eventEntity.date=eventInfo[@"date"];
    eventEntity.eventImage=eventInfo[@"eventImage"];

    
    
    NSError *error;
    
    [context save:&error];
    
    if (error==nil) {
        flag=1;
    }
    
    return flag;
    
    
    
}


@end
