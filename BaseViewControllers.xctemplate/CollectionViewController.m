//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

#import "___VARIABLE_classPrefix:identifier___CollectionViewController.h"

#pragma mark - ___VARIABLE_classPrefix:identifier___CollectionViewController

@interface ___VARIABLE_classPrefix:identifier___CollectionViewController () {
    BOOL _needsReload;
}

@end

#pragma mark -

@implementation ___VARIABLE_classPrefix:identifier___CollectionViewController

@dynamic collectionViewLayout;
@dynamic showsBackgroundView;

+ (Class)defaultCollectionViewLayoutClass {
    return [UICollectionViewFlowLayout class];
}

#pragma mark Init

- (id)initWithCollectionViewLayout:(UICollectionViewLayout *)layout {
    NSParameterAssert(layout);
    
    if (self = [self initWithNibName:nil bundle:nil]) {
        if (!layout) {
            layout = [[[self class] defaultCollectionViewLayoutClass] new];
        }
        
        self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    }
    
    return self;
}

- (void)finishInitialize {
    [super finishInitialize];
    
    _needsReload = NO;
    _reloadOnAppearsFirstTime = YES;
    _clearsSelectionOnViewWillAppear = YES;
    _clearsSelectionOnReloadData = NO;
}

#pragma mark View

- (void)loadView {
    [super loadView];
    
    if (!self.isViewLoaded) {
        self.view = [UIView new];
    }
    
    if (!_collectionView) {
        UICollectionViewLayout * layout = [[[self class] defaultCollectionViewLayoutClass] new];
        self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    }
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    if (([[[UIDevice currentDevice] systemVersion] compare:@"7.0" options:NSNumericSearch] != NSOrderedAscending)
        && self.automaticallyAdjustsScrollViewInsets
        && self.appearsFirstTime) {
        
        self.collectionView.contentInset = UIEdgeInsetsMake(self.topLayoutGuide.length, 0.0f, self.bottomLayoutGuide.length, 0.0f);
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (self.reloadOnAppearsFirstTime) {
        [self reloadData];
    }
    else {
        [self reloadIfNeeded];
    }
    
    if (self.clearsSelectionOnViewWillAppear) {
        for (NSIndexPath * indexPath in [[self.collectionView indexPathsForSelectedItems] copy]) {
            [self.collectionView deselectItemAtIndexPath:indexPath animated:animated];
        }
    }
}

#pragma mark Accessors

- (void)setCollectionView:(UICollectionView *)collectionView {
    if (collectionView != _collectionView) {
        if (_collectionView) {
            [_collectionView removeFromSuperview];
            _collectionView.delegate = nil;
            _collectionView.dataSource = nil;
        }
        
        _collectionView = collectionView;
        
        if (collectionView) {
            if (!collectionView.delegate) {
                collectionView.delegate = self;
            }
            
            if (!collectionView.dataSource) {
                collectionView.dataSource = self;
            }
            
            if (!collectionView.superview) {
                collectionView.translatesAutoresizingMaskIntoConstraints = NO;
                [self.view addSubview:collectionView];
                
                NSDictionary * views = @{@"collectionView"  : collectionView};
                [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[collectionView]|" options:0 metrics:nil views:views]];
                [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[collectionView]|" options:0 metrics:nil views:views]];
            }
        }
    }
}

- (UICollectionViewLayout *)collectionViewLayout {
    return (self.collectionView) ? self.collectionView.collectionViewLayout : nil;
}

- (void)setShowsBackgroundView:(BOOL)showsBackgroundView {
    if (showsBackgroundView && !self.isViewLoaded) {
        [self view];
    }
    
    if (showsBackgroundView != self.showsBackgroundView) {
        self.collectionView.backgroundView = (showsBackgroundView) ? [self backgroundViewForCollectionView:self.collectionView] : nil;
    }
}

- (BOOL)showsBackgroundView {
    return (nil != self.collectionView.backgroundView);
}

- (UIView *)backgroundViewForCollectionView:(UICollectionView *)collectionView {
    return nil;
}

#pragma mark Reload Data

- (void)setNeedsReload {
    _needsReload = YES;
}

- (BOOL)needsReload {
    return _needsReload;
}

- (void)reloadIfNeeded {
    if (self.needsReload) {
        [self reloadData];
    }
}

- (void)reloadIfVisible {
    if (self.isViewVisible) {
        [self reloadData];
    }
    else {
        [self setNeedsReload];
    }
}

- (void)reloadData {
    NSAssert2([NSThread isMainThread], @"%@: %@ must be called on main thread", [self class], NSStringFromSelector(_cmd));
    _needsReload = NO;
    
    if (self.isViewVisible) {
        self.reloadOnAppearsFirstTime = NO;
    }
    
    if (self.clearsSelectionOnReloadData) {
        [self.collectionView reloadData];
    }
    else {
        NSArray * selectedItems = [[self.collectionView indexPathsForSelectedItems] copy];
        
        [self.collectionView reloadData];
        
        for (NSIndexPath * indexPath in selectedItems) {
            [self.collectionView selectItemAtIndexPath:indexPath animated:NO scrollPosition:UICollectionViewScrollPositionNone];
        }
    }
}

#pragma mark UICollectionViewDataSource

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:[NSString stringWithFormat:@"%@: NOT IMPLEMENTED.", NSStringFromSelector(_cmd)]
                                 userInfo:nil];
    return nil;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 0;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 0;
}

@end