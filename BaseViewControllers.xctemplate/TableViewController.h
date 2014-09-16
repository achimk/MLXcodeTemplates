//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

#import "___VARIABLE_classPrefix:identifier___ViewController.h"

@interface ___VARIABLE_classPrefix:identifier___TableViewController : ___VARIABLE_classPrefix:identifier___ViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, readwrite, strong) IBOutlet UITableView * tableView;
@property (nonatomic, readwrite, assign) BOOL clearsSelectionOnViewWillAppear;
@property (nonatomic, readwrite, assign) BOOL clearsSelectionOnReloadData;
@property (nonatomic, readwrite, assign) BOOL reloadOnAppearsFirstTime;
@property (nonatomic, readwrite, assign) BOOL showsBackgroundView;

+ (UITableViewStyle)defaultTableViewStyle;

- (id)initWithStyle:(UITableViewStyle)style;

- (void)setNeedsReload;
- (BOOL)needsReload;

- (void)reloadIfNeeded;
- (void)reloadIfVisible;
- (void)reloadData;

@end

@interface ___VARIABLE_classPrefix:identifier___TableViewController (___VARIABLE_classPrefix:identifier___SubclassOnly)

- (UIView *)backgroundViewForTableView:(UITableView *)tableView;

@end
