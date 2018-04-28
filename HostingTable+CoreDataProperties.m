//
//  HostingTable+CoreDataProperties.m
//  Evenire
//
//  Created by swati wasal on 15/08/17.
//  Copyright © 2017 swatiwasal. All rights reserved.
//

#import "HostingTable+CoreDataProperties.h"

@implementation HostingTable (CoreDataProperties)

+ (NSFetchRequest<HostingTable *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"HostingTable"];
}

@dynamic date;
@dynamic eventImage;
@dynamic eventTitle;
@dynamic time;
@dynamic venue;
@dynamic eventDetail;

@end
