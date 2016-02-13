//
//  PAWOperationBackground.h
//  CoreDataBackground
//
//  Created by Pawel Walicki on 13/02/16.
//  Copyright © 2016 Pawel Walicki. All rights reserved.
//

@import Foundation;
@import CoreData;

@interface PAWOperationBackground : NSOperation

- (instancetype) initWithValue:(NSString *) value;

@property (strong, nonatomic) NSString *value;
@property (strong, nonatomic) NSManagedObjectContext *mainManagedObjectContext;

@end
