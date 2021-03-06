//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

#import "___VARIABLE_classPrefix:identifier___TableViewController.h"

@interface ___VARIABLE_classPrefix:identifier___FetchedTableViewController : ___VARIABLE_classPrefix:identifier___TableViewController <NSFetchedResultsControllerDelegate>

@property (nonatomic, readonly, strong) NSFetchedResultsController * fetchedResultsController;
@property (nonatomic, readonly, assign, getter = isEmpty) BOOL empty;
@property (nonatomic ,readwrite, assign) ___VARIABLE_classPrefix:identifier___ChangeType changeType;

- (id)initWithFetchedResultsController:(NSFetchedResultsController *)fetchedResultsController;

- (void)setNeedsFetch;
- (BOOL)needsFetch;

- (void)fetchIfNeeded;
- (void)fetchIfVisible;
- (void)performFetch;

@end

@interface ___VARIABLE_classPrefix:identifier___FetchedTableViewController (___VARIABLE_classPrefix:identifier___SubclassOnly)

//NSFetchedResultsController configuration methods
+ (Class)defaultFetchedResultsControllerClass;
- (NSString *)entityName;
- (NSManagedObjectContext *)managedObjectContext;
- (NSFetchRequest *)fetchRequest;
- (NSArray *)sortDescriptors;
- (NSPredicate *)predicate;
- (NSString *)sectionNameKeyPath;
- (NSString *)cacheName;

//NSFetchedResultsController observe methods
- (void)willCreateFetchedResultsController;
- (void)didCreateFetchedResultsController;

//NSIndexPath manipulation during update NSFetchedResultsController
- (NSIndexPath *)viewIndexPathForFetchedIndexPath:(NSIndexPath *)fetchedIndexPath;
- (NSIndexPath *)viewIndexPathForController:(NSFetchedResultsController *)controller fetchedIndexPath:(NSIndexPath *)fetchedIndexPath;

- (NSIndexPath *)fetchedIndexPathForViewIndexPath:(NSIndexPath *)viewIndexPath;
- (NSIndexPath *)fetchedIndexPathForController:(NSFetchedResultsController *)controller viewIndexPath:(NSIndexPath *)viewIndexPath;

- (id)objectForViewIndexPath:(NSIndexPath *)viewIndexPath;
- (id)objectForController:(NSFetchedResultsController *)controller viewIndexPath:(NSIndexPath *)viewIndexPath;

@end
