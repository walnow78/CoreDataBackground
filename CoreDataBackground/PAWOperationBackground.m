//
//  PAWOperationBackground.m
//  CoreDataBackground
//
//  Created by Pawel Walicki on 13/02/16.
//  Copyright © 2016 Pawel Walicki. All rights reserved.
//

#import "PAWOperationBackground.h"
#import "PAWTestValues.h"

@interface PAWOperationBackground ()

@property (strong, nonatomic) NSManagedObjectContext *privateManagedObjectContext;

@end

@implementation PAWOperationBackground

- (instancetype) initWithValue:(NSString *) value{

    if (self = [super init]) {
        _value = value;
    }
    
    return self;
}


- (void)main{
    
    self.privateManagedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    
    // Configuration privateManagedObjectContext
    
    [self.privateManagedObjectContext setPersistentStoreCoordinator:self.mainManagedObjectContext.persistentStoreCoordinator];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"TestValues"
                                              inManagedObjectContext:self.privateManagedObjectContext];
    
    // Create the record.
    
    [PAWTestValues testValueWithValue:self.value
                               entity:entity
                              context:self.privateManagedObjectContext];
    
    // Save the context
    
    if ([self.privateManagedObjectContext hasChanges]) {
        
        NSError *error;
        [self.privateManagedObjectContext save:&error];
    }
}

@end
