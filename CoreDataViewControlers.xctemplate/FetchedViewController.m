//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

#import "___VARIABLE_classPrefix:identifier___FetchedViewController.h"

#pragma mark - ___VARIABLE_classPrefix:identifier___FetchedViewController

@interface ___VARIABLE_classPrefix:identifier___FetchedViewController () {
    BOOL _needsFetch;
}

@property (nonatomic, readwrite, strong) NSFetchedResultsController * fetchedResultsController;

@end

#pragma mark -

@implementation ___VARIABLE_classPrefix:identifier___FetchedViewController

@synthesize fetchedResultsController = _fetchedResultsController;
@dynamic empty;

+ (Class)defaultFetchedResultsControllerClass {
    return [NSFetchedResultsController class];
}

#pragma mark Init

- (id)initWithFetchedResultsController:(NSFetchedResultsController *)fetchedResultsController {
    if (self = [self initWithNibName:nil bundle:nil]) {
        self.fetchedResultsController = fetchedResultsController;
    }
    
    return self;
}

- (void)finishInitialize {
    [super finishInitialize];
    
    _needsFetch = YES;
    _changeType = ___VARIABLE_classPrefix:identifier___ChangeTypeUpdate;
}

#pragma mark View

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self fetchIfNeeded];
}

- (void)viewWillAppear:(BOOL)animated {
    [self fetchIfNeeded];
    
    [super viewWillAppear:animated];
}

#pragma mark Accessors

- (void)setFetchedResultsController:(NSFetchedResultsController *)fetchedResultsController {
    if (fetchedResultsController != _fetchedResultsController) {
        if (_fetchedResultsController) {
            _fetchedResultsController.delegate = nil;
        }
        
        _fetchedResultsController = fetchedResultsController;
        
        if (fetchedResultsController) {
            fetchedResultsController.delegate = self;
        }
    }
}

- (NSFetchedResultsController *)fetchedResultsController {
    if (!_fetchedResultsController) {
        [self willCreateFetchedResultsController];
        
        NSFetchedResultsController * fetchedResultsController = [[[[self class] defaultFetchedResultsControllerClass] alloc] initWithFetchRequest:self.fetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:self.sectionNameKeyPath cacheName:self.cacheName];
        self.fetchedResultsController = fetchedResultsController;
        
        [self didCreateFetchedResultsController];
    }
    
    return _fetchedResultsController;
}

- (BOOL)isEmpty {
    [self fetchIfNeeded];
    return (0 == self.fetchedResultsController.fetchedObjects.count);
}

#pragma mark Configure NSFetchedResutlsController

- (NSString *)entityName {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:[NSString stringWithFormat:@"You must override %@ in subclass.", NSStringFromSelector(_cmd)]
                                 userInfo:nil];
    return nil;
}

- (NSManagedObjectContext *)managedObjectContext {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:[NSString stringWithFormat:@"You must override %@ in subclass.", NSStringFromSelector(_cmd)]
                                 userInfo:nil];
    return nil;
}

- (NSFetchRequest *)fetchRequest {
    NSFetchRequest * fetchRequest = [NSFetchRequest new];
    fetchRequest.entity = [NSEntityDescription entityForName:self.entityName
                                      inManagedObjectContext:self.managedObjectContext];
    fetchRequest.sortDescriptors = self.sortDescriptors;
    fetchRequest.predicate = self.predicate;
    fetchRequest.fetchBatchSize = ___VARIABLE_classPrefix:identifier___FetchedResultsBatchSize;
    fetchRequest.returnsObjectsAsFaults = NO;
    
    return fetchRequest;
}

- (NSArray *)sortDescriptors {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:[NSString stringWithFormat:@"You must override %@ in subclass.", NSStringFromSelector(_cmd)]
                                 userInfo:nil];
    return nil;
}

- (NSPredicate *)predicate {
    return nil;
}

- (NSString *)sectionNameKeyPath {
    return nil;
}

- (NSString *)cacheName {
    return nil;
}

- (void)willCreateFetchedResultsController {
    //Subclasses may override this method
}

- (void)didCreateFetchedResultsController {
    //Subclasses may override this method
}

- (NSIndexPath *)viewIndexPathForFetchedIndexPath:(NSIndexPath *)fetchedIndexPath {
    return [self viewIndexPathForController:self.fetchedResultsController fetchedIndexPath:fetchedIndexPath];
}

- (NSIndexPath *)viewIndexPathForController:(NSFetchedResultsController *)controller fetchedIndexPath:(NSIndexPath *)fetchedIndexPath {
    NSParameterAssert(controller);
    return fetchedIndexPath;
}

- (NSIndexPath *)fetchedIndexPathForViewIndexPath:(NSIndexPath *)viewIndexPath {
    return [self fetchedIndexPathForController:self.fetchedResultsController viewIndexPath:viewIndexPath];
}

- (NSIndexPath *)fetchedIndexPathForController:(NSFetchedResultsController *)controller viewIndexPath:(NSIndexPath *)viewIndexPath {
    NSParameterAssert(controller);
    return viewIndexPath;
}

- (id)objectForViewIndexPath:(NSIndexPath *)viewIndexPath {
    return [self objectForController:self.fetchedResultsController viewIndexPath:viewIndexPath];
}

- (id)objectForController:(NSFetchedResultsController *)controller viewIndexPath:(NSIndexPath *)viewIndexPath {
    NSParameterAssert(controller);
    return [controller objectAtIndexPath:[self fetchedIndexPathForController:controller viewIndexPath:viewIndexPath]];
}

#pragma mark Fetch Data

- (void)setNeedsFetch {
    _needsFetch = YES;
}

- (BOOL)needsFetch {
    return _needsFetch;
}

- (void)fetchIfNeeded {
    if (self.needsFetch) {
        [self performFetch];
    }
}

- (void)fetchIfVisible {
    if (self.isViewVisible) {
        [self performFetch];
    }
}

- (void)performFetch {
    NSAssert2([NSThread isMainThread], @"%@: %@ must be called on main thread", [self class], NSStringFromSelector(_cmd));
    _needsFetch = NO;
    
    if (self.fetchedResultsController) {
        if (self.cacheName) {
            [NSFetchedResultsController deleteCacheWithName:self.cacheName];
        }
        
        self.fetchedResultsController.fetchRequest.predicate = self.predicate;
        self.fetchedResultsController.fetchRequest.sortDescriptors = self.sortDescriptors;
        NSError * fetchError = nil;
        
        if (![self.fetchedResultsController performFetch:&fetchError]) {
            NSAssert2(NO, @"Unresolved fetched results controller error: %@, %@", fetchError, fetchError.userInfo);
        }
    }
}

#pragma mark NSFetchedResultsControllerDelegate

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
}

- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id<NSFetchedResultsSectionInfo>)sectionInfo atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type {
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath {

}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
}

@end
