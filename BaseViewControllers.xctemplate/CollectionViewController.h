//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

#import "___VARIABLE_classPrefix:identifier___ViewController.h"

@interface ___VARIABLE_classPrefix:identifier___CollectionViewController : ___VARIABLE_classPrefix:identifier___ViewController <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, readwrite, strong) IBOutlet UICollectionView * collectionView;
@property (nonatomic, readonly, strong) UICollectionViewLayout * collectionViewLayout;
@property (nonatomic, readwrite, assign) BOOL clearsSelectionOnViewWillAppear;
@property (nonatomic, readwrite, assign) BOOL clearsSelectionOnReloadData;
@property (nonatomic, readwrite, assign) BOOL reloadOnCurrentLocaleChange;
@property (nonatomic, readwrite, assign) BOOL reloadOnAppearsFirstTime;
@property (nonatomic, readwrite, assign) BOOL showsBackgroundView;

+ (Class)defaultCollectionViewLayoutClass;

- (id)initWithCollectionViewLayout:(UICollectionViewLayout *)layout;

- (void)setNeedsReload;
- (BOOL)needsReload;

- (void)reloadIfNeeded;
- (void)reloadIfVisible;
- (void)reloadData;

@end

@interface ___VARIABLE_classPrefix:identifier___CollectionViewController (___VARIABLE_classPrefix:identifier___SubclassOnly)

- (UIView *)backgroundViewForCollectionView:(UICollectionView *)collectionView;

@end

@interface ___VARIABLE_classPrefix:identifier___CollectionViewController (___VARIABLE_classPrefix:identifier___Notifications)

- (void)currentLocaleDidChangeNotification:(NSNotification *)aNotification;

@end