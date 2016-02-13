//
//  PAWTestValues.h
//  CoreDataBackground
//
//  Created by Pawel Walicki on 13/02/16.
//  Copyright © 2016 Pawel Walicki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface PAWTestValues : NSManagedObject

+(instancetype) testValueWithValue:(NSString*) value
                            entity:(NSEntityDescription*) entitiy
                           context:(NSManagedObjectContext*) context;

-(instancetype) initWithValue:(NSString*) value
                       entity:(NSEntityDescription*) entitiy
                      context:(NSManagedObjectContext*) context;


@end

NS_ASSUME_NONNULL_END

#import "PAWTestValues+CoreDataProperties.h"
