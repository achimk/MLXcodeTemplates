//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ___VARIABLE_classPrefix:identifier___ViewController : UIViewController

@property (nonatomic, readonly, assign) BOOL appearsFirstTime;
@property (nonatomic, readonly, assign, getter = isViewVisible) BOOL viewVisible;

@end

@interface ___VARIABLE_classPrefix:identifier___ViewController (___VARIABLE_classPrefix:identifier___SubclassOnly)

- (void)finishInitialize;

@end
