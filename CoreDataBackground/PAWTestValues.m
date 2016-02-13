//
//  PAWTestValues.m
//  CoreDataBackground
//
//  Created by Pawel Walicki on 13/02/16.
//  Copyright © 2016 Pawel Walicki. All rights reserved.
//

#import "PAWTestValues.h"

@implementation PAWTestValues

+(instancetype) testValueWithValue:(NSString*) value
                            entity:(NSEntityDescription*) entitiy
                           context:(NSManagedObjectContext*) context{

    return [[PAWTestValues alloc] initWithValue:value entity:entitiy context:context];
    
}


-(instancetype) initWithValue:(NSString*) value
                       entity:(NSEntityDescription*) entitiy
                      context:(NSManagedObjectContext*) context{
    
    if (self = [super initWithEntity:entitiy insertIntoManagedObjectContext:context]) {
        
        self.column = value;
    }
    
    return self;
}


@end
