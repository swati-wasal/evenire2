//
//  HostingTable+CoreDataProperties.h
//  Evenire
//
//  Created by swati wasal on 15/08/17.
//  Copyright © 2017 swatiwasal. All rights reserved.
//

#import "HostingTable+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface HostingTable (CoreDataProperties)

+ (NSFetchRequest<HostingTable *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSDate *date;
@property (nullable, nonatomic, retain) NSData *eventImage;
@property (nullable, nonatomic, copy) NSString *eventTitle;
@property (nullable, nonatomic, copy) NSDate *time;
@property (nullable, nonatomic, copy) NSString *venue;
@property (nullable, nonatomic, copy) NSString *eventDetail;

@end

NS_ASSUME_NONNULL_END
