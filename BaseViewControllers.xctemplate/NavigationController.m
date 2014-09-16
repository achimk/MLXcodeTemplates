//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

#import "___VARIABLE_classPrefix:identifier___NavigationController.h"

#pragma mark - ___VARIABLE_classPrefix:identifier___NavigationController

@interface ___VARIABLE_classPrefix:identifier___NavigationController ()

@end

#pragma mark -

@implementation ___VARIABLE_classPrefix:identifier___NavigationController

@synthesize appearsFirstTime = _appearsFirstTime;
@synthesize viewVisible = _viewVisible;

#pragma mark Init

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self finishInitialize];
    }
    
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        [self finishInitialize];
    }
    
    return self;
}

- (void)finishInitialize {
    _appearsFirstTime = YES;
    _viewVisible = NO;
}

#pragma mark View

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    _viewVisible = YES;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    _appearsFirstTime = NO;
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    _viewVisible = NO;
}

@end
