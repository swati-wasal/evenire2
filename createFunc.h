//
//  createFunc.h
//  Evenire
//
//  Created by swati wasal on 07/08/17.
//  Copyright © 2017 swatiwasal. All rights reserved.
//

#import "HostingTable+CoreDataClass.h"
#import "AppDelegate.h"
@interface createFunc : HostingTable

+(id)sharedCreateFunc;
-(NSMutableArray *)getAllEvents;
-(BOOL)addEventsToTable:(NSDictionary *)eventInfo;


@end
