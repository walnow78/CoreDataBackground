//
//  PAWMainViewController.m
//  CoreDataBackground
//
//  Created by Pawel Walicki on 13/02/16.
//  Copyright © 2016 Pawel Walicki. All rights reserved.
//

#import "PAWMainViewController.h"
#import "PAWOperationBackground.h"
#import "AppDelegate.h"
#import "PAWTestValues.h"

@interface PAWMainViewController ()

@property(nonatomic,strong) NSOperationQueue *operationQueue;

@end

@implementation PAWMainViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"MainController";
}

#pragma mark - Actions

- (IBAction)newRecordButtons:(id)sender {
    
    [self createRecord];
}

- (IBAction)logButton:(id)sender {
    
    [self showLog];
    
}

#pragma mark - Private methods

- (void)createRecord{
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    PAWOperationBackground *operation = [[PAWOperationBackground alloc] initWithValue:@"value for record"];
    
    [operation setMainManagedObjectContext:appDelegate.managedObjectContext];
    
    self.operationQueue = [[NSOperationQueue alloc] init];
    
    // Add to Operation Queue
    [self.operationQueue addOperation:operation];

}

- (void)showLog{
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"TestValues"];
    
    NSError *error;
    
    NSArray *results = [appDelegate.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    if (!error) {
        
        for (PAWTestValues *each in results) {
            NSLog(@"%@", each.column);
        }
        
    }
}

@end
