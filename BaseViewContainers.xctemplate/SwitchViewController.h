//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

#import "___VARIABLE_classPrefix:identifier___ViewController.h"

@interface ___VARIABLE_classPrefix:identifier___SwitchViewController : ___VARIABLE_classPrefix:identifier___ViewController

@property (nonatomic, readonly, strong) IBOutlet UIView * containerView;
@property (nonatomic, readwrite, copy) NSArray * viewControllers;
@property (nonatomic, readwrite, assign) NSUInteger selectedIndex;
@property (nonatomic, readwrite, strong) UIViewController * selectedViewController;

+ (Class)defaultContainerViewClass;

@end

@interface ___VARIABLE_classPrefix:identifier___SwitchViewController (___VARIABLE_classPrefix:identifier___SubclassOnly)

- (void)replaceViewController:(UIViewController *)existingViewController
           withViewController:(UIViewController *)newViewController
              inContainerView:(UIView *)containerView
           ignoringAppearance:(BOOL)ignoringAppearance
                   completion:(void (^)(void))completion;

@end
